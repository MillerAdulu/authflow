import 'package:flutter/material.dart';

import 'package:authflow/src/screens/decision.dart';

class AuthFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Flow',
      home: DecisionPage(),
    );
  }
}
