import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

extension LoginGetters on LoginState {
  bool get isLoading => this is _LoginStateLoading;
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _LoginStateInitial;
  const factory LoginState.loading() = _LoginStateLoading;
  const factory LoginState.error([String? error]) = _LoginStateError;
}
