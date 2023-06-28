
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/ui/auth/signup/asset_icon_widget.dart';

import '../../theme/colors.dart';
import '../../theme/text_style.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AssetIcon(
            path: path,
            color: isFirstPage ? ValidationColor.indicatorColor : Colors.black),
        SizedBox(width: 10.w,),
        Text(
          text,
          style: isFirstPage
              ? ValidationPageTextStyle.toolBarRegularSemiBoldSelected
              : ValidationPageTextStyle.toolBarRegularSemiBold,
        )
      ],
    );
  }
}
