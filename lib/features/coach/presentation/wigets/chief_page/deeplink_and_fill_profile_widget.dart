import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/blue_color.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';
import '../../../../user_auth/presentation/widgets/signup/asset_icon_widget.dart';
import 'fill_profile_widget_custom_clipper.dart';

class DeeplinkAndFillProfileWidget extends StatelessWidget {
  const DeeplinkAndFillProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
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
                  icon: AssetIcon(path: IconPath.copy, color: PinkColor.p1)),
            )
          ],
        ),
        SizedBox(height: 14.h),
        Text(
          'Скопируйте и отправьте ссылку своему клиенту.',
          style: CoachHomeTextStyle.urlDescription,
        ),
        SizedBox(height: 46.h),
        Stack(
          children: [
            ActionWidgetCustomPainter(
              customPainter: ActionWidgetShadowPainter(
                  shadow: Shadow(color: PinkColor.p17, blurRadius: 2.r),
                  clipper: ActionWidgetCustomClipper()),
              child: ClipPath(
                clipper: ActionWidgetCustomClipper(),
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
                          onPressed: () {},
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
      ],
    );
  }
}

