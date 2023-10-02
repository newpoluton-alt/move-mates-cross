import '../constants/error_messages.dart';
import 'coach_error/coach_exception.dart';
import 'coach_error/coach_failure.dart';
import 'failure.dart';

abstract class FailureConverter{
  String failureToString(Failure failure);
  Failure exceptionToFailure(Object exception);
}

class FailureConverterImpl implements FailureConverter{
  @override
  String failureToString(Failure failure) {
    switch (failure.runtimeType) {
      case CoachNoInternetConnectionFailure:
        return ErrorMessages.noInternetConnectionMessage;

      case CoachNoDataFailure:
        return ErrorMessages.noDataInCacheErrorMessage;

      case CoachCacheReadFailure:
        return ErrorMessages.userCredentialsReadErrorMessage;

      case CoachServerFailure:
        return ErrorMessages.problemsWithServerMessage;

      default:
        return ErrorMessages.unexpectedErrorMessage;
    }
  }

  @override
  Failure exceptionToFailure(Object error) {
    switch (error.runtimeType) {
      case CoachNoInternetConnectionException:
        return CoachNoInternetConnectionFailure();
      case CoachCacheReadException:
        return CoachCacheReadFailure();
      case CoachNoDataException:
        return CoachNoDataFailure();
      case CoachServerException:
        return CoachServerFailure();
      default:
        return CoachUnexpectedFailure();
    }
  }



}