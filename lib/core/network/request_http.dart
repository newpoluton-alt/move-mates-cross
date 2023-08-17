import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:move_mates_android/core/constants/common_constants.dart';

abstract class RequestHttp {
  Future<http.Response> post({required Object body});

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
  Future<http.Response> post({required Object body}) async {
    return await client.post(
      Uri.parse(url),
      headers: CommonConstants.baseHeaders,
      body: jsonEncode(body)
    );
  }
}
