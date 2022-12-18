
import 'package:get_it/get_it.dart';
import 'package:presentation_layer/view_models/login/login_view_model.dart';
import 'package:presentation_layer/view_models/splash/splash_view_model.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton<SplashViewModel>(
    () => SplashViewModel(),
  );

  serviceLocator.registerFactory<LoginViewModel>(
    () => LoginViewModel(),
  );
}
