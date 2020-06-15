part of utils;

GetIt sl = GetIt.instance;

void setUpServiceLocator() {
  // Services
  sl.registerLazySingleton<APIService>(() => APIServiceInstance());

  // Managers
  sl.registerLazySingleton<AuthManager>(() => AuthManagerInstance());
}
