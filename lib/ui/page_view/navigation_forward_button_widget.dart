

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../auth/auth_page.dart';
import '../auth/signup/asset_icon_widget.dart';
import '../theme/colors.dart';
import '../theme/constants.dart';

class NavigationForwardButtonWidget extends StatelessWidget {
  const NavigationForwardButtonWidget({
    super.key,
    required this.isLastPage,
    required this.pageController,
  });

  final bool isLastPage;
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
              children: List<Widget>.filled(
                  3,
                  Container(
                    width: 15.r,
                    height: 15.r,
                    margin: EdgeInsets.only(right: 5.w),
                    decoration: BoxDecoration(
                        color: AppViewColor.indicator,
                        borderRadius: BorderRadius.circular(15.r)),
                  )),
            ),
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              isLastPage
                  ? Navigator.of(context)
                  .pushReplacementNamed(LoginAndSignUpPage.id)
                  : pageController.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn);
            },
            icon: const AssetIcon(
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
