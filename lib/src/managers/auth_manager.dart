part of managers;

abstract class AuthManager {
  RxCommand<AuthStatus, AuthStatus> authStatus;
  RxCommand<void, AuthResponse> signInUser;
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
  RxCommand<void, AuthResponse> signInUser;

  @override
  RxCommand<void, bool> fetchSavedCredentials;

  @override
  RxCommand<void, bool> signOutUser;

  AuthManagerInstance() {
    authStatus = RxCommand.createSync<AuthStatus, AuthStatus>(
        (authStatus) => authStatus);

    signInUser = RxCommand.createAsyncNoParam<AuthResponse>(() async {
      SignInCredsRequest _creds = SignInCredsRequest(
        (s) => s
          ..email = _emailController.value
          ..password = _passwordController.value,
      );
      return await sl<APIService>().signInUser(
        credentials: _creds,
      );
    });

    // Return authentication status which can be used as the last result
    // to perform auth checks as opposed to making the API calls again
    signInUser.results
        .where((authResult) => authResult.data != null)
        .listen((authResult) {
      print("My ${authResult.data} is saved to local storage or database");
      authStatus(AuthStatus.LOGGED_IN);
    });

    signOutUser = RxCommand.createAsync<String, bool>(
      (String token) => sl<APIService>().signOutUser(token: token),
    );

    // Return authentication status which can be used as the last result
    // to perform auth checks as opposed to making the API calls again
    signOutUser.results
        .where((authResult) => authResult.data != null)
        .listen((authResult) {
      authStatus(AuthStatus.LOGGED_OUT);
    });

    fetchSavedCredentials = RxCommand.createAsyncNoParam<bool>(() async {
      print("Fetching credentials");
      await Future.delayed(Duration(seconds: 3));
      print("Finished fetching");
      return Future.value(false);
    });
  }

  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  Function(String) get onEmailChanged => _emailController.sink.add;
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();
  Function(String) get onPasswordChanged => _passwordController.sink.add;
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
