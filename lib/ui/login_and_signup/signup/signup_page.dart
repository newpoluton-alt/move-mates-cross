import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/ui/login_and_signup/constants.dart';
import 'package:move_mates_android/ui/login_and_signup/signup/asset_icon_widget.dart';
import 'package:move_mates_android/ui/login_and_signup/signup/signup_tab_bar_widget.dart';
import 'package:move_mates_android/ui/theme/colors.dart';
import 'package:move_mates_android/ui/theme/text_style.dart';

class SignupPage extends StatefulWidget {
  static const id = 'signup_page';

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int currentTabBarPage = 0;
  bool isFirstPage = true;

  void changePage(int index) {
    setState(() {
      isFirstPage = 0 == index;
      currentTabBarPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const AssetIcon(
              path: IconPath.arrowBack,
              color: ValidationColor.signInAndSignup,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Создать учетную запись',
              style: ValidationPageTextStyle.medium,
            ),
            Text(
              'Создайте учетную запись, чтобы начать работу с приложением',
              style: ValidationPageTextStyle.regular,
            ),
            SizedBox(height: 30.h,),
            DefaultTabController(
              length: 2,
              child: Column(children: [
                TabBar(
                    indicatorColor: ValidationColor.indicatorColor,
                    onTap: changePage,
                    tabs: [
                      SignupTabBar(
                        isFirstPage: isFirstPage,
                        text: 'Клиент',
                        path: IconPath.meditationRound,
                      ),
                      SignupTabBar(
                        isFirstPage: !isFirstPage,
                        text: 'Tренер',
                        path: IconPath.dumbbellLarge,
                      ),
                    ])
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
