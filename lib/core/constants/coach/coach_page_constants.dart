import 'package:move_mates_android/core/constants/coach/chief_page_constants.dart';
import 'package:move_mates_android/core/constants/coach/coach_calendar_page_constants.dart';
import 'package:move_mates_android/core/constants/coach/coach_clients_page_constants.dart';
import 'package:move_mates_android/features/coach/presentation/pages/calendar/calendar_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chat/chat_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/client_list/client_list_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/client_list/client_profile_page.dart';

import '../../../features/coach/presentation/pages/coach_main_page.dart';
import '../../../features/coach/presentation/pages/main/chief_page.dart';
import '../../../features/coach/presentation/pages/main/settings_page.dart';
import '../../../features/coach/presentation/widgets/about_training_page/about_training_page_client_info_widget.dart';

class CoachPageConstants {
  static const List<CoachPage> coachPagesList = [
    ChiefPage(),
    ClientListPage(),
    CalendarPage(),
    ChatPage()
  ];

  //coach's clients page constants
  static const List<ClientAdditionalInfoModel> clientInfoPageClientInfo =
      CoachClientsPageConstants.clientInfoPageClientInfoData;

  //coach's calendar page constants
  static const List<String> typesOfTraining =
      CoachCalendarPageConstants.typesOfTrainingData;

  //chief page constants
  static const List<String> daysOfWeek = ChiefPageConstants.daysOfWeekData;
  static const List<String> coachLanguages =
      ChiefPageConstants.coachLanguagesData;
  static const List<String> coachTrainingType =
      ChiefPageConstants.coachTrainingTypeData;
  static const List<String> coachHasNoClientsMessages =
      ChiefPageConstants.coachHasNoClientsMessagesData;
  static List<SettingsPageElementModel> settingsPageElementModelList =
      ChiefPageConstants.settingsPageElementModelListData;
  static const List<AboutTrainingPageDropdownButtonItemModel>
      aboutTrainingPageDropdownButtonItemList =
      ChiefPageConstants.aboutTrainingPageDropdownButtonItemListData;
}
