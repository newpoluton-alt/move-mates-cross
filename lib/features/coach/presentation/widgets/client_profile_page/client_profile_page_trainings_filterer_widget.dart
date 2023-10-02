import 'package:flutter/material.dart';

import 'client_profile_page_coming_and_past_trainings_widget.dart';
import 'client_profile_page_training_card_widget.dart';

class ClientProfilePageTrainingsFiltererWidget extends StatefulWidget {
  final bool Function() alternationValue;

  const ClientProfilePageTrainingsFiltererWidget(
      {super.key, required this.alternationValue});

  @override
  State<ClientProfilePageTrainingsFiltererWidget> createState() =>
      _ClientProfilePageTrainingsFiltererWidgetState();
}

class _ClientProfilePageTrainingsFiltererWidgetState
    extends State<ClientProfilePageTrainingsFiltererWidget> {
  late final TrainingsFiltererNotifier filtererNotifier;

  @override
  void initState() {
    filtererNotifier = TrainingsFiltererNotifier();
    filtererNotifier.addTrainings();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<ClientProfilePageTrainingModel>>(
        valueListenable: filtererNotifier.trainings,
        builder: (context, value, _) {
          if (value.isNotEmpty) {
            return Column(
              children: [
                ...filtererNotifier
                    .postOrUpcoming(widget.alternationValue())
                    .map((element) => ClientProfilePageTrainingCardWidget(model: element))
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}


class TrainingsFiltererNotifier {
  ValueNotifier<List<ClientProfilePageTrainingModel>> trainings =
      ValueNotifier([]);

  void addTrainings() {
    if (trainings.value.isEmpty) {
      trainings.value.addAll(_executeArithmeticalOperation(_add));
      trainings.value.addAll(_executeArithmeticalOperation(_subtract));
    }
  }

  List<ClientProfilePageTrainingModel> postOrUpcoming(bool alternationValue) {
    return alternationValue
        ? _acquireUpcomingTrainings()
        : _acquirePastTrainings();
  }

  List<ClientProfilePageTrainingModel> _acquireUpcomingTrainings() {
    return trainings.value
        .where((e) => e.trainingDateTime.isBefore(DateTime.now()))
        .toList();
  }

  List<ClientProfilePageTrainingModel> _acquirePastTrainings() {
    return trainings.value
        .where((e) => e.trainingDateTime.isAfter(DateTime.now()))
        .toList();
  }

  DateTime _add(Duration duration) {
    return DateTime.now().add(duration);
  }

  DateTime _subtract(Duration duration) {
    return DateTime.now().subtract(duration);
  }

  List<ClientProfilePageTrainingModel> _executeArithmeticalOperation(
      DateTime Function(Duration duration) operation) {
    return List<ClientProfilePageTrainingModel>.generate(
        3,
        (index) => ClientProfilePageTrainingModel(
            type: 'Группа',
            place: 'Онлайн',
            trainingDateTime:
                operation(Duration(days: index + 1, hours: index + 1))));
  }
}
