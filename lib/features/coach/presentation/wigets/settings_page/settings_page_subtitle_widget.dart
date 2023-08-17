
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/text_styles/coach/coach_text_style.dart';

class SettingsPageSubtitleWidget extends StatelessWidget {
  final String title;

  const SettingsPageSubtitleWidget({
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
        style: CoachTextStyle.common(
            fontSize: 12.sp, color: GreyColor.g28, fontWeight: FontWeight.w500),
      ),
    );
  }
}
