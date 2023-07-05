

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/text_style.dart';

SnackBar buildCustomAuthSnackBar(String error) {
  return SnackBar(
      width: 0.7.sw,
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r)),
      content: FittedBox(
        fit: BoxFit.contain,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error,
              style: ValidationPageTextStyle.signupRegular,
            )
          ],
        ),
      ));
}
