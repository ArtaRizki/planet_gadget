import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entity/core/textfield_model.dart';
part 'login_field_state.freezed.dart';

@freezed
class LoginFieldState with _$LoginFieldState {
  factory LoginFieldState({
    required TextFieldModel email,
    required TextFieldModel password,
    @Default(false) bool visiblePassword,
  }) = _LoginFieldState;

  factory LoginFieldState.empty() => LoginFieldState(
        email: const TextFieldModel(value: ""),
        password: const TextFieldModel(value: ""),
        visiblePassword: false,
      );
}
