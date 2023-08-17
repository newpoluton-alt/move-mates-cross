import 'package:move_mates_android/features/coach/presentation/pages/calendar_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chat_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/client_list_page.dart';

import '../../../features/coach/presentation/pages/coach_main_page.dart';

class CoachPageConstants {
  static const List<CoachPage> coachPagesList = [
    ChiefPage(),
    ClientListPage(),
    CalendarPage(),
    ChatPage()
  ];
  static const List<String> coachTrainingType = [
    'фитнес',
    'силовые',
    'CrossFit',
    'стретчинг (МФР)',
    'похудение',
  ];
}
