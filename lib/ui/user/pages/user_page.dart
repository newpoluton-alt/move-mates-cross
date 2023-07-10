import 'package:flutter/material.dart';
import 'package:move_mates_android/ui/auth/signup/asset_icon_widget.dart';
import 'package:move_mates_android/ui/theme/colors.dart';
import 'package:move_mates_android/ui/theme/constants.dart';
import 'package:move_mates_android/ui/theme/text_style.dart';

import '../constants.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  static const id = 'user_page';

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  int currentPage = 0;
  void changePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('user page', textAlign: TextAlign.center),
      ),
      body: const Column(children: [SizedBox()]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
          onTap: changePage,
          items: UserPageData.bottomNavigationBarModelList
              .map((e) => BottomNavigationBarItem(
                  icon: AssetIcon(path: e.path, color: UserPageColor.icon),
                  label: e.name))
              .toList()),
    );
  }
}

