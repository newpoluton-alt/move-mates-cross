import 'package:flutter/material.dart';
import 'package:move_mates_android/core/constants/coach/coach_page_constants.dart';
import 'package:move_mates_android/features/coach/presentation/pages/calendar/calendar_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../config/theme/colors/pink_color.dart';
import '../../../../core/constants/coach/bottom_navigation_data.dart';

class CoachMainPage extends StatefulWidget {
  const CoachMainPage({super.key});

  static const id = 'coach_main_page';

  @override
  State<CoachMainPage> createState() => _CoachMainPageState();
}

class _CoachMainPageState extends State<CoachMainPage> {
  int currentPage = 0;

  void changePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  bool get isCalendarPage {
    return CoachPageConstants.coachPagesList[currentPage].pageNameValue() ==
        CalendarPage.pageName;
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: (isCalendarPage)
              ? EmptyAppBar.build(context)
              : AppBar(
                  centerTitle: true,
                  title: Text(CoachPageConstants.coachPagesList[currentPage]
                              .pageNameValue(),
                      textAlign: TextAlign.center),

                ),
          body: CoachPageConstants.coachPagesList[currentPage],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentPage,
              onTap: changePage,
              items: UserPageData.bottomNavigationBarModelList
                  .map((e) => BottomNavigationBarItem(
                      icon: SignupPageAssetIconWidget(path: e.path, color: PinkColor.p7),
                      label: e.name))
                  .toList()),
        );
      }
  }


class BottomNavigationBarModel {
  final String name;
  final String path;

  const BottomNavigationBarModel({
    required this.name,
    required this.path,
  });
}

abstract class CoachPage extends Widget {
  const CoachPage({super.key});

  String pageNameValue();
}

class EmptyAppBar{
 static PreferredSize build(BuildContext context) {
    return PreferredSize(preferredSize: const Size(0, 0), child: AppBar());
  }
}
