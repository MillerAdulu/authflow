import 'package:authflow/src/models/auth.dart';
import 'package:rx_command/rx_command.dart';

abstract class AuthManager {
  RxCommand<Map, AuthResult> signInUser;
  RxCommand<Map, AuthResult> signUpUser;
  RxCommand<void, AuthResult> signOutUser;
  RxCommand<void, bool> fetchSavedCredentials;

  RxCommand<String, String> emailChanged;
  RxCommand<String, String> passwordChanged;
}

class AuthManagerInstance implements AuthManager {
  @override
  RxCommand<String, String> emailChanged;

  @override
  RxCommand<String, String> passwordChanged;

  @override
  RxCommand<Map, AuthResult> signInUser;

  @override
  RxCommand<Map, AuthResult> signUpUser;

  @override
  RxCommand<void, bool> fetchSavedCredentials;

  @override
  RxCommand<void, AuthResult> signOutUser;
}
