
import '../../config/routes/assets_routes.dart';
import '../../features/coach/presentation/pages/coach_page.dart';

class UserPageData {
  static const  List<BottomNavigationBarModel> bottomNavigationBarModelList = [
    BottomNavigationBarModel(name: 'Главная', path: IconPath.home),
    BottomNavigationBarModel(name: 'Клиенты', path: IconPath.client),
    BottomNavigationBarModel(name: 'Календарь', path: IconPath.calendar),
    BottomNavigationBarModel(name: 'Чаты', path: IconPath.chat),
  ];
}
