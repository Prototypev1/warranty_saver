import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warranty_saver/core/domain/cubit/app/app_state.dart';
import 'package:warranty_saver/core/domain/repository/theme_repository.dart';

class AppCubit extends Cubit<AppState> {
  //still nothing here
  AppCubit(this._themeRepository) : super(const AppState.initial());

  // ignore: unused_field
  final ThemeRepository _themeRepository;
}
