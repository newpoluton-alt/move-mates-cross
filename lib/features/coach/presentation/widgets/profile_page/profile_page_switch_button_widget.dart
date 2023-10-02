import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';

// ignore: must_be_immutable
class ProfilePageSwitchButton extends StatelessWidget {
  bool isFirstTrainingFree;
  void Function() refreshSwitchData;

  ProfilePageSwitchButton(
      {super.key,
      required this.refreshSwitchData,
      required this.isFirstTrainingFree});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: GreyColor.g19)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Первая тренировка бесплатно',
            style: AppTextStyle.medium(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
          Switch(
              value: isFirstTrainingFree,
              onChanged: (value) {
                refreshSwitchData();
              })
        ],
      ),
    );
  }
}
