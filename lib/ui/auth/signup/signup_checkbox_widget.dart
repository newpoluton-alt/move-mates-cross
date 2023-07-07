import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/colors.dart';
import '../../theme/text_style.dart';

class SignupCheckboxWidget extends StatelessWidget {
  final bool? doUserAgree;
  final void Function(bool? agreement) changeMind;

  const SignupCheckboxWidget({
    super.key,
    required this.doUserAgree,
    required this.changeMind,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: (doUserAgree ?? false),
              isError: (doUserAgree == false),
              activeColor: ValidationColor.indicatorColor,
              onChanged: changeMind),
          SizedBox(
            width: 0.7.sw,
            child: Text.rich(TextSpan(
              text: 'Я принимаю и согласен ',
              style: ValidationPageTextStyle.checkBoxMediumGrey,
              children: [
                TextSpan(
                  text: 'Условия использования',
                  style: ValidationPageTextStyle.checkBoxMedium,
                ),
                TextSpan(
                  text: ' и ',
                  style: ValidationPageTextStyle.checkBoxMediumGrey,
                ),
                TextSpan(
                  text: 'Политика Конфиденциальности',
                  style: ValidationPageTextStyle.checkBoxMedium,
                )
              ],
            )),
          ),
        ]);
  }
}
