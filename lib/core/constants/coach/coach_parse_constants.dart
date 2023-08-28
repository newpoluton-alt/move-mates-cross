import '../../../features/coach/domain/usecase/get_clients_list_case.dart';
import '../../../features/coach/domain/usecase/get_up_coming_case.dart';
import '../common_constants.dart';
import 'coach_constants.dart';

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
