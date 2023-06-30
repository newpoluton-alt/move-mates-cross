import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/ui/auth/login/login_page.dart';
import 'package:move_mates_android/ui/auth/auth_page.dart';
import 'package:move_mates_android/ui/auth/signup/signup_page.dart';
import 'package:move_mates_android/ui/page_view/app_page_view.dart';
import 'package:move_mates_android/ui/theme/colors.dart';
import 'package:move_mates_android/ui/theme/text_field_styles.dart';
import 'package:move_mates_android/ui/theme/text_style.dart';

import 'ui/theme/constants.dart';

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
          supportedLocales: const [Locale('ru', 'RU'), Locale('en', 'EN')],
          theme: ThemeData(
            useMaterial3: true,
            dialogBackgroundColor: Colors.white,
            primaryColor: Colors.white,
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: ValidationPageTextStyle.textFieldUp,
                focusedBorder:
                    ValidationTextFieldStyles.underLineFocusedBorder),
            textSelectionTheme: const TextSelectionThemeData(
                cursorColor: ValidationColor.indicatorColor),
            bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.transparent, elevation: 0),
            scaffoldBackgroundColor: Colors.transparent,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: ValidationColor.signInAndSignup,
              elevation: 0,
              // backgroundColor: Colors.transparent,
            ),
          ),
          home: EasySplashScreen(
              showLoader: false,
              title: Text(
                'MOVE MATES',
                style: AppTextStyle.appSplashStyle,
              ),
              logo: Image.asset(
                ImagePath.logo,
                width: 100.w,
                height: 139.h,
              ),
              durationInSeconds: 1,
              gradientBackground: const LinearGradient(
                  colors: [GradientColors.start, GradientColors.end],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              navigator: const AppPageView()),
          routes: {
            LoginAndSignUpPage.id: (context) => const LoginAndSignUpPage(),
            LoginPage.id: (context) => const LoginPage(),
            SignupPage.id: (context) => const SignupPage(),
          },
        );
      },
    );
  }
}
