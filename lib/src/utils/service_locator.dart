part of utils;

GetIt sl = GetIt.instance;

void setUpServiceLocator() {
  // Services
  sl.registerLazySingleton<AuthService>(() => AuthServiceInstance());
  sl.registerLazySingleton<APIService>(() => APIServiceInstance());

  // Managers
  sl.registerLazySingleton<AuthManager>(() => AuthManagerInstance());
  sl.registerLazySingleton<VirusManager>(() => VM());
}
