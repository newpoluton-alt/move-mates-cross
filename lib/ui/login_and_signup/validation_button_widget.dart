

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ValidationButtonWidget extends StatelessWidget {
  final String name;
  Color? buttonColor;
  void Function ()? onPushing;
  final TextStyle textStyle;

  ValidationButtonWidget({
    super.key,
    this.buttonColor,
    this.onPushing,
    required this.name,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: buttonColor ?? Colors.white,
      minWidth: 370.w,
      height: 60.h,
      shape: RoundedRectangleBorder(
          side: BorderSide(), borderRadius: BorderRadius.circular(10.r)),
      onPressed: onPushing ?? (){},
      child: Text(name, style: textStyle),
    );
  }
}
