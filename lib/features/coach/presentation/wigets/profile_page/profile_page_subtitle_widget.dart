import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';

class ProfilePageSubtitleWidget extends StatelessWidget {
  final String title;

  const ProfilePageSubtitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.w, top: 5.h),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: AppTextStyle.medium(
          fontSize: 12.sp,
          color: GreyColor.g28,
        ),
      ),
    );
  }
}
