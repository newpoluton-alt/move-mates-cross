import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/app_theme.dart';
import 'package:move_mates_android/config/theme/colors.dart';
import 'package:move_mates_android/config/theme/text_style.dart';
import 'package:move_mates_android/core/data_source/local_data_source_checker.dart';
import 'package:move_mates_android/features/coach/presentation/pages/coach_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/pages/auth_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/pages/forgotten_password_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/pages/login_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/pages/onboarding_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/pages/signup_page.dart';

import 'config/routes/assets_routes.dart';
import 'user_auth_injection_container.dart' as di;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await di.init();
  runApp(const MoveMatesApp());

}

class MoveMatesApp extends StatefulWidget {
  const MoveMatesApp({super.key});

  @override
  State<MoveMatesApp> createState() => _MoveMatesAppState();
}

class _MoveMatesAppState extends State<MoveMatesApp> {
  bool isThereLocalData = false;
  void checkData() async{
    var data = await di.sl<LocalDataSourceChecker>().isDataLocated;
    setState(() {
    isThereLocalData = data;
    });
  }
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      checkData();
    });
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (BuildContext context, Widget? _) {
        return MaterialApp(
          title: 'Move Mates',
          theme: AppTheme.moveMatesTheme,
          home:
              isThereLocalData? const UserPage()
              : EasySplashScreen(
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
            UserPage.id: (context) => const UserPage(),
            LoginAndSignUpPage.id: (context) => const LoginAndSignUpPage(),
            LoginPage.id: (context) => const LoginPage(),
            SignupPage.id: (context) => const SignupPage(),
            ForgottenPasswordPage.id:(context)=> const ForgottenPasswordPage(),
          },
        );
      },
    );
  }
}
