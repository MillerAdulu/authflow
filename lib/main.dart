import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:authflow/src/utils/_index.dart';

import 'package:authflow/src/authflow.dart';

void main() {
  AuthflowConfig(
    values: AuthflowValues(
      baseAPIUrl: kDebugMode
          ? "https://5ee7dc92ffee0c0016a12806.mockapi.io/api/v1/"
          : "https://5ee7dc92ffee0c0016a12806.mockapi.io/api/v1/",
    ),
  );

  setUpServiceLocator();
  
  runApp(AuthFlow());
}
