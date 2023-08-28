
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';
import '../../../../user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

class ChiefPageTrainingCardTimeWidget extends StatelessWidget {
  const ChiefPageTrainingCardTimeWidget({
    super.key,
    required this.title,
    required this.iconPath,
  });

  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      height: 35.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: PinkColor.p1)),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignupPageAssetIconWidget(
              path: iconPath,
              size: 14,
              color: PinkColor.p10,
            ),
            Text(
              title,
              style: CoachHomeTextStyle.trainingTime,
            )
          ],
        ),
      ),
    );
  }
}
