
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';

class ChiefPageNoClientsMessageContentWidget extends StatelessWidget {
  final String title;

  const ChiefPageNoClientsMessageContentWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 330.w,
        height: 203.h,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: PinkColor.p1)),
        child: Text(
          title,
          style: AppTextStyle.medium(fontSize: 15.sp, color: Colors.black),
        ));
  }
}
