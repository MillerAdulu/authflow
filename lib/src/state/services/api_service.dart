import 'package:authflow/src/utils/http/network.dart';

abstract class APIService {
  Future<bool> signInUser(Map credentials);
  Future<bool> signOutUser(String refreshToken);
}

class APIServiceInstance implements APIService {
  NetworkUtil _networkUtil = new NetworkUtil();

  String baseUrl = 'http://example.com/api';

  @override
  Future<bool> signInUser(Map credentials) async {
    // TODO: Uncomment the API call
    // final String signInUrl = '$baseUrl/auth/signin';

    // dynamic response = await _networkUtil.postReq(signInUrl, body: {
    //   'email': credentials['email'],
    //   'password': credentials['password']
    // });

    // if (response == null) return null;
    // return response;

    // Delays the sign in for a bit to mock an API call
    print("Starting fetch");
    await Future.delayed(Duration(seconds: 5));
    print("Ending fetch");
    // Mocks validation from the API.
    // True: Successful sign in
    // False: Failed sign in
    if (credentials['email'] == '' || credentials['password'] == '')
      throw Exception('Check your credentials');
    return true;
  }

  @override
  Future<bool> signOutUser(String refreshToken) async {
    // TODO: Uncomment the API call
    // final String signOutUrl = '$baseUrl/auth/signout';

    // dynamic response = await _networkUtil.postReq(signOutUrl, body: {
    //   'token': refreshToken
    // });

    // if (response == null) return null;
    // return response;

    // Delays the sign out for a bit to mock an API call
    print("Starting revoke");
    await Future.delayed(Duration(seconds: 3));
    print("Ending revoke");
    // Mocks validation from the API.
    // True: Successful sign in
    // False: Failed sign in
    if (refreshToken == '') throw Exception('Undefined token');
    return true;
  }
}
