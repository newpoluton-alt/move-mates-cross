

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';

class AboutTrainingPageBottomSheetModalContentInfoWidget
    extends StatelessWidget {
  final String label;
  final String title;

  const AboutTrainingPageBottomSheetModalContentInfoWidget({
    super.key,
    required this.label,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.medium(
            fontSize: 15.sp,
            color: GreyColor.g9,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 56.h,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              8.r,
            ),
            border: Border.all(
              color: GreyColor.g19,
            ),
          ),
          child: Text(
            title,
            style: AppTextStyle.normal(
              fontSize: 18.sp,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
