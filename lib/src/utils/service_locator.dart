import 'package:get_it/get_it.dart';

import 'package:authflow/src/state/managers/auth_manager.dart';
import 'package:authflow/src/state/services/api_service.dart';

GetIt _getIt = GetIt.instance;

void setUpServiceLocator() {
  // Services
  _getIt.registerLazySingleton<APIService>(() => APIServiceInstance());

  // Managers
  _getIt.registerLazySingleton<AuthManager>(() => AuthManagerInstance());
}
