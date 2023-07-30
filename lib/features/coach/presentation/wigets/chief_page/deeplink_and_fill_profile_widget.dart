import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors.dart';
import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';
import '../../../../user_auth/presentation/widgets/signup/asset_icon_widget.dart';

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
                  border: Border.all(color: GradientColors.start)),
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
                border: Border.all(color: GradientColors.start),
              ),
              child: IconButton(
                  iconSize: 24.h,
                  onPressed: () {},
                  icon: AssetIcon(
                      path: IconPath.copy, color: GradientColors.start)),
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
            Container(
              height: 225.h - (225.h * 0.25),
              decoration: BoxDecoration(
                  color: CoachColor.actionBarSelected,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    topLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  )),
            ),
            Row(
              children: [
                ClipPath(
                  clipper: ActionWidgetCustomClipper(),
                  child: Container(
                    height: 225.h,
                    width: 159.w,
                    decoration: BoxDecoration(
                      color: CoachColor.actionBarSelected,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20.h, top:  10.h),
                      child: Image.asset(
                        ImagePath.userActionBegin,
                      ),
                    ),
                  ),
                ),
                SizedBox(
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
                            color: CoachColor.beginButtonBackground,
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
              ],
            ),
          ],
        )
      ],
    );
  }
}


class ActionWidgetCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0, height);
    path.lineTo(width, height - (height * 0.25));
    path.lineTo(width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
