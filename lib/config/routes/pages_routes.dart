import 'package:flutter/material.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/payments_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/profile_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/qualification_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/settings_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/specialisation_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/subscription_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/working_hours_calendar_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/working_hours_page.dart';

import '../../features/coach/presentation/pages/chief/notifications_page.dart';
import '../../features/coach/presentation/pages/coach_main_page.dart';
import '../../features/user_auth/presentation/pages/auth_page.dart';
import '../../features/user_auth/presentation/pages/forgotten_password_page.dart';
import '../../features/user_auth/presentation/pages/login_page.dart';
import '../../features/user_auth/presentation/pages/signup_page.dart';

class PagesRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AuthPage.id: (context) => const AuthPage(),
    LoginPage.id: (context) => const LoginPage(),
    SignupPage.id: (context) => const SignupPage(),
    ProfilePage.id: (context) => const ProfilePage(),
    SettingsPage.id: (context) => const SettingsPage(),
    PaymentsPage.id: (context) => const PaymentsPage(),
    CoachMainPage.id: (context) => const CoachMainPage(),
    WorkingHoursPage.id: (context) => const WorkingHoursPage(),
    SubscriptionsPage.id: (context) => const SubscriptionsPage(),
    NotificationsPage.id: (context) => const NotificationsPage(),
    QualificationPage.id: (context) => const QualificationPage(),
    SpecialisationPage.id: (context) => const SpecialisationPage(),
    ForgottenPasswordPage.id: (context) => const ForgottenPasswordPage(),
    WorkingHoursCalendarPage.id:(context)=> const WorkingHoursCalendarPage(),
  };
}
