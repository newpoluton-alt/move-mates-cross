import 'dart:convert';

import 'package:http/http.dart';
import 'package:move_mates_android/core/constants/constants.dart';

abstract class RequestHttp {
  Future<Response> post({required Object body});

  Future<Response> get({required Map<String, String> headers});

  const RequestHttp();
}

class RequestHttpImpl implements RequestHttp {
  final Client client;
  final String url;


  RequestHttpImpl({required this.client, required this.url});

  @override
  Future<Response> get({required Map<String, String> headers}) async {
    return await client.get(
      Uri.parse(url),
      headers: headers,
    );
  }

  @override
  Future<Response> post({required Object body}) async {
    return await client.post(
      Uri.parse(url),
      headers: CommonConstants.headers,
      body: jsonEncode(body)
    );
  }
}
