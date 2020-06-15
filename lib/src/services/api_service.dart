part of services;

abstract class APIService {
  Future<AuthResponse> signInUser({
    @required SignInCredsRequest credentials,
  });
  Future<bool> signOutUser({
    @required String token,
  });
}

class APIServiceInstance implements APIService {
  NetworkUtil _networkUtil = new NetworkUtil();

  String baseUrl = 'http://example.com/api';

  @override
  Future<AuthResponse> signInUser({
    @required SignInCredsRequest credentials,
  }) async {
    final String signInUrl = '$baseUrl/auth/signin';

    Map<String, dynamic> response = await _networkUtil.postReq(
      signInUrl,
      body: credentials.toJson(),
    );

    return AuthResponse.fromJson(response);
  }

  @override
  Future<bool> signOutUser({
    @required String token,
  }) async {
    final String signOutUrl = '$baseUrl/auth/signout';

    Map<String, dynamic> _response = await _networkUtil.postReq(
      signOutUrl,
      body: {"token": "sdfadsa"}.toString(),
    );

    print(_response);

    return true;
  }
}
