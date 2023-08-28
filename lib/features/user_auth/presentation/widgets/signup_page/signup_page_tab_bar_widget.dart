
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/user_auth/auth_text_style.dart';
import 'signup_page_asset_icon_widget.dart';

class SignupPageTabBar extends StatelessWidget {
  const SignupPageTabBar({
    super.key,
    required this.isFirstPage,
    required this.text,
    required this.path,
  });

  final String text;
  final String path;
  final bool isFirstPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SignupPageAssetIconWidget(
              path: path,
              color: isFirstPage ? PinkColor.p4 : Colors.black),
          SizedBox(width: 10.w,),
          Text(
            text,
            style: isFirstPage
                ? ValidationTextStyle.toolBarRegularSemiBoldSelected
                : ValidationTextStyle.toolBarRegularSemiBold,
          )
        ],
      ),
    );
  }
}
