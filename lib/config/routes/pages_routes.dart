import 'package:flutter/material.dart';
import 'package:move_mates_android/features/coach/presentation/pages/training_session_creation_page.dart';

import '../../features/coach/presentation/pages/coach_main_page.dart';
import '../../features/user_auth/presentation/pages/auth_page.dart';
import '../../features/user_auth/presentation/pages/forgotten_password_page.dart';
import '../../features/user_auth/presentation/pages/login_page.dart';
import '../../features/user_auth/presentation/pages/signup_page.dart';

class PagesRoutes{
  static Map<String, Widget Function(BuildContext)> routes = {
    UserPage.id: (context) => const UserPage(),
    AuthPage.id: (context) => const AuthPage(),
    LoginPage.id: (context) => const LoginPage(),
    SignupPage.id: (context) => const SignupPage(),
    ForgottenPasswordPage.id: (context) =>
    const ForgottenPasswordPage(),
    TrainingSessionCreationPage.id: (context) =>
    const TrainingSessionCreationPage(),
  };
}