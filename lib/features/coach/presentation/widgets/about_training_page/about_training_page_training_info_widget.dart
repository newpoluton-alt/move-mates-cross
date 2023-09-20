

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import '../../../../user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

class AboutTrainingPageTrainingInfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;

  const AboutTrainingPageTrainingInfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SignupPageAssetIconWidget(
          path: iconPath,
          color: PinkColor.p9,
          size: 26,
        ),
        SizedBox(width: 6.w),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.normal(fontSize: 14.sp, color: PinkColor.p24),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: AppTextStyle.medium(
                fontSize: 17.sp,
                color: Colors.black,
              ),
            )
          ],
        ),
      ],
    );
  }
}
