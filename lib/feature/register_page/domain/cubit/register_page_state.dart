import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_page_state.freezed.dart';

@freezed
sealed class RegisterPageState with _$RegisterPageState {
  const factory RegisterPageState.initial() = RegisterPageStateInitial;
  const factory RegisterPageState.loading() = RegisterPageStateLoading;
  const factory RegisterPageState.success() = RegisterPageStateSuccess;
  const factory RegisterPageState.error({required String message}) = RegisterPageStateError;
}
