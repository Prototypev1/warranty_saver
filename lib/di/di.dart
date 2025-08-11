import 'package:get_it/get_it.dart';
import 'package:warranty_saver/core/domain/repository/theme_repository.dart';
import 'package:warranty_saver/core/presentation/navigation/router_configuration.dart';
import 'package:warranty_saver/feature/main_page_container/domain/cubit/main_page_cubit.dart';
import 'package:warranty_saver/feature/register_page/domain/cubit/register_page_cubit.dart';
import 'package:warranty_saver/feature/register_page/domain/repository/register_page_repository.dart';
import 'package:warranty_saver/feature/register_page/domain/repository/register_page_repository_impl.dart';

final GetIt getIt = GetIt.instance;
Future<void> initDI() async {
  await _registerUtils();
  _registerCubits();
}

Future<void> _registerUtils() async {
  getIt
    ..registerSingleton<ThemeRepository>(ThemeRepository())
    ..registerSingleton<RouterConfiguration>(RouterConfiguration())
    ..registerSingleton<RegisterPageRepository>(RegisterPageRepositoryImpl());
}

void _registerCubits() {
  getIt
    ..registerLazySingleton<RegisterPageCubit>(() => RegisterPageCubit(getIt<RegisterPageRepository>()))
    ..registerLazySingleton<MainPageCubit>(() => MainPageCubit());
}
