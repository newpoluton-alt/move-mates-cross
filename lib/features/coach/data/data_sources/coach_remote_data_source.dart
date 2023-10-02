import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:move_mates_android/core/error/coach_error/coach_exception.dart';
import 'package:move_mates_android/features/coach/domain/usecase/update_coach_profile_case.dart';

import '../../../../core/constants/common_parse_constants.dart';
import '../../../../core/network/request_http.dart';
import '../models/coach_clients_model.dart';
import '../models/coach_profile_model.dart';
import '../models/coach_up_coming_model.dart';

abstract class CoachRemoteDataSource {
  Future<CoachProfileModel> getCoachProfile(
      {required String token, required String url});

  Future<CoachProfileModel> updateCoachProfile({
    required String url,
    required String token,
    required CoachProfileParam params,
  });

  Future<CoachUpComingModel> getUpComingEvents({
    required String url,
    required String token,
  });

  Future<CoachClientsModel> getClientsList({
    required String url,
    required String token,
  });
}

class CoachRemoteDataSourceImpl extends CoachRemoteDataSource {
  final http.Client client;

  CoachRemoteDataSourceImpl({required this.client});

  @override
  Future<CoachUpComingModel> getUpComingEvents({
    required String token,
    required String url,
  }) async {
    final response = await _getResponse(url: url, token: token);
    return CoachUpComingModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<CoachClientsModel> getClientsList({
    required String url,
    required String token,
  }) async {
    final response = await _getResponse(url: url, token: token);
    return CoachClientsModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<CoachProfileModel> getCoachProfile({
    required String url,
    required String token,
  }) async {
    final request = RequestHttpImpl(client: client, url: url);

    final response = await request.get(
        headers: CommonParseConstants.headersWithToken(token));

    if (response.statusCode != 200) {
      throw CoachServerException();
    }


    return CoachProfileModel.fromJson(jsonDecode(response.body));
  }

  Future<http.Response> _getResponse({
    required String url,
    required String token,
  }) async {
    final request = RequestHttpImpl(client: client, url: url);

    final response = await request.get(
        headers: CommonParseConstants.headersWithToken(token));

    if (response.statusCode != 200) {
      throw CoachServerException();
    }
    return response;
  }

  @override
  Future<CoachProfileModel> updateCoachProfile({
    required String url,
    required String token,
    required CoachProfileParam params,
  }) async {
    final request = RequestHttpImpl(client: client, url: url);

    final response = await request.post(body: params, token: token);
    if (response.statusCode != 200) {
      throw CoachServerException();
    }

    return CoachProfileModel.fromJson(jsonDecode(response.body));
  }
}
