import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/features/coach/presentation/pages/calendar/calendar_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chat/chat_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/chief_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/notifications_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/payments_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/settings_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/subscription_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/client_list/client_list_page.dart';

import '../../../features/coach/presentation/pages/coach_main_page.dart';

class CoachPageConstants {
  static const List<CoachPage> coachPagesList = [
    ChiefPage(),
    ClientListPage(),
    CalendarPage(),
    ChatPage()
  ];
  static List<SettingsPageElementModel> settingsPageElementModelList = [
    const SettingsPageElementModel(
      name: 'Платежи',
      route: PaymentsPage.id,
      iconPath: IconPath.payments,
    ),
    const SettingsPageElementModel(
      name: 'Подписки',
      route: SubscriptionsPage.id,
      iconPath: IconPath.subscription,
    ),
    const SettingsPageElementModel(
      name: 'Уведомления',
      route: NotificationsPage.id,
      iconPath: IconPath.notification,
    ),
  ];
  static const List<String> coachTrainingType = [
    'фитнес',
    'силовые',
    'CrossFit',
    'стретчинг (МФР)',
    'похудение',
  ];
  static const List<String> coachLanguages = [
    'RUS',
    'ENG',
    'KGZ',
    'KAZ',
    'ARA',
  ];
  static const List<String> coachHasNoClientsMessages = [
    'У вас пока нет клиентов, для добавления'
        ' клиентов в базу, отправьте им ссылку из «Действия».\n\n'
        'Примечание: вас клиенты в системе уже'
        ' видят и могу записаться к вам на тренировку.',
    'Для установления прочного доверия среди клиентов и '
        'обеспечения гладкой работы приложения для вас, '
        'рекомендуем заполнить ваш профиль. Просто зайдите'
        ' в раздел настроек, выберите '
        '"Edit" и обновите информацию о себе. '
        'Это поможет нам обеспечить вам наилучший сервис.'
  ];
  static const List<String> daysOfWeek = [
    'ПН',
    'ВТ',
    'СР',
    'ЧТ',
    'ПТ',
    'СБ',
    'ВС'
  ];
}
