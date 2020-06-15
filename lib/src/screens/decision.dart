import 'package:flutter/material.dart';
import 'package:rx_command/rx_command.dart';

import 'package:authflow/src/managers/_index.dart';
import 'package:authflow/src/utils/_index.dart';

import 'package:authflow/src/screens/home.dart';
import 'package:authflow/src/screens/sign_in.dart';

class DecisionPage extends StatefulWidget {
  @override
  _DecisionPageState createState() => _DecisionPageState();
}

class _DecisionPageState extends State<DecisionPage> {
  @override
  void initState() {
    super.initState();

    sl<AuthManager>().fetchSavedCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CommandResult<bool>>(
        stream: sl<AuthManager>().fetchSavedCredentials.results,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final result = snapshot.data;

          if (result?.data == true) _redirectToPage(context, Home());

          if (result?.data == null) _redirectToPage(context, SignIn());

          return Scaffold(
            body: Center(
              child: Text('Initializing ...'),
            ),
          );
        });
  }

  void _redirectToPage(BuildContext context, Widget page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MaterialPageRoute newRoute =
          MaterialPageRoute(builder: (BuildContext contenxt) => page);

      Navigator.of(context).pushAndRemoveUntil(
          newRoute, ModalRoute.withName(Router.decisionRoute));
    });
  }
}
