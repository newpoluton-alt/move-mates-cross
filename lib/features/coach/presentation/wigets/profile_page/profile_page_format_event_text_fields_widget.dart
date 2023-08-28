import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';

class ProfilePageFormatEventTextFields extends StatelessWidget {
  const ProfilePageFormatEventTextFields({super.key});

  InputBorder _offlineTextFieldsDecoration({required Color borderColor}) =>
      OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: borderColor));

  TextStyle get _helperStyle => AppTextStyle.medium(
        fontSize: 12.sp,
        color: GreyColor.g28,
      );

  TextStyle get _errorStyle => AppTextStyle.medium(
        fontSize: 12.sp,
        color: PinkColor.p15,
      );

  String get _addressTextFieldString => 'Пожалуйста, добавьте адрес и название '
      'места, где проходят оффлайн тренировки';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            helperText: 'Название места',
            errorStyle: _errorStyle,
            helperStyle: _helperStyle,
            errorBorder: _offlineTextFieldsDecoration(borderColor: Colors.red),
            focusedBorder:
                _offlineTextFieldsDecoration(borderColor: GreyColor.g19),
            enabledBorder:
                _offlineTextFieldsDecoration(borderColor: GreyColor.g19),
            focusedErrorBorder:
                _offlineTextFieldsDecoration(borderColor: Colors.red),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Название места';
            } else {
              return null;
            }
          },
        ),
        SizedBox(height: 8.h),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              filled: true,
              errorMaxLines: 2,
              helperMaxLines: 3,
              fillColor: Colors.white,
              errorStyle: _errorStyle,
              helperStyle: _helperStyle,
              errorBorder:
                  _offlineTextFieldsDecoration(borderColor: Colors.red),
              focusedBorder:
                  _offlineTextFieldsDecoration(borderColor: GreyColor.g19),
              enabledBorder:
                  _offlineTextFieldsDecoration(borderColor: GreyColor.g19),
              focusedErrorBorder:
                  _offlineTextFieldsDecoration(borderColor: Colors.red),
              helperText: _addressTextFieldString),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return _addressTextFieldString;
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
