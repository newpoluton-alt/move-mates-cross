import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/ui/theme/constants.dart';

import '../theme/colors.dart';
import '../theme/text_style.dart';

class InitialPageView extends StatelessWidget {
  const InitialPageView({
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
          fit: BoxFit.fitHeight,
        ),
        Opacity(
          opacity: 0.8,
          child: Container(
            width: 1.sw,
            height: 1.sh,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [GradientColors.start, GradientColors.end],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
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
