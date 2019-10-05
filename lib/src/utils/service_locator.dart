import 'package:get_it/get_it.dart';

import 'package:authflow/src/state/managers/auth_manager.dart';
import 'package:authflow/src/state/services/api_service.dart';

GetIt sl = GetIt.instance;

void setUpServiceLocator() {
  // Services
  sl.registerLazySingleton<APIService>(() => APIServiceInstance());

  // Managers
  sl.registerLazySingleton<AuthManager>(() => AuthManagerInstance());
}
