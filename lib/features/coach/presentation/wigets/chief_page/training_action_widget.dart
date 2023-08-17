import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:move_mates_android/features/coach/data/models/coach_up_coming_model.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';
import '../../../domain/entities/coach_up_coming_content_entity.dart';
import '../../cubit/coach_cubit.dart';
import '../../cubit/coach_state.dart';
import '../../pages/choose_your_training_page.dart';
import 'client_training_card_widget.dart';

class TrainingActionWidget extends StatefulWidget {
  const TrainingActionWidget(
      {super.key,
      required this.currentDate,
      required this.coachCustomDateFormat});

  final String currentDate;
  final DateFormat coachCustomDateFormat;

  @override
  State<TrainingActionWidget> createState() => _TrainingActionWidgetState();
}

class _TrainingActionWidgetState extends State<TrainingActionWidget> {
  late final TrainingActionNotifier _trainingActionNotifier;
  late final DateFormat weekFormat;
  late final DateFormat dayFormat;
  late final DateFormat monthFormat;

  @override
  void initState() {
    _trainingActionNotifier = TrainingActionNotifier();
    weekFormat = DateFormat.EEEE('ru');
    dayFormat = DateFormat.d('ru');
    monthFormat = DateFormat.MMMM('ru');
    super.initState();
  }

  @override
  void dispose() {
    _trainingActionNotifier.dispose();
    super.dispose();
  }

  bool doesEventsExist(String currentDate, String eventDate) =>
      currentDate == eventDate;

  List<CoachUpComingContentEntity> filterEventsByCurrentDate
      ({required CoachUpComingModel model}) {
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
    return BlocBuilder<CoachCubit, CoachState>(builder: (context, state) {

      if (state is CoachStateLoaded) {
        _trainingActionNotifier.addTrainings(filterEventsByCurrentDate(
            model: (state.model as CoachUpComingModel)));
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ValueListenableBuilder<List<CoachUpComingContentEntity>?>(
              valueListenable: _trainingActionNotifier.trainings,
              builder: (context, value, _) {
                if (value == null || value.isEmpty) {
                  return Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 129.h),
                      child: Text(
                        (state is CoachStateLoading)
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
                        .map((e) => ClientTrainingCardWidget(
                              contentEntity: e,
                              dayFormat: dayFormat,
                              weekFormat: weekFormat,
                              monthFormat: monthFormat,
                            ))
                        .toList(),
                  );
                }
              }),
        ],
      );
    });
  }
}

class TrainingActionNotifier {
  final ValueNotifier<List<CoachUpComingContentEntity>?> trainings =
      ValueNotifier([]);

  void addTrainings(List<CoachUpComingContentEntity> coachTrainings) {
    trainings.value = coachTrainings;
  }

  void dispose() {
    trainings.dispose();
  }
}
