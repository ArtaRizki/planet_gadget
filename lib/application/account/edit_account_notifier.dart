import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planet_gadget/domain/entity/core/textfield_model.dart';
import '../../library/validator.dart';
import 'edit_account_state.dart';

final editAccountNotifier =
    StateNotifierProvider.autoDispose<EditAccountNotifier, EditAccountState>(
        (ref) => EditAccountNotifier());

class EditAccountNotifier extends StateNotifier<EditAccountState> {
  EditAccountNotifier() : super(EditAccountState.empty());

  init() {
    state = EditAccountState.empty();
  }

  checkField(
      {String? val,
      required bool fieldEmpty,
      required String fieldErrorMsg,
      required String errorMsg,
      required String type}) {
    String? msg = checkGeneralField(val: val, errorMsg: errorMsg);
    fieldEmpty = msg != null;
    if (fieldEmpty) {
      changeEmpty(type: type);
      // state = state.copyWith(name: state.name.copyWith(isEmpty: true));
    }
    fieldErrorMsg = msg ?? "";
    changeErrorMessage(type: type, fieldErrorMsg: fieldErrorMsg);
  }

  changeErrorMessage({required String type, required String fieldErrorMsg}) {
    if (type == "name") {
      state = state.copyWith(
          name: state.name.copyWith(errorMessage: fieldErrorMsg));
    }
    if (type == "ktp") {
      state =
          state.copyWith(ktp: state.ktp.copyWith(errorMessage: fieldErrorMsg));
    }
    if (type == "phoneNumber") {
      state = state.copyWith(
          phoneNumber: state.phoneNumber.copyWith(errorMessage: fieldErrorMsg));
    }
    if (type == "birthday") {
      state = state.copyWith(
          birthday: state.birthday.copyWith(errorMessage: fieldErrorMsg));
    }
  }

  changeEmpty({required String type}) {
    if (type == "name") {
      state = state.copyWith(name: state.name.copyWith(isEmpty: true));
    }
    if (type == "ktp") {
      state = state.copyWith(ktp: state.ktp.copyWith(isEmpty: true));
    }
    if (type == "phoneNumber") {
      state = state.copyWith(
          phoneNumber: state.phoneNumber.copyWith(isEmpty: true));
    }
    if (type == "birthday") {
      state = state.copyWith(birthday: state.birthday.copyWith(isEmpty: true));
    }
  }

  changeValue({required String type, required String value}) {
    if (type == "name") {
      state = state.copyWith(name: state.name.copyWith(value: value));
    }
    if (type == "ktp") {
      state = state.copyWith(ktp: state.ktp.copyWith(value: value));
    }
    if (type == "phoneNumber") {
      state =
          state.copyWith(phoneNumber: state.phoneNumber.copyWith(value: value));
    }
    if (type == "birthday") {
      state = state.copyWith(birthday: state.birthday.copyWith(value: value));
    }
  }

  Future<void> login() async {
    List<TextFieldModel> textFieldModel = [
      state.name,
      state.ktp,
      state.phoneNumber,
      state.birthday,
    ];
    List<String> typeList = ["name", "ktp", "phoneNumber", "birthday"];
    List<String> errorMsgStringList = [
      "Nama",
      "KTP",
      "Nomor HP",
      "Tanggal Lahir",
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
