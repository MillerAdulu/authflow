part of utils;

class AuthflowValues {
  final String baseAPIUrl;

  AuthflowValues({
    @required this.baseAPIUrl,
  });
}

class AuthflowConfig {
  final AuthflowValues values;
  static AuthflowConfig _instance;

  factory AuthflowConfig({
    @required AuthflowValues values,
  }) {
    _instance ??= AuthflowConfig._internal(values);
    return _instance;
  }

  AuthflowConfig._internal(this.values);

  static AuthflowConfig get instance => _instance;
}
