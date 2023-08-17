import 'package:move_mates_android/core/constants/common_constants.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_up_coming_case.dart';

import '../../../features/coach/domain/usecase/get_clients_list_case.dart';

class CoachConstants {
  static const String coachUrlBaseTag = 'api/coaches/';
  static const String coachAppointmentsTag = 'appointments/';
  static const String coachClientsTag = 'clients';
  static const String urlGetUpComingTag = 'getUpcomming';
}

class CoachParseConstants {
  static Map<String, String> headersWithToken(String token) {
    // to turn immutable Map to mutable user Map.of
    Map<String, String> tempHeaders = Map.of(CommonConstants.baseHeaders);

    tempHeaders.addAll({
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return tempHeaders;
  }

  static String urlForCoachClients(ClientsListParam param) =>
      CommonConstants.baseUrl +
      CoachConstants.coachUrlBaseTag +
      CoachConstants.coachClientsTag +
      param.fieldsToUrlParam();

  static String urlForGetUpComing(UpComingParam param) =>
      CommonConstants.baseUrl +
      CoachConstants.coachUrlBaseTag +
      CoachConstants.coachAppointmentsTag +
      CoachConstants.urlGetUpComingTag +
      param.fieldsToUrlParam();
}
