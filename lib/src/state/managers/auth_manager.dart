import 'dart:math';

import 'package:rx_command/rx_command.dart';

import 'package:authflow/src/models/auth.dart';
import 'package:authflow/src/state/services/api_service.dart';
import 'package:authflow/src/utils/service_locator.dart';

abstract class AuthManager {
  RxCommand<AuthStatus, AuthStatus> authStatus;
  RxCommand<Map, bool> signInUser;
  RxCommand<Map, bool> signUpUser;
  RxCommand<void, bool> signOutUser;
  RxCommand<void, bool> fetchSavedCredentials;

  RxCommand<String, String> email;
  RxCommand<String, String> password;
}

class AuthManagerInstance implements AuthManager {
  @override
  RxCommand<String, String> email;

  @override
  RxCommand<String, String> password;

  @override
  RxCommand<AuthStatus, AuthStatus> authStatus;

  @override
  RxCommand<Map, bool> signInUser;

  @override
  RxCommand<Map, bool> signUpUser;

  @override
  RxCommand<void, bool> fetchSavedCredentials;

  @override
  RxCommand<void, bool> signOutUser;

  AuthManagerInstance() {
    authStatus = RxCommand.createSync<AuthStatus, AuthStatus>(
        (authStatus) => authStatus);

    signInUser = RxCommand.createAsync<Map, bool>(sl<APIService>().signInUser);

    // Return authentication status which can be used as the last result
    // to perform auth checks as opposed to making the API calls again
    signInUser.results
        .where((authResult) => authResult.data != null)
        .listen((authResult) {
      print("My ${authResult.data} is saved to local storage or database");
      authStatus(AuthStatus.LOGGED_IN);
    });

    signUpUser = RxCommand.createAsync<Map, bool>(sl<APIService>().signUpUser);

    signOutUser = RxCommand.createAsyncNoParam<bool>(() {
      var rnd = new Random();
      print("Clearing out my local data");
      Future.delayed(Duration(seconds: 5));
      return Future.value(rnd.nextBool());
    });

    // Return authentication status which can be used as the last result
    // to perform auth checks as opposed to making the API calls again
    signOutUser.results
        .where((authResult) => authResult.data != null)
        .listen((authResult) {
      if (authResult.data == true) {
        print("Successfully logged out");
        authStatus(AuthStatus.LOGGED_OUT);
      } else {
        print("An sign out error occured");
      }
    });

    fetchSavedCredentials = RxCommand.createAsyncNoParam<bool>(() {
      print("Fetching credentials");
      Future.delayed(Duration(seconds: 5));
      print("Finished fetching");
      return Future.value(false);
    });
  }
}
