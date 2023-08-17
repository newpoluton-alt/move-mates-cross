import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/routes/pages_routes.dart';
import 'package:move_mates_android/config/theme/app_theme/app_theme.dart';
import 'package:move_mates_android/features/injection_container.dart' as di;
import 'package:move_mates_android/core/data_source/local_data_source_checker.dart';
import 'package:move_mates_android/features/coach/presentation/pages/coach_main_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/pages/onboarding_page.dart';

import 'config/routes/assets_routes.dart';
import 'config/theme/colors/pink_color.dart';
import 'config/theme/text_styles/user_auth/app_text_style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await di.initDI();
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
          theme: AppTheme.moveMatesTheme,
          home: FutureBuilder<bool>(
            future: di.sl<LocalDataSourceChecker>().isDataLocated,
            builder: (context, AsyncSnapshot<bool> snapshot) {
             return showBody(snapshot);
            },
          ),
          routes: PagesRoutes.routes,
        );
      },
    );
  }
}

Widget showBody(AsyncSnapshot<bool> snapshot) {
  if (snapshot.hasData) {
    if (snapshot.data!) {
      return const CoachMainPage();
    } else {
      return EasySplashScreen(
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
              colors: [PinkColor.p1, PinkColor.p2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          navigator: const AppPageView());
    }
  } else {
    return const CircularProgressIndicator();
  }
}
