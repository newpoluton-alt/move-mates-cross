import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/blue_color.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/profile_page.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';
import 'chief_page_deeplink_widget.dart';
import 'chief_page_fill_profile_widget_custom_clipper.dart';

class ChiefPageDeeplinkAndFillProfileWidget extends StatelessWidget {
  const ChiefPageDeeplinkAndFillProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      const ChiefPageDeepLinkWidget(),
      SizedBox(height: 46.h),
      Stack(
        children: [
          ActionWidgetCustomPainter(
            customPainter: ActionWidgetShadowPainter(
                shadow: Shadow(color: PinkColor.p17, blurRadius: 2.r),
                clipper: ChiefPageActionWidgetCustomClipper()),
            child: ClipPath(
              clipper: ChiefPageActionWidgetCustomClipper(),
              child: Container(
                height: 225.h,
                decoration: const BoxDecoration(
                  color: GreyColor.g23,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h, left: 10.h),
            child: ActionWidgetCustomPainter(
              customPainter: ActionWidgetBorderPainter(
                  clipper: ActionWidgetImageCustomClipper()),
              child: ClipPath(
                clipper: ActionWidgetImageCustomClipper(),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Image.asset(ImagePath.userActionBegin,
                      fit: BoxFit.fitHeight, height: 200.h, width: 139.w),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 190.w,
              height: 225.h,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 3.w, vertical: 14.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Заполните свой профиль',
                      style: CoachHomeTextStyle.fillYourProfileTitle,
                    ),
                    Text(
                      'Укрепление доверия клиента: Полный и всесторонний'
                      ' профиль помогает создать доверие и '
                      'уверенность среди потенциальных клиентов.',
                      style: CoachHomeTextStyle.fillYourProfileContent,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(ProfilePage.id);
                        },
                        padding: EdgeInsets.symmetric(
                            horizontal: 19.w, vertical: 8.h),
                        color: BlueColor.b3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Text(
                          'Начать',
                          style: CoachHomeTextStyle.beginButton,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    ]);
  }
}

