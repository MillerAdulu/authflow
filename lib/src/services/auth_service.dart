part of services;

abstract class AuthService {
  Future<AuthResponse> signInUser({
    @required SignInCredsRequest credentials,
  });
  Future<bool> signOutUser({
    @required String token,
  });
}

class AuthServiceInstance implements AuthService {
  NetworkUtil _networkUtil = new NetworkUtil();

  String _baseUrl = AuthflowConfig.instance.values.baseAPIUrl;

  @override
  Future<AuthResponse> signInUser({
    @required SignInCredsRequest credentials,
  }) async {
    final String signInUrl = '$_baseUrl/auth';

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
    final String signOutUrl = '$_baseUrl/auth/signout';

    Map<String, dynamic> _response = await _networkUtil.postReq(
      signOutUrl,
      body: {"token": "sdfadsa"}.toString(),
    );

    print(_response);

    return true;
  }
}
