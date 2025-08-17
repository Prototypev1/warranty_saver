import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warranty_saver/feature/login_page/domain/cubit/login_page_state.dart';
import 'package:warranty_saver/feature/login_page/domain/repository/login_page_repository.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit(this._loginPageRepository) : super(LoginPageState.initial());

  final LoginPageRepository _loginPageRepository;

  Future<void> login({required String email, required String password, required bool rememberMe}) async {
    emit(const LoginPageState.loading());
    try {
      await _loginPageRepository.login(email: email, password: password, rememberMe: rememberMe);
      emit(const LoginPageState.success());
    } on Exception catch (e) {
      emit(LoginPageState.error(message: 'there was an error logging in a user, $e'));
    }
  }
}
