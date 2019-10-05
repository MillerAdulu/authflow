import 'package:authflow/src/utils/http/network.dart';

abstract class APIService {
  Future<dynamic> signInUser(Map credentials);
  Future<dynamic> signUpUser(Map credentials);
}

class APIServiceInstance implements APIService {
  NetworkUtil _networkUtil = new NetworkUtil();

  String baseUrl = 'http://example.com/api';

  @override
  Future signInUser(Map credentials) async {
    final String signInUrl = '$baseUrl/auth/signin';

    dynamic response = await _networkUtil.postReq(signInUrl, body: {
      'email': credentials['email'],
      'password': credentials['password']
    });

    if (response == null) return null;
    return response;
  }

  @override
  Future signUpUser(Map credentials) async {
    final String signUpUrl = '$baseUrl/auth/signup';

    dynamic response = await _networkUtil.postReq(signUpUrl, body: {
      'email': credentials['email'],
      'password': credentials['password']
    });

    if (response == null) return null;
    return response;
  }
}
