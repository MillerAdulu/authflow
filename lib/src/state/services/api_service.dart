import 'dart:math';

import 'package:authflow/src/utils/http/network.dart';

abstract class APIService {
  Future<dynamic> signInUser(Map credentials);
  Future<dynamic> signUpUser(Map credentials);
}

class APIServiceInstance implements APIService {
  NetworkUtil _networkUtil = new NetworkUtil();

  var rng = new Random();

  String baseUrl = 'http://example.com/api';

  @override
  Future signInUser(Map credentials) async {
    // TODO: Uncomment the API call
    // final String signInUrl = '$baseUrl/auth/signin';

    // dynamic response = await _networkUtil.postReq(signInUrl, body: {
    //   'email': credentials['email'],
    //   'password': credentials['password']
    // });

    // if (response == null) return null;
    // return response;

    // Delays the sign in for a bit to mock an API call
    Future.delayed(Duration(seconds: 4));

    // Mocks validation from the API.
    // True: Successful sign in
    // False: Failed sign in
    return rng.nextBool();
  }

  @override
  Future signUpUser(Map credentials) async {
    // TODO: Uncomment the API call
    // final String signUpUrl = '$baseUrl/auth/signup';

    // dynamic response = await _networkUtil.postReq(signUpUrl, body: {
    //   'email': credentials['email'],
    //   'password': credentials['password']
    // });

    // if (response == null) return null;
    // return response;

    // Delays the sign in for a bit to mock an API call
    Future.delayed(Duration(seconds: 4));

    // Mocks validation from the API.
    // True: Successful sign in
    // False: Failed sign in
    return rng.nextBool();
  }
}
