import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';

import '../../../../../config/theme/text_styles/user_auth/app_text_style.dart';

class OnboardingPageInitialPageView extends StatelessWidget {
  const OnboardingPageInitialPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          ImagePath.imgFirst,
          height: 1.sh,
          width: 1.sw,
          fit: BoxFit.cover,
        ),
        Container(
            margin: EdgeInsets.only(bottom: 80.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Добро пожаловать 👋',
                    style: AppTextStyle.greeting,
                  ),
                  Text(
                    'MOVE MATES',
                    style: AppTextStyle.concernName,
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
