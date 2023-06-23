import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/ui/login_and_signup/login/login_page.dart';
import 'package:move_mates_android/ui/login_and_signup/login_and_signup_page.dart';
import 'package:move_mates_android/ui/login_and_signup/signup/signup_page.dart';
import 'package:move_mates_android/ui/page_view/app_page_view.dart';
import 'package:move_mates_android/ui/theme/colors.dart';
import 'package:move_mates_android/ui/theme/text_field_styles.dart';
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
            bottomSheetTheme:
                const BottomSheetThemeData(backgroundColor: Colors.transparent),
            scaffoldBackgroundColor: Colors.transparent,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: ValidationColor.signInAndSignup,
              elevation: 0,
              // backgroundColor: Colors.transparent,
            ),
          ),
          home: const AppPageView(),
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
