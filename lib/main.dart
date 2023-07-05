import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:move_mates_android/ui/auth/login/login_page.dart';
import 'package:move_mates_android/ui/auth/auth_page.dart';
import 'package:move_mates_android/ui/auth/models.dart';
import 'package:move_mates_android/ui/auth/signup/signup_page.dart';
import 'package:move_mates_android/ui/page_view/app_page_view.dart';
import 'package:move_mates_android/ui/theme/app_theme.dart';
import 'package:move_mates_android/ui/theme/colors.dart';
import 'package:move_mates_android/ui/theme/text_style.dart';
import 'package:move_mates_android/ui/user/user_page.dart';

import 'bloc/auth_bloc.dart';
import 'ui/theme/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MoveMatesApp()));
}

class MoveMatesApp extends StatefulWidget {
  const MoveMatesApp({super.key});

  @override
  State<MoveMatesApp> createState() => _MoveMatesAppState();
}

class _MoveMatesAppState extends State<MoveMatesApp> {
  late final FlutterSecureStorage _storage;
  bool isThereToken = false;

  @override
  void initState() {
    _storage = const FlutterSecureStorage();
    checkUserToken();
    super.initState();
  }

  void checkUserToken() async {
    var token = await _storage.read(key: StorageKeys.token) ?? '';
    setState(() {
      isThereToken = token.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (BuildContext context, Widget? _) {
        return MaterialApp(
          title: 'Move Mates',
          supportedLocales: const [Locale('ru', 'RU'), Locale('en', 'EN')],
          theme: AppTheme.moveMatesTheme,
          home: isThereToken
              ? const UserPage()
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
          },
        );
      },
    );
  }
}
