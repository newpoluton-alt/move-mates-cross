import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_up_coming_content_entity.dart';

import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import 'about_training_page_dropdown_button_widget.dart';

class AboutTrainingPageClientInfoWidget extends StatefulWidget {
  final CoachUpComingContentEntity coachUpComingContentEntity;

  const AboutTrainingPageClientInfoWidget({
    super.key,
    required this.coachUpComingContentEntity,
  });

  @override
  State<AboutTrainingPageClientInfoWidget> createState() =>
      _AboutTrainingPageClientInfoWidgetState();
}

class _AboutTrainingPageClientInfoWidgetState
    extends State<AboutTrainingPageClientInfoWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 306.w,
        height: 80.h,
        padding: EdgeInsets.only(left: 23.w),
        decoration: BoxDecoration(
          color: PinkColor.p22,
          border: Border.all(color: PinkColor.p1),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 9.h,
            right: 12.w,
            bottom: 9.h,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: AboutTrainingPageDropdownButtonWidget(
                    coachUpComingContentEntity:
                        widget.coachUpComingContentEntity),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 53.r,
                      width: 53.r,
                      decoration: BoxDecoration(
                          color: PinkColor.p6,
                          borderRadius: BorderRadius.circular(53.r)),
                    ),
                    SizedBox(width: 15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Имя клиента',
                          style: AppTextStyle.semiBold(
                              fontSize: 16.sp, color: Colors.black),
                        ),
                        Text(
                          'Ж - 29 лет - 175 см - 65 кг',
                          style: AppTextStyle.medium(
                              fontSize: 12.sp, color: PinkColor.p1),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AboutTrainingPageDropdownButtonItemModel {
  final String text;
  final Color textColor;
  final void Function({
    required BuildContext context,
    required CoachUpComingContentEntity coachUpComingContentEntity,
    required ValueChanged<AboutTrainingPageDropdownElementModel> defineModel,
  }) onTap;

  const AboutTrainingPageDropdownButtonItemModel({
    required this.text,
    required this.onTap,
    required this.textColor,
  });
}
