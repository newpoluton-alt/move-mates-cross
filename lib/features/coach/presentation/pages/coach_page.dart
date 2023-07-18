import 'package:flutter/material.dart';
import 'package:move_mates_android/config/theme/colors.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup/asset_icon_widget.dart';

import '../../../../core/constants/bottom_navigation_data.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  static const id = 'user_page';

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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

class BottomNavigationBarModel {
  final String name;
  final String path;

  const BottomNavigationBarModel({
    required this.name,
    required this.path,
  });
}


