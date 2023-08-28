import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/text_styles/user_auth/auth_text_style.dart';

class LoginPageSignedDividerWidget extends StatelessWidget {
  const LoginPageSignedDividerWidget({
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
                  color: GreyColor.g3),
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Text(
            'или',
            style: ValidationTextStyle.checkBoxMediumGrey,
          ),
        ),
        Expanded(
            child: Container(
              height: 1.h,
              decoration: const BoxDecoration(
                  color: GreyColor.g3),
            )),
      ],
    );
  }
}
