import 'dart:convert';

import 'package:http/http.dart';

import '../constants/user_auth/user_auth_constants.dart';

abstract class RequestHttp {
  Future<Response> post({required Object body});

  Future<Response> get();

  const RequestHttp();
}

class RequestHttpImpl implements RequestHttp {
  final Client client;
  final String url;


  RequestHttpImpl({required this.client, required this.url});

  @override
  Future<Response> get() async {
    return await client.get(
      Uri.parse(url),
      headers: UserAuthParseConstants.headers,
    );
  }

  @override
  Future<Response> post({required Object body}) async {
    return await client.post(
      Uri.parse(url),
      headers: UserAuthParseConstants.headers,
      body: jsonEncode(body)
    );
  }
}
