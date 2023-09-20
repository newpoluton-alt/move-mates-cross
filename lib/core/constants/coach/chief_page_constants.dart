import '../../../config/routes/assets_routes.dart';
import '../../../config/theme/colors/green_color.dart';
import '../../../config/theme/colors/pink_color.dart';
import '../../../features/coach/presentation/pages/main/notifications_page.dart';
import '../../../features/coach/presentation/pages/main/payments_page.dart';
import '../../../features/coach/presentation/pages/main/settings_page.dart';
import '../../../features/coach/presentation/pages/main/subscription_page.dart';
import '../../../features/coach/presentation/widgets/about_training_page/about_training_page_alert_dialog_widget.dart';
import '../../../features/coach/presentation/widgets/about_training_page/about_training_page_bottom_sheet_modal_widget.dart';
import '../../../features/coach/presentation/widgets/about_training_page/about_training_page_client_info_widget.dart';

class ChiefPageConstants {
  static List<SettingsPageElementModel> settingsPageElementModelListData = [
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
  static const List<String> coachTrainingTypeData = [
    'фитнес',
    'силовые',
    'CrossFit',
    'стретчинг (МФР)',
    'похудение',
  ];
  static const List<String> coachLanguagesData = [
    'RUS',
    'ENG',
    'KGZ',
    'KAZ',
    'ARA',
  ];
  static const List<String> coachHasNoClientsMessagesData = [
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
  static const List<String> daysOfWeekData = [
    'ПН',
    'ВТ',
    'СР',
    'ЧТ',
    'ПТ',
    'СБ',
    'ВС'
  ];
  static const List<AboutTrainingPageDropdownButtonItemModel>
  aboutTrainingPageDropdownButtonItemListData = [
    AboutTrainingPageDropdownButtonItemModel(
        text: 'Перенести',
        textColor: GreenColor.g3,
        onTap: showAboutTrainingPageBottomSheetModal),
    AboutTrainingPageDropdownButtonItemModel(
        text: 'Отмена',
        textColor: PinkColor.p25,
        onTap: showAboutTrainingPageCancelDialog)
  ];
}