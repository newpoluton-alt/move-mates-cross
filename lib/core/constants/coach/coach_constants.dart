import 'package:move_mates_android/core/constants/constants.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_up_coming_case.dart';

class CoachConstants {
  static const String urlBaseTag = 'api/coaches/appointments/';
  static const String urlGetUpComingTag = 'getUpcomming';
}

class CoachParseConstants {
  static Map<String, String> headersForUpComing(String token) {
    // to turn immutable Map to mutable user Map.of
    Map<String, String> tempHeaders = Map.of(CommonConstants.headers);

    tempHeaders.addAll({
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return tempHeaders;
  }

  static String parametersForUpComing(UpComingParam param) {
    // return '?from=2023-07-31T06%3A18%3A03.000Z&size=999&page=0';
    return '?from=${param.fromDate}T06%3A18%3A03.000Z&size=${param.size}&page=${param.page}';
  }

  static String urlForGetUpComing(UpComingParam param) =>
      CommonConstants.baseUrl +
      CoachConstants.urlBaseTag +
      CoachConstants.urlGetUpComingTag +
      parametersForUpComing(param);
}
