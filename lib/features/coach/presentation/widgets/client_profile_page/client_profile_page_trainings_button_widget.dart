import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';

class ClientProfilePageTrainingsButtonWidget extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final void Function() changeValueOfButtonAlternation;

  const ClientProfilePageTrainingsButtonWidget({
    super.key,
    required this.title,
    required this.textColor,
    required this.backgroundColor,
    required this.changeValueOfButtonAlternation,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 43.h,
      minWidth: 167.w,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      onPressed: changeValueOfButtonAlternation,
      child: Text(
        title,
        style: AppTextStyle.medium(
          fontSize: 16.sp,
          color: textColor,
        ),
      ),
    );
  }
}
