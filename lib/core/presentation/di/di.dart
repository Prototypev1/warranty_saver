import 'package:get_it/get_it.dart';
import 'package:warranty_saver/core/presentation/domain/repository/theme_repository.dart';
import 'package:warranty_saver/core/presentation/navigation/router_configuration.dart';

final GetIt getIt = GetIt.instance;
Future<void> initDI() async {
  await _registerUtils();
  _registerCubits();
}

Future<void> _registerUtils() async {
  getIt
    ..registerSingleton<ThemeRepository>(ThemeRepository())
    ..registerSingleton<RouterConfiguration>(RouterConfiguration());
}

void _registerCubits() {
  getIt
    ..registerLazySingleton<LoadingScreenCubit>(() => LoadingScreenCubit())
    ..registerLazySingleton<MainPageCubit>(() => MainPageCubit());
}
