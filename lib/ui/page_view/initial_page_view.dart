
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        Container(
          width: 1.sw,
          height: 1.sh,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [GradientColors.start, GradientColors.end],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
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
                  Text('Доступное общение между тренерами и клиентами.',
                      style: AppTextStyle.regularWhite)
                ],
              ),
            )),
      ],
    );
  }
}
