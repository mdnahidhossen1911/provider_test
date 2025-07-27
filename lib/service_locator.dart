import 'package:get_it/get_it.dart';
import 'package:provider_test/repository/auth_repository.dart';
import 'package:provider_test/view_model/auth_view_model.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // Register repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());

  // Register view models
  getIt.registerFactory<AuthViewModel>(() => AuthViewModel());
}

