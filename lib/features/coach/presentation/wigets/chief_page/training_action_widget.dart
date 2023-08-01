import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:move_mates_android/features/coach/data/models/coach_up_coming_model.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/auth/custom_snackbar_builder.dart';

import '../../../../../config/theme/colors.dart';
import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';
import '../../../domain/entities/coach_up_coming_content_entity.dart';
import '../../cubit/coach_cubit.dart';
import '../../cubit/coach_state.dart';
import '../../pages/training_session_creation_page.dart';
import 'client_training_card_widget.dart';

class TrainingActionWidget extends StatefulWidget {
  const TrainingActionWidget({super.key});

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachCubit, CoachState>(builder: (context, state) {
      if (state is CoachStateError) {
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          buildCustomAuthSnackBar(state.error);
        });
      }
      if (state is CoachStateLoaded) {
        _trainingActionNotifier
            .addTrainings((state.model as CoachUpComingModel).content);
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          MaterialButton(
            elevation: 0,
            height: 70.h,
            onPressed: () {
              Navigator.of(context).pushNamed(TrainingSessionCreationPage.id);
            },
            color: CoachColor.actionBarBackground,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: const BorderSide(color: CoachColor.actionBarSelected)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Создать свое расписание',
                  style: CoachHomeTextStyle.addNewSchedule,
                ),
                SizedBox(width: 20.w),
                Container(
                  height: 40.r,
                  width: 40.r,
                  decoration: BoxDecoration(
                      color: CoachColor.addNewScheduleButtonBackground,
                      borderRadius: BorderRadius.circular(40.r)),
                  child: const FittedBox(
                      child: Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<List<CoachUpComingContentEntity>?>(
              valueListenable: _trainingActionNotifier.trainings,
              builder: (context, value, _) {
                if (value == null || value.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(top: 129.h),
                    child: Text(
                      (state is CoachStateLoading)
                          ? 'Загрузка...'
                          : 'У вас пока нету тренировок',
                      style: CoachHomeTextStyle.noTraining,
                    ),
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: value
                        .map((e) => ClientTrainingCardWidget(
                              contentEntity: value.first,
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
