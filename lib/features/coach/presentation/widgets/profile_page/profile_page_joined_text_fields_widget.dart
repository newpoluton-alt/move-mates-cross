import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';

import '../../../../../config/theme/colors/grey_color.dart';

class ProfilePageJoinedTextFields extends StatelessWidget {
  final TextEditingController nameEditingController;
  final TextEditingController lastnameEditingController;

  const ProfilePageJoinedTextFields({
    super.key,
    required this.nameEditingController,
    required this.lastnameEditingController,
  });

  InputBorder _noneTextFieldBorder() =>
      const UnderlineInputBorder(borderSide: BorderSide.none);

  InputBorder _enableTextFieldBorder() =>
      const UnderlineInputBorder(borderSide: BorderSide(color: GreyColor.g3));

  InputBorder _errorTextFieldBorder() =>
      const UnderlineInputBorder(borderSide: BorderSide());

  TextStyle get _hintTextStyle => AppTextStyle.medium(
        fontSize: 15.sp,
        color: GreyColor.g29,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 16.w),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextFormField(
            keyboardType: TextInputType.name,
            controller: nameEditingController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: 'Имя',
              hintStyle: _hintTextStyle,
              contentPadding: EdgeInsets.zero,
              enabledBorder: _enableTextFieldBorder(),
              focusedBorder: _enableTextFieldBorder(),
              errorBorder: _errorTextFieldBorder(),
              errorStyle: const TextStyle(fontSize: 0),
            ),
            onFieldSubmitted: (value) {

            },
            validator: (value) {
              if ((value ?? '').trim().isEmpty) {
                return '';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
              keyboardType: TextInputType.name,
              controller: lastnameEditingController,
              decoration: InputDecoration(
                hintText: 'Фамилия',
                hintStyle: _hintTextStyle,
                contentPadding: EdgeInsets.zero,
                enabledBorder: _noneTextFieldBorder(),
                focusedBorder: _noneTextFieldBorder(),
                errorBorder: _noneTextFieldBorder(),
                focusedErrorBorder: _noneTextFieldBorder(),
                errorStyle: const TextStyle(fontSize: 0),
              ),
              validator: (value) {
                if ((value ?? '').trim().isEmpty) {
                  return '';
                } else {
                  return null;
                }
              }),
        ]));
  }
}
