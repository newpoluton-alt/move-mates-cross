
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors.dart';
import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';
import '../../pages/training_session_creation_page.dart';

class TrainingActionWidget extends StatelessWidget {
  const TrainingActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
        SizedBox(height: 129.h),
        Text(
          'У вас пока нету тренировок',
          style: CoachHomeTextStyle.noTraining,
        )
      ],
    );
  }
}
