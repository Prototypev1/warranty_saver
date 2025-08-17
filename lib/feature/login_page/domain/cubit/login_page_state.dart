import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_page_state.freezed.dart';

@freezed
sealed class LoginPageState with _$LoginPageState {
  const factory LoginPageState.initial() = LoginPageStateInitial;
  const factory LoginPageState.loading() = LoginPageStateLoading;
  const factory LoginPageState.success() = LoginPageStateSuccess;
  const factory LoginPageState.error({required String message}) = LoginPageStateError;
}
