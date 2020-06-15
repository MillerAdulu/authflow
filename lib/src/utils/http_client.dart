part of utils;

// IF YOU CHOOSE TO USE THE INBUILT HTTP CLASSES
class NetworkUtil {
  static NetworkUtil _networkUtil = NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _networkUtil;
  HttpClient _client = HttpClient();

  Future<dynamic> getReq(String url) async {
    /// Enable if you have a bad SSL certificate that you need to bypass for the meantime
    // _client.badCertificateCallback =
    //     ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest _req = await _client.getUrl(Uri.parse(url));
    var _vReq = await _setBasicHeaders(_req);

    HttpClientResponse _res = await _vReq.close();

    final String responseBody = await _res.transform(utf8.decoder).join();

    if (responseBody.isEmpty) return null;

    return json.decode(responseBody);
  }

  Future<dynamic> postReq(String url, {String body, encoding}) async {
    /// Enable if you have a bad SSL certificate that you need to bypass for the meantime
    // _client.badCertificateCallback =
    //     ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest _req = await _client.postUrl(Uri.parse(url));
    var _vReq = await _setBasicHeaders(_req);

    _vReq.add(utf8.encode(body));

    HttpClientResponse _res = await _vReq.close();

    final String responseBody = await _res.transform(utf8.decoder).join();

    if (responseBody.isEmpty) return null;

    return json.decode(responseBody);
  }

  Future<HttpClientRequest> _setBasicHeaders(HttpClientRequest _req) async {
    String bearerToken = await _getBearerToken();
    _req.headers.add('Content-Type', 'application/json');
    _req.headers.add('Authorization', 'Bearer $bearerToken');
    return _req;
  }

  Future<String> _getBearerToken() async {
    // Fetch the user's auth token from wherever it's located and return it here
    return '';
  }
}

/// IF YOU CHOOSE TO USE THE HTTP PACKAGE
// class NetworkUtil {
//   static NetworkUtil _networkUtil = new NetworkUtil.internal();
//   NetworkUtil.internal();
//   factory NetworkUtil() => _networkUtil;

//   Future<dynamic> getReq(String url) async {
//     final basicHeaders = await setBasicHeaders();
//     http.Response response = await http.get(url, headers: {
//       ...basicHeaders,
//     });

//     final String responseBody = response.body;

//     if (responseBody.isEmpty) return null;

//     return json.decode(responseBody);
//   }

//   Future<dynamic> postReq(String url, {Map body, encoding}) async {
//     final basicHeaders = await setBasicHeaders();
//     http.Response response = await http.post(url,
//         headers: {
//           ...basicHeaders,
//         },
//         body: body,
//         encoding: encoding);

//     final String responseBody = response.body;

//     if (responseBody.isEmpty) return null;

//     return json.decode(responseBody);
//   }

//   Future<dynamic> putReq(String url, {Map body, encoding}) async {
//     final basicHeaders = await setBasicHeaders();
//     http.Response response = await http.put(url,
//         headers: {
//           ...basicHeaders,
//         },
//         body: body,
//         encoding: encoding);

//     final String responseBody = response.body;

//     if (responseBody.isEmpty) return null;

//     return json.decode(responseBody);
//   }

//   Future<dynamic> patchReq(String url, {Map body, encoding}) async {
//     final basicHeaders = await setBasicHeaders();
//     http.Response response = await http.patch(url,
//         headers: {
//           ...basicHeaders,
//         },
//         body: body,
//         encoding: encoding);

//     final String responseBody = response.body;

//     if (responseBody.isEmpty) return null;

//     return json.decode(responseBody);
//   }

//   Future<dynamic> deleteReq(String url) async {
//     final basicHeaders = await setBasicHeaders();
//     http.Response response = await http.delete(url, headers: {
//       ...basicHeaders,
//     });

//     final String responseBody = response.body;

//     if (responseBody.isEmpty) return null;

//     return json.decode(responseBody);
//   }

//   Future<dynamic> setBasicHeaders() async {
//     String bearerToken = await getBearerToken();
//     return {
//       HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
//       HttpHeaders.acceptHeader: 'application/json',
//       HttpHeaders.authorizationHeader: 'Bearer $bearerToken',
//     };
//   }

// Future<String> getBearerToken() async {
//   // Fetch the user's auth token from wherever it's located and return it here
//   return '';
// }
// }
