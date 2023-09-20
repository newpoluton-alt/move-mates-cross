
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import '../../../../user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

class AboutTrainingPageChattingWithClientButton extends StatelessWidget {
  const AboutTrainingPageChattingWithClientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: PinkColor.p9.withOpacity(0.5),
                  blurRadius: 4.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: MaterialButton(
              height: 47.h,
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignupPageAssetIconWidget(
                    path: IconPath.clientChatting,
                    color: PinkColor.p9,
                  ),
                  SizedBox(width: 7.w),
                  Text(
                    'Связаться с клиентом',
                    style: AppTextStyle.medium(
                      fontSize: 15.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 7.h),
          Text(
            'Для доп вопросов',
            style: AppTextStyle.normal(
              fontSize: 12.sp,
              color: GreyColor.g25,
            ),
          )
        ],
      ),
    );
  }
}
