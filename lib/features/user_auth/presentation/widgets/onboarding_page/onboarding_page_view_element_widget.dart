
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/text_styles/user_auth/main_text_style.dart';

class OnboardingPageViewElementWidget extends StatelessWidget {
  final String imagePath;
  final String firstText;
  final String secondText;

  const OnboardingPageViewElementWidget({
    super.key,
    required this.imagePath,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            width: 1.sw,
            height: 513.h,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  firstText,
                  style: AppTextStyle.appViewBoldBlack,
                ),
                Text(secondText, style: AppTextStyle.appViewRegularBlack),
              ],
            ),
          )
        ],
      ),
    );
  }
}
