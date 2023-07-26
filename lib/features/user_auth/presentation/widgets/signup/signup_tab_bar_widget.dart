
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup/asset_icon_widget.dart';

import '../../../../../config/theme/colors.dart';
import '../../../../../config/theme/text_styles/user_auth/auth_text_style.dart';

class SignupTabBar extends StatelessWidget {
  const SignupTabBar({
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
          AssetIcon(
              path: path,
              color: isFirstPage ? ValidationColor.pageMainColor : Colors.black),
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
