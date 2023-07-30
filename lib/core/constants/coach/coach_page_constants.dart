import 'package:flutter/material.dart';
import 'package:move_mates_android/features/coach/presentation/pages/calendar_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chat_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/client_list_page.dart';
import 'package:move_mates_android/features/coach/presentation/wigets/chief_page/deeplink_and_fill_profile_widget.dart';
import 'package:move_mates_android/features/coach/presentation/wigets/chief_page/training_action_widget.dart';

class CoachPageConstants {
  static List<Widget> coachPagesList = const [
    ChiefPage(),
    ClientListPage(),
    CalendarPage(),
    ChatPage()
  ];
  static List<Widget> coachActionWidgetsList = const [
    TrainingActionWidget(),
    DeeplinkAndFillProfileWidget()
  ];
}
