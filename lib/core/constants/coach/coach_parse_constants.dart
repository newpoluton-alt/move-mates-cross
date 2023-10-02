import '../../../features/coach/domain/usecase/get_clients_list_case.dart';
import '../../../features/coach/domain/usecase/get_up_coming_case.dart';
import '../common_parse_constants.dart';
import 'coach_constants.dart';

class CoachParseConstants {


  static String urlForGettingCoachProfile() =>
      CommonParseConstants.baseUrl +
      CoachConstants.coachUrlBaseTag +
      CoachConstants.coachUrlMeTag;

  static String urlForUpdatingCoachProfile() =>
      CommonParseConstants.baseUrl +
      CoachConstants.coachUrlBaseTag +
      CoachConstants.coachUrlProfileUpdateTag;

  static String urlForCoachClients(ClientsListParam param) =>
      CommonParseConstants.baseUrl +
      CoachConstants.coachUrlBaseTag +
      CoachConstants.coachClientsTag +
      param.fieldsToUrlParam();

  static String urlForGetUpComing(UpComingParam param) =>
      CommonParseConstants.baseUrl +
      CoachConstants.coachUrlBaseTag +
      CoachConstants.coachAppointmentsTag +
      CoachConstants.urlGetUpComingTag +
      param.fieldsToUrlParam();
}
