import 'package:flutter/material.dart';
import 'package:move_mates_android/ui/page_view/bottom_sheet.dart';
import 'package:move_mates_android/ui/page_view/initial_page_view.dart';

class AppPageView extends StatefulWidget {
  const AppPageView({
    super.key,
  });

  @override
  State<AppPageView> createState() => _AppPageViewState();
}

class _AppPageViewState extends State<AppPageView> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          InitialPageView(),
        ],
      ),
      bottomSheet: const PageViewBottomSheet(),
    );
  }
}

