import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planet_gadget/domain/entity/core/textfield_model.dart';
import '../../../library/validator.dart';
import 'login_field_state.dart';

final loginFieldNotifier =
    StateNotifierProvider.autoDispose<LoginFieldNotifier, LoginFieldState>(
        (ref) => LoginFieldNotifier());

class LoginFieldNotifier extends StateNotifier<LoginFieldState> {
  LoginFieldNotifier() : super(LoginFieldState.empty());

  init() {
    state = LoginFieldState.empty();
  }

  changeVisiblePassword() =>
      state = state.copyWith(visiblePassword: !(state.visiblePassword));

  checkField(
      {String? val,
      required bool fieldEmpty,
      required String fieldErrorMsg,
      required String errorMsg,
      required String type}) {
    changeValue(type: type, value: val ?? "");
    String? msg = type == "email"
        ? checkEmailField(val: val, errorMsg: errorMsg)
        : checkPasswordField(val: val, errorMsg: errorMsg);
    fieldEmpty = msg != null;
    if (fieldEmpty) {
      changeEmpty(type: type);
      // state = state.copyWith(email: state.email.copyWith(isEmpty: true));
    }
    fieldErrorMsg = msg ?? "";
    changeErrorMessage(type: type, fieldErrorMsg: fieldErrorMsg);
  }

  changeValue({required String type, required String value}) {
    if (type == "email") {
      state = state.copyWith(email: state.email.copyWith(value: value));
    }
    if (type == "password") {
      state = state.copyWith(password: state.password.copyWith(value: value));
    }
  }

  changeErrorMessage({required String type, required String fieldErrorMsg}) {
    if (type == "email") {
      state = state.copyWith(
          email: state.email.copyWith(errorMessage: fieldErrorMsg));
    }
    if (type == "password") {
      state = state.copyWith(
          password: state.password.copyWith(errorMessage: fieldErrorMsg));
    }
  }

  changeEmpty({required String type}) {
    if (type == "email") {
      state = state.copyWith(email: state.email.copyWith(isEmpty: true));
    }
    if (type == "password") {
      state = state.copyWith(password: state.password.copyWith(isEmpty: true));
    }
  }

  Future<void> login() async {
    List<TextFieldModel> textFieldModel = [
      state.email,
      state.password,
    ];
    List<String> typeList = ["email", "password"];
    List<String> errorMsgStringList = [
      "Email",
      "Password",
    ];
    for (int i = 0; i < textFieldModel.length; i++) {
      TextFieldModel item = textFieldModel[i];
      checkField(
        val: item.value,
        fieldEmpty: item.isEmpty,
        fieldErrorMsg: item.errorMessage,
        errorMsg: "${errorMsgStringList[i]} harus diisi",
        type: typeList[i],
      );
    }
  }
}
