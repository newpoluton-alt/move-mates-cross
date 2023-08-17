import 'package:flutter/material.dart';
import 'package:move_mates_android/features/coach/presentation/pages/choose_your_training_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/settings_page.dart';

import '../../features/coach/presentation/pages/coach_main_page.dart';
import '../../features/user_auth/presentation/pages/auth_page.dart';
import '../../features/user_auth/presentation/pages/forgotten_password_page.dart';
import '../../features/user_auth/presentation/pages/login_page.dart';
import '../../features/user_auth/presentation/pages/signup_page.dart';

class PagesRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    CoachMainPage.id: (context) => const CoachMainPage(),
    AuthPage.id: (context) => const AuthPage(),
    LoginPage.id: (context) => const LoginPage(),
    SignupPage.id: (context) => const SignupPage(),
    ForgottenPasswordPage.id: (context) => const ForgottenPasswordPage(),
    ChooseYourTrainingPage.id: (context) =>
        const ChooseYourTrainingPage(),
    SettingsPage.id: (context) => const SettingsPage()
  };
}
