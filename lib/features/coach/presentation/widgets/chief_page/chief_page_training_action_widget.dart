import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:move_mates_android/features/coach/data/models/coach_up_coming_model.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_clients_entity.dart';
import 'package:move_mates_android/features/coach/presentation/cubit/coach_get_client_list_cubit.dart';

import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';
import '../../../domain/entities/coach_clients_content_entity.dart';
import '../../../domain/entities/coach_up_coming_content_entity.dart';
import '../../cubit/coach_cubit.dart';
import '../../cubit/coach_state.dart';
import 'chief_page_client_training_card_widget.dart';
import 'chief_page_no_clients_message_widget.dart';

class ChiefPageTrainingActionWidget extends StatefulWidget {
  const ChiefPageTrainingActionWidget(
      {super.key,
      required this.currentDate,
      required this.coachCustomDateFormat});

  final String currentDate;
  final DateFormat coachCustomDateFormat;

  @override
  State<ChiefPageTrainingActionWidget> createState() =>
      _ChiefPageTrainingActionWidgetState();
}

class _ChiefPageTrainingActionWidgetState
    extends State<ChiefPageTrainingActionWidget> {
  late final TrainingActionNotifier _trainingActionNotifier;
  late final DateFormat customDateFormat;
  late final DateFormat monthFormat;
  late final DateFormat dayFormat;

  @override
  void initState() {
    _trainingActionNotifier = TrainingActionNotifier();
    customDateFormat = DateFormat('EE, d MM','ru');
    super.initState();
  }

  @override
  void dispose() {
    _trainingActionNotifier.dispose();
    super.dispose();
  }

  bool doesEventsExist(String currentDate, String eventDate) =>
      currentDate == eventDate;

  List<CoachUpComingContentEntity> filterEventsByCurrentDate(
      {required CoachUpComingModel model}) {
    List<CoachUpComingContentEntity> tempContentList = [];

    for (int i = 0; i < model.content.length; i++) {
      var modelContentEvent = model.content.elementAt(i);
      DateTime eventDateNotFormatted = widget.coachCustomDateFormat
          .parse(modelContentEvent.startOfAppointment);
      if (doesEventsExist(widget.currentDate,
          widget.coachCustomDateFormat.format(eventDateNotFormatted))) {
        tempContentList.add(modelContentEvent);
      }
    }
    return tempContentList;
  }

  @override
  Widget build(BuildContext context) {
    //Bloc builder for getting upcoming trainings
    return BlocBuilder<CoachCubit, CoachState>(
        builder: (context, getCoachTrainingsState) {
      if (getCoachTrainingsState is CoachStateLoaded) {
        _trainingActionNotifier.addTrainings(filterEventsByCurrentDate(
            model: (getCoachTrainingsState.model as CoachUpComingModel)));
      }

      //Bloc builder for getting coach's clients
      return BlocBuilder<CoachGetClientListCubit, CoachGetClientListState>(
          builder: (context, getCoachClientsState) {
        if (getCoachClientsState is CoachGetClientListLoaded) {
          _trainingActionNotifier.addClients(
              (getCoachClientsState.model as CoachClientsEntity).content);
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //this builder listens to clients list
            ValueListenableBuilder<List<CoachClientsContentEntity>?>(
                valueListenable: _trainingActionNotifier.clients,
                builder: (context, value, _) {
                  if (value == null || value.isEmpty) {
                    //if clients list is not empty it returns another builder
                    // that listens to upcoming trainings
                    return  (getCoachClientsState is CoachGetClientListLoading)
                        ? Container(
                        margin: EdgeInsets.only(top: 105.h),
                        child: const Center(
                            child: CircularProgressIndicator()))
                        : const ChiefPageNoClientsMessageWidget();
                  }
                  return ValueListenableBuilder<
                          List<CoachUpComingContentEntity>?>(
                      valueListenable: _trainingActionNotifier.trainings,
                      builder: (context, value, _) {
                        if (value == null || value.isEmpty) {
                          return Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(top: 129.h),
                              child: Text(
                                (getCoachTrainingsState is CoachStateLoading)
                                    ? 'Загрузка...'
                                    : 'У вас пока нету тренировок',
                                style: CoachHomeTextStyle.noTraining,
                              ),
                            ),
                          );
                        } else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: value
                                .map((e) => ChiefPageClientTrainingCardWidget(
                                      contentEntity: e,
                                      customDateFormat: customDateFormat,
                                    ))
                                .toList(),
                          );
                        }
                      });
                }),
          ],
        );
      });
    });
  }
}

class TrainingActionNotifier {
  final ValueNotifier<List<CoachUpComingContentEntity>?> trainings =
      ValueNotifier([]);
  final ValueNotifier<List<CoachClientsContentEntity>?> clients =
      ValueNotifier([]);

  void addTrainings(List<CoachUpComingContentEntity> coachTrainings) {
    trainings.value = coachTrainings;
  }

  void addClients(List<CoachClientsContentEntity> coachClients) {
    clients.value = coachClients;
  }

  void dispose() {
    trainings.dispose();
  }
}
