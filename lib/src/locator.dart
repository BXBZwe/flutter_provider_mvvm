import 'package:get_it/get_it.dart';
import 'package:demo_provider_mvvm/src/data/services/user_service.dart';

final GetIt locator = GetIt.instance;

// locator.dart
void setupLocator({UserService Function()? userServiceFactory}) {
  locator.registerLazySingleton<UserService>(
    () => userServiceFactory?.call() ?? UserService(),
  );
  // Register other services here
  // locator.registerFactory(
  //   () => LoginViewModel(userService: locator<UserService>()),
  // );
  // locator.registerFactory(
  //   () => SignUpViewModel(userService: locator<UserService>()),
  // );
}
