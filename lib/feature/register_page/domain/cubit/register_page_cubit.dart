import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warranty_saver/feature/register_page/domain/cubit/register_page_state.dart';
import 'package:warranty_saver/feature/register_page/domain/repository/register_page_repository.dart';

class RegisterPageCubit extends Cubit<RegisterPageState> {
  RegisterPageCubit(this._registerPageRepository) : super(RegisterPageState.initial());

  final RegisterPageRepository _registerPageRepository;

  Future<void> registerUser({required String email, required String password}) async {
    emit(const RegisterPageState.initial());
    try {
      await _registerPageRepository.registerUser(email: email, password: password);
      emit(const RegisterPageState.success());
      //add bool true for success
    } on Exception catch (e) {
      emit(RegisterPageState.error(message: 'there was an error while registering a user, $e'));
    }
  }
}
