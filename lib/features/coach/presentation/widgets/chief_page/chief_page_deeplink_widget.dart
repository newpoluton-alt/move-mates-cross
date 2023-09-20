
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';

class ChiefPageDeepLinkWidget extends StatelessWidget {
  const ChiefPageDeepLinkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: 251.w,
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: PinkColor.p1)),
              child: Center(
                child: Text(
                  'htttp:\\move.maters/coach12563',
                  style: CoachHomeTextStyle.url,
                ),
              ),
            ),
            SizedBox(width: 25.w),
            Container(
              width: 50.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: PinkColor.p1),
              ),
              child: IconButton(
                  iconSize: 24.h,
                  onPressed: () {},
                  icon: SignupPageAssetIconWidget(path: IconPath.copy, color: PinkColor.p1)),
            ),
          ],
        ),
        SizedBox(height: 14.h),
        Text(
          'Скопируйте и отправьте ссылку своему клиенту.',
          style: CoachHomeTextStyle.urlDescription,
        ),
      ],
    );
  }
}
