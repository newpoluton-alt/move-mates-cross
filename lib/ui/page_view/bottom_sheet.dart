import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/text_style.dart';
import 'navigation_forward_button_widget.dart';

class PageViewBottomSheet extends StatelessWidget {
  final PageController pageController;
  final int currentPage;

  const PageViewBottomSheet({
    super.key,
    required this.pageController,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    bool isLastPage = currentPage == 3;

    bool isFirstPage = currentPage == 0;

    return !isFirstPage
        ? NavigationForwardButtonWidget(
            isLastPage: isLastPage,
            pageController: pageController)
        : Container(
        margin: EdgeInsets.only(bottom:25.h),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  },
                  child: navigationStartButton(),
                ),
              ],
            ),
        );
  }

  Row navigationStartButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Начать', style: AppTextStyle.regularFunctionalWhite),
        Icon(
          Icons.arrow_forward_ios,
          size: 30.r,
          color: Colors.white,
        ),
      ],
    );
  }
}
