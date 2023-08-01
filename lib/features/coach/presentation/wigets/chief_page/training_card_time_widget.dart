
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors.dart';
import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';
import '../../../../user_auth/presentation/widgets/signup/asset_icon_widget.dart';

class TrainingCardTimeWidget extends StatelessWidget {
  const TrainingCardTimeWidget({
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
          border: Border.all(color: GradientColors.start)),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssetIcon(
              path: iconPath,
              size: 14,
              color: CoachColor.additionInfoTitle,
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
