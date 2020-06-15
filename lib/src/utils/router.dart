part of utils;

/// Useful for reporting page navigations to Firebase to track progress in the app
class Router {
  static const String decisionRoute = '/decision';
  static const String loginRoute = '/sign_in';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    /// Use if your widget expects some arguments
    // final args = settings.arguments;

    switch (settings.name) {
      case decisionRoute:
        return _route(DecisionPage());
        break;
      case loginRoute:
        return _route(SignIn());
        break;
      case home:
        return _route(Home());
        break;
      default:
        return _route(
          Scaffold(
            appBar: AppBar(
              title: Text('Authflow'),
            ),
            body: Center(
              child: Text('Unknown page'),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute _route(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
