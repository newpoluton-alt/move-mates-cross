import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/green_color.dart';
import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';
import '../../../../user_auth/presentation/widgets/auth_page/auth_page_validation_button_widget.dart';
import '../../../domain/entities/coach_up_coming_content_entity.dart';
import '../../pages/main/about_training_page.dart';
import 'chief_page_training_card_time_widget.dart';

class ChiefPageClientTrainingCardWidget extends StatelessWidget {
  final CoachUpComingContentEntity contentEntity;
  final DateFormat customDateFormat;

  const ChiefPageClientTrainingCardWidget({
    super.key,
    required this.contentEntity,
    required this.customDateFormat,
  });

  String _getParsedTime(String timeInString, BuildContext context) {
    return TimeOfDay.fromDateTime(DateTime.parse(timeInString)).format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 161.h,
      margin: EdgeInsets.only(bottom: 25.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.4.r,
            blurRadius: 10.r,
            offset: Offset(0, 1.w),
          )
        ],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(20.r),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    AboutTrainingPage(coachUpComingContentEntity: contentEntity),
              ),
            );
          },
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
                        color: PinkColor.p6),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 185.w,
                          child: Text(
                            'Client ID ${contentEntity.clientId}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: CoachHomeTextStyle.clientNameTrainingCard,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              contentEntity.type ?? 'null',
                              style: CoachHomeTextStyle.subtitleTrainingCard,
                            ),
                            Container(
                              width: 3.r,
                              height: 3.r,
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                  color: GreyColor.g10,
                                  borderRadius: BorderRadius.circular(3.r)),
                            ),
                            Text(
                              'Онлайн',
                              style: CoachHomeTextStyle.connectionState,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SignupPageAssetIconWidget(
                    path: IconPath.done,
                    color: PinkColor.p11,
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
                  ChiefPageTrainingCardTimeWidget(
                    iconPath: IconPath.calendar,
                    title: customDateFormat
                        .format(DateTime.parse(contentEntity.startOfAppointment)),
                  ),
                  SizedBox(width: 5.w),
                  ChiefPageTrainingCardTimeWidget(
                    title:
                        '${_getParsedTime(contentEntity.startOfAppointment, context)}-'
                        '${_getParsedTime(contentEntity.endOfAppointment, context)}',
                    iconPath: IconPath.clock,
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              SizedBox(
                width: 257.w,
                child: AuthPageValidationButtonWidget(
                  buttonBorderColor: Colors.transparent,
                  name: 'Начать тренировку',
                  height: 40.h,
                  textStyle: CoachHomeTextStyle.trainingCardBeginSession,
                  buttonColor: GreenColor.g2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
