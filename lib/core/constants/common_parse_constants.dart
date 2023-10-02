class CommonParseConstants {
  static const String baseUrl = 'http://54.221.157.175:8086/';
  // static const String baseUrl = 'http://172.16.0.237:8086/';
  // static const String baseUrl = 'http://192.168.0.103:8086/';

  static Map<String, String> headersWithToken(String token) {
    // to turn immutable Map to mutable user Map.of
    Map<String, String> tempHeaders = Map.of(baseHeaders);

    tempHeaders.addAll({
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return tempHeaders;
  }
  static const Map<String, String> baseHeaders = {
    'Content-Type': 'application/json'
  };
}