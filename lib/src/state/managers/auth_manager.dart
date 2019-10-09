import 'dart:math';

import 'package:rx_command/rx_command.dart';
import 'package:rxdart/subjects.dart';

import 'package:authflow/src/models/auth.dart';
import 'package:authflow/src/state/services/api_service.dart';
import 'package:authflow/src/utils/service_locator.dart';
import 'package:authflow/src/utils/validators/email_validator.dart';
import 'package:authflow/src/utils/validators/password_validator.dart';

abstract class AuthManager {
  RxCommand<AuthStatus, AuthStatus> authStatus;
  RxCommand<Map, bool> signInUser;
  RxCommand<void, bool> signOutUser;
  RxCommand<void, bool> fetchSavedCredentials;

  Function(String) get onEmailChanged;
  Stream<String> get email;
  Function(String) get onPasswordChanged;
  Stream<String> get password;
}

class AuthManagerInstance
    with EmailValidator, PasswordValidator
    implements AuthManager {
  @override
  RxCommand<AuthStatus, AuthStatus> authStatus;

  @override
  RxCommand<Map, bool> signInUser;

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
      if (authResult.data == true) {
        print("My ${authResult.data} is saved to local storage or database");
        authStatus(AuthStatus.LOGGED_IN);
      } else
        print('Check your credentials');
    });

    signOutUser = RxCommand.createAsyncNoParam<bool>(() async {
      var rnd = new Random();
      print("Clearing out my local data");
      await Future.delayed(Duration(seconds: 3));
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

    fetchSavedCredentials = RxCommand.createAsyncNoParam<bool>(() async {
      print("Fetching credentials");
      await Future.delayed(Duration(seconds: 3));
      print("Finished fetching");
      return Future.value(false);
    });
  }

  final PublishSubject<String> _emailController = PublishSubject<String>();
  Function(String) get onEmailChanged => _emailController.sink.add;
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  final PublishSubject<String> _passwordController = PublishSubject<String>();
  Function(String) get onPasswordChanged => _passwordController.sink.add;
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
