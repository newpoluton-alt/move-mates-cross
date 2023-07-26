import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/assets_routes.dart';

//ignore: must-be-immutable
class ValidationButtonWidget extends StatelessWidget {
  final String name;
  Color? buttonColor;
  Color? buttonBorderColor;
  String? iconPath;
  void Function()? onPushing;
  final TextStyle textStyle;

  ValidationButtonWidget({
    super.key,
    this.buttonColor,
    this.onPushing,
    this.iconPath,
    this.buttonBorderColor,
    required this.name,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.0,
      color: buttonColor ?? Colors.white,
      minWidth: 370.w,
      height: 60.h,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: buttonBorderColor ?? Colors.black),
          borderRadius: BorderRadius.circular(10.r)),
      onPressed: onPushing ?? () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconPath != null
              ? Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Image.asset(
                    IconPath.google,
                    height: 24.w,
                  ),
                )
              : const SizedBox(),
          Text(name, style: textStyle),
        ],
      ),
    );
  }
}
