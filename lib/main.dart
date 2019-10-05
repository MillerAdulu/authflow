import 'package:flutter/material.dart';

import 'package:authflow/src/authflow.dart';
import 'package:authflow/src/utils/service_locator.dart';

void main() {
  setUpServiceLocator();
  runApp(AuthFlow());
}
