import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';

class QualificationFieldsPageCommonTextField extends StatelessWidget {
  final TextInputAction textInputAction;
  final TextEditingController textEditingController;

  const QualificationFieldsPageCommonTextField(
      {super.key,
      required this.textInputAction,
      required this.textEditingController});

  OutlineInputBorder get _enabledBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: GreyColor.g19));

  OutlineInputBorder get _errorBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: PinkColor.p15));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      textInputAction: textInputAction,
      controller: textEditingController,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        errorBorder: _errorBorder,
        enabledBorder: _enabledBorder,
        focusedBorder: _enabledBorder,
        focusedErrorBorder: _errorBorder,
        errorStyle: const TextStyle(fontSize: 0),
      ),
    );
  }
}
