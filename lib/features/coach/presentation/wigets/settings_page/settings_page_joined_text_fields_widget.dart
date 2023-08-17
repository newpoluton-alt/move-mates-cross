import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';

class SettingsPageJoinedTextFields extends StatelessWidget {
  const SettingsPageJoinedTextFields({super.key});

  InputBorder _noneTextFieldBorder() =>
      const UnderlineInputBorder(borderSide: BorderSide.none);

  InputDecoration _customInputDecoration() => InputDecoration(
      contentPadding: EdgeInsets.zero,
      enabledBorder: _noneTextFieldBorder(),
      focusedBorder: _noneTextFieldBorder());

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 98.h,
        padding: EdgeInsets.only(left: 16.w),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              controller: TextEditingController(text: 'Kirill'),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: _noneTextFieldBorder(),
                  focusedBorder: _noneTextFieldBorder()),
            ),
            Container(
              height: 1.h,
              width: double.infinity,
              decoration: const BoxDecoration(color: GreyColor.g3),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: _noneTextFieldBorder(),
                  focusedBorder: _noneTextFieldBorder()),
            ),
          ],
        ));
  }
}
