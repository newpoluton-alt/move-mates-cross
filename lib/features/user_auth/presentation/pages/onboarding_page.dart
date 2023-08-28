import 'package:flutter/material.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';

import '../widgets/onboarding_page/onboarding_page_bottom_sheet_widget.dart';
import '../widgets/onboarding_page/onboarding_page_initial_page_view_widget.dart';
import '../widgets/onboarding_page/onboarding_page_view_element_widget.dart';


class AppPageView extends StatefulWidget {
  const AppPageView({
    super.key,
  });

  @override
  State<AppPageView> createState() => _AppPageViewState();
}

class _AppPageViewState extends State<AppPageView> {
late  final PageController _pageController;
int currentPage = 0;
@override
  void initState() {
  _pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
void changeCurrentPage(int value) {
  setState(() {
    currentPage = value;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: changeCurrentPage,
        children: const [
          OnboardingPageInitialPageView(),
          OnboardingPageViewElementWidget(
            imagePath: ImagePath.imgSecond,
          firstText: 'Удобное общение между тренерами и клиентами',
          secondText: 'Соединяйтесь. Достигайте. Процветайте.',
          ),
          OnboardingPageViewElementWidget(
            imagePath: ImagePath.imgThird,
          firstText: 'Платежи в приложении',
          secondText: 'Быстрые транзакции, мгновенные результаты.',
          ),
          OnboardingPageViewElementWidget(
            imagePath: ImagePath.imgFourth,
          firstText: 'Онлайн/офлайн тренировки',
          secondText: 'Занимайтесь спортом вне зависимости от места или ограничений времени.',
          ),
        ],
      ),
      bottomSheet: OnboardingPageViewBottomSheet(
        currentPage: currentPage,
        pageController: _pageController,
      ),
    );
  }
}

