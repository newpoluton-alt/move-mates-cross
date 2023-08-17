import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/pink_color.dart';

import '../../pages/auth_page.dart';
import '../signup/asset_icon_widget.dart';
import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/routes/assets_routes.dart';

class NavigationForwardButtonWidget extends StatelessWidget {
  const NavigationForwardButtonWidget({
    super.key,
    required this.isLastPage,
    required this.pageController,
    required this.currentPage,
  });

  final bool isLastPage;
  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: List<int>.generate(
                3,
                (index) => index,
              )
                  .map((e) => Container(
                        width: 15.r,
                        height: 15.r,
                        margin: EdgeInsets.only(right: 5.w),
                        decoration: BoxDecoration(
                            color: e + 1 == currentPage
                                ? PinkColor.p3
                                : GreyColor.g4,
                            borderRadius: BorderRadius.circular(15.r)),
                      ))
                  .toList(),
            ),
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              isLastPage
                  ? Navigator.of(context)
                      .pushReplacementNamed(AuthPage.id)
                  : pageController.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
            },
            icon: AssetIcon(
              path: IconPath.arrowForward,
              color: Colors.black,
              size: 49,
            ),
          )
        ],
      ),
    );
  }
}
