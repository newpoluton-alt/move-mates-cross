import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/ui/login_and_signup/login_and_signup_page.dart';
import 'package:move_mates_android/ui/page_view/app_page_view.dart';
import 'package:move_mates_android/ui/theme/colors.dart';
import 'package:move_mates_android/ui/theme/text_style.dart';

void main() {
  runApp(const MoveMatesApp());
}

class MoveMatesApp extends StatefulWidget {
  const MoveMatesApp({super.key});

  @override
  State<MoveMatesApp> createState() => _MoveMatesAppState();
}

class _MoveMatesAppState extends State<MoveMatesApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (BuildContext context, Widget? _) {
        return MaterialApp(
          title: 'Move Mates',
          theme: ThemeData(
              bottomSheetTheme: const BottomSheetThemeData(
                  backgroundColor: Colors.transparent),
              scaffoldBackgroundColor: Colors.transparent,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.transparent,
              )),
          home: const AppPageView(),
          routes: {LoginAndSignUpPage.id: (context) => const LoginAndSignUpPage()},
        );
      },
    );
  }
}
