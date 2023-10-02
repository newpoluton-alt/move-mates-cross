import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:move_mates_android/core/constants/common_parse_constants.dart';
import 'package:move_mates_android/core/usescases/usecase.dart';

abstract class RequestHttp {
  Future<http.Response> post({required Param body});

  Future<http.Response> get({required Map<String, String> headers});

  const RequestHttp();
}

class RequestHttpImpl implements RequestHttp {
  final http.Client client;
  final String url;

  RequestHttpImpl({required this.client, required this.url});

  @override
  Future<http.Response> get({required Map<String, String> headers}) async {
    return await client.get(
      Uri.parse(url),
      headers: headers,
    );
  }

  @override
  Future<http.Response> post({
    String? token,
    required Param body,
  }) async {
    return await client.post(
      Uri.parse(url),
      headers: token == null
          ? CommonParseConstants.baseHeaders
          : CommonParseConstants.headersWithToken(token),
      body: jsonEncode(body),
    );
  }
}
