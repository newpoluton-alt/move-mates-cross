import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/text_styles/coach/coach_text_style.dart';
import '../../../../user_auth/presentation/widgets/signup/asset_icon_widget.dart';

class SettingsPageButton extends StatelessWidget {
  final String title;
  final String pageId;

  const SettingsPageButton({
    super.key,
    required this.title,
    required this.pageId,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 56.h,
      minWidth: 350.w,
      color: Colors.white,
      onPressed: () {
        Navigator.of(context).pushNamed(pageId);
      },
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(color: GreyColor.g19)),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: CoachTextStyle.common(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400)),
          AssetIcon(
            path: IconPath.buttonForward,
            size: 26,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
