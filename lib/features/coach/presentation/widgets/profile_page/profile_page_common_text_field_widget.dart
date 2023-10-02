import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';

// ignore: must_be_immutable
class ProfilePageCommonTextField extends StatelessWidget {
  int? maxLines;
  final String textFieldHintText;
  final String textFieldHelperText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  TextEditingController? textEditingController;
  final String? Function(String?)? validator;

  ProfilePageCommonTextField({
    super.key,
    this.validator,
    this.maxLines = 1,
    required this.keyboardType,
    this.textEditingController,
    required this.textInputAction,
    required this.textFieldHintText,
    required this.textFieldHelperText,
  });

  String? _defaultValidator(String? value) {
    if ((value ?? '').trim().isEmpty) {
      return textFieldHelperText;
    } else {
      return null;
    }
  }

  InputBorder get _enabledOutlineBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide.none);

  InputBorder get _errorOutlineBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(color: Colors.red));

  TextStyle get _helperTextStyle => AppTextStyle.medium(
        fontSize: 12.sp,
        color: GreyColor.g28,
      );

  TextStyle get _errorTextStyle => AppTextStyle.medium(
        fontSize: 12.sp,
        color: PinkColor.p15,
      );

  TextStyle get _hintTextStyle => AppTextStyle.medium(
        fontSize: 15.sp,
        color: GreyColor.g29,
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      controller: textEditingController,
      validator: validator != null? validator!: _defaultValidator,
      decoration: InputDecoration(
        filled: true,
        errorMaxLines: 2,
        helperMaxLines: 2,
        fillColor: Colors.white,
        hintStyle: _hintTextStyle,
        errorStyle: _errorTextStyle,
        hintText: textFieldHintText,
        helperStyle: _helperTextStyle,
        helperText: textFieldHelperText,
        errorBorder: _errorOutlineBorder,
        focusedBorder: _enabledOutlineBorder,
        enabledBorder: _enabledOutlineBorder,
        focusedErrorBorder: _errorOutlineBorder,
      ),
    );
  }
}
