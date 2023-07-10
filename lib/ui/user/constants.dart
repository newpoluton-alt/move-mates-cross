
import '../theme/constants.dart';
import 'models/navigation_bar_model.dart';

class UserPageData {
  static const  List<BottomNavigationBarModel> bottomNavigationBarModelList = [
    BottomNavigationBarModel(name: 'Главная', path: IconPath.home),
    BottomNavigationBarModel(name: 'Клиенты', path: IconPath.client),
    BottomNavigationBarModel(name: 'Календарь', path: IconPath.calendar),
    BottomNavigationBarModel(name: 'Чаты', path: IconPath.chat),
  ];
}
