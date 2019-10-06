import 'package:flutter/material.dart';
import 'package:rx_command/rx_command_listener.dart';

import 'package:authflow/src/models/auth.dart';
import 'package:authflow/src/screens/home.dart';
import 'package:authflow/src/state/managers/auth_manager.dart';
import 'package:authflow/src/utils/service_locator.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  RxCommandListener _signInListener;
  RxCommandListener _authStatusListener;

  @override
  void initState() {
    super.initState();

    _signInListener = RxCommandListener(sl<AuthManager>().signInUser,
        onError: (error) => _onErrorSignIn(error));

    _authStatusListener = RxCommandListener(sl<AuthManager>().authStatus,
        onValue: (authStatusValue) {
      if (authStatusValue == AuthStatus.LOGGED_IN)
        _redirectToPage(context, Home());
    });
  }

  @override
  void dispose() {
    _signInListener?.dispose();
    _authStatusListener?.dispose();
    super.dispose();
  }

  void _onErrorSignIn(dynamic error) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('${error.toString()}'),
          action: SnackBarAction(
            label: "Dismiss",
            onPressed: () {
              Scaffold.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      ),
    );
  }

  void _redirectToPage(BuildContext context, Widget page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MaterialPageRoute newRoute = MaterialPageRoute(
        builder: (BuildContext context) => page,
      );

      Navigator.of(context).pushAndRemoveUntil(
        newRoute,
        ModalRoute.withName('/login'),
      );
    });
  }

  // Prevents the use of the "back" button
  Future<bool> _onWillPopScope() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 48),
                alignment: AlignmentDirectional.center,
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(
                height: 32,
              ),
              Container(
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      StreamBuilder<String>(
                        stream: sl<AuthManager>().email,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                labelText: 'Email',
                                errorText: snapshot.error.toString()),
                            onChanged: sl<AuthManager>().email,
                            keyboardType: TextInputType.emailAddress,
                          );
                        },
                      ),
                      StreamBuilder<String>(
                        stream: sl<AuthManager>().password,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                errorText: snapshot.error.toString()),
                            onChanged: sl<AuthManager>().password,
                            obscureText: true,
                          );
                        },
                      ),
                      FlatButton(
                        child: Text('Sign In'),
                        onPressed: () {
                          final credentials = new Map();
                          credentials['email'] = _emailController.text;
                          credentials['password'] = _passwordController.text;

                          sl<AuthManager>().signInUser(credentials);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
