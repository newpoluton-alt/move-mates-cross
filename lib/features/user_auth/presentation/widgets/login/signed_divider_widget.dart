import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors.dart';
import '../../../../../config/theme/text_style.dart';

class SignedDividerWidget extends StatelessWidget {
  const SignedDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
              height: 1.h,
              decoration: const BoxDecoration(
                  color: ValidationColor.textFieldColor),
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Text(
            'или',
            style: ValidationPageTextStyle.checkBoxMediumGrey,
          ),
        ),
        Expanded(
            child: Container(
              height: 1.h,
              decoration: const BoxDecoration(
                  color: ValidationColor.textFieldColor),
            )),
      ],
    );
  }
}
