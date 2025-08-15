import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:warranty_saver/core/domain/repository/theme_repository.dart';
import 'package:warranty_saver/core/presentation/navigation/router_configuration.dart';
import 'package:warranty_saver/feature/add_page.dart/domain/cubit/login_page_cubit.dart';
import 'package:warranty_saver/feature/add_page.dart/domain/repository/login_page_repository.dart';
import 'package:warranty_saver/feature/add_page.dart/domain/repository/login_repository_impl.dart';
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
    ..registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance)
    ..registerSingleton<FirebaseAuth>(FirebaseAuth.instance)
    ..registerSingleton<RegisterPageRepository>(
      RegisterPageRepositoryImpl(getIt<FirebaseAuth>(), getIt<FirebaseFirestore>()),
    )
    ..registerSingleton<LoginPageRepository>(
      LoginRepositoryImpl(getIt<FirebaseAuth>()),
    );
}

void _registerCubits() {
  getIt
    ..registerLazySingleton<RegisterPageCubit>(() => RegisterPageCubit(getIt<RegisterPageRepository>()))
    ..registerLazySingleton<LoginPageCubit>(() => LoginPageCubit(getIt<LoginPageRepository>()))
    ..registerLazySingleton<MainPageCubit>(() => MainPageCubit());
}
