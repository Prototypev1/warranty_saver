import 'package:get_it/get_it.dart';
import 'package:warranty_saver/core/domain/repository/theme_repository.dart';
import 'package:warranty_saver/core/presentation/navigation/router_configuration.dart';
import 'package:warranty_saver/feature/main_page_container/domain/cubit/main_page_cubit.dart';

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
  //..registerLazySingleton<LoadingPageCubit>(() => LoadingPageCubit())
  .registerLazySingleton<MainPageCubit>(() => MainPageCubit());
}
