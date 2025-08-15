import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warranty_saver/feature/add_page.dart/domain/cubit/login_page_state.dart';
import 'package:warranty_saver/feature/add_page.dart/domain/repository/login_page_repository.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit(this._loginPageRepository) : super(LoginPageState.initial());

  final LoginPageRepository _loginPageRepository;

  Future<void> login({required String email, required String password}) async {
    emit(const LoginPageState.loading());
    try {
      await _loginPageRepository.login(email: email, password: password);
      emit(const LoginPageState.success());
    } on Exception catch (e) {
      emit(LoginPageState.error(message: 'there was an error logging in a user, $e'));
    }
  }
}
