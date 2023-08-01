import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:move_mates_android/core/constants/coach/coach_constants.dart';
import 'package:move_mates_android/core/error/coach_error/coach_exception.dart';

import '../../../../core/network/request_http.dart';
import '../models/coach_up_coming_model.dart';

abstract class CoachRemoteDataSource {
  Future<CoachUpComingModel> getUpComingEvents(
      {required String token, required String url});
}

class CoachRemoteDataSourceImpl extends CoachRemoteDataSource {
  final http.Client client;

  CoachRemoteDataSourceImpl({required this.client});

  @override
  Future<CoachUpComingModel> getUpComingEvents(
      {required String token, required String url}) async {
    final request = RequestHttpImpl(client: client, url: url);

    final response = await request.get(
        headers: CoachParseConstants.headersForUpComing(token));

    if (response.statusCode != 200) {
      throw CoachServerException();
    }
    return CoachUpComingModel.fromJson(jsonDecode(response.body));
  }
}
