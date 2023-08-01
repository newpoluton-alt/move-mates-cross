


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors.dart';
import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';
import '../../../../user_auth/presentation/widgets/auth/validation_button_widget.dart';
import '../../../../user_auth/presentation/widgets/signup/asset_icon_widget.dart';
import '../../../domain/entities/coach_up_coming_content_entity.dart';
import 'training_card_time_widget.dart';

class ClientTrainingCardWidget extends StatelessWidget {
  final CoachUpComingContentEntity contentEntity;
  final DateFormat dayFormat;
  final DateFormat weekFormat;
  final DateFormat monthFormat;

  const ClientTrainingCardWidget({
    super.key,
    required this.contentEntity,
    required this.dayFormat,
    required this.weekFormat,
    required this.monthFormat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 161.h,
      margin: EdgeInsets.only(top: 25.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 0.4.r,
          blurRadius: 10.r,
          offset: Offset(0, 1.w),
        )],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 54.r,
                height: 54.r,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(54.r),
                    color: CoachColor.actionBarSelected),
              ),
              SizedBox(
                width: 5.w,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'ID ${contentEntity.clientId}',
                        overflow: TextOverflow.fade,
                        style: CoachHomeTextStyle.clientNameTrainingCard,
                      ),
                      SizedBox(width: 65.w),
                      AssetIcon(
                        path: IconPath.done,
                        color: CoachColor.doneColor,
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        contentEntity.type,
                        style: CoachHomeTextStyle.subtitleTrainingCard,
                      ),
                      Container(
                        width: 3.r,
                        height: 3.r,
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                            color: CoachColor.decorationPoint,
                            borderRadius: BorderRadius.circular(3.r)),
                      ),
                      Text(
                        'Онлайн',
                        style: CoachHomeTextStyle.connectionState,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TrainingCardTimeWidget(
                iconPath: IconPath.calendar,
                title:
                '${weekFormat.format(DateTime.parse(contentEntity.endOfAppointment))}, '
                    '${dayFormat.format(DateTime.parse(contentEntity.endOfAppointment))}'
                    ' ${monthFormat.format(DateTime.parse(contentEntity.endOfAppointment))}',
              ),
              SizedBox(width: 5.w),
              const TrainingCardTimeWidget(
                title: '09:00-10:00',
                iconPath: IconPath.clock,
              ),
            ],
          ),
          SizedBox(height: 6.h),
          SizedBox(
            width: 257.w,
            child: ValidationButtonWidget(
              buttonBorderColor: Colors.transparent,
              name: 'Начать тренировку',
              height: 40,
              textStyle: CoachHomeTextStyle.trainingCardBeginSession,
              buttonColor: CoachColor.trainingBeginSession,
            ),
          )
        ],
      ),
    );
  }
}
