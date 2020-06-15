part of utils;

GetIt sl = GetIt.instance;

void setUpServiceLocator() {
  // Services
  sl.registerLazySingleton<AuthService>(() => AuthServiceInstance());

  // Managers
  sl.registerLazySingleton<AuthManager>(() => AuthManagerInstance());
}
