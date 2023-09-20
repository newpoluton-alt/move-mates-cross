import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';

class ProfilePageButtonWidget extends StatelessWidget {
  final String title;
  final String pageId;

  const ProfilePageButtonWidget({
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
          side: const BorderSide(color: GreyColor.g19)),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: AppTextStyle.normal(
                  fontSize: 18.sp,
                  color: Colors.black,
              )),
          SignupPageAssetIconWidget(
            path: IconPath.buttonForward,
            size: 26,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
