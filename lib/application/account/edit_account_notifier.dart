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
    if (type == "birthdat") {
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

  // Future<void> login() async {
  //   TextFieldModel name = state.name,
  //       ktp = state.ktp,
  //       phoneNumber = state.phoneNumber,
  //       birthday = state.birthday;
  //   List<TextFieldModel> textFieldModel = [
  //     name,
  //     ktp,
  //     phoneNumber,
  //     birthday,
  //   ];
  //   List<Function()> emptyFuncList = [
  //     () => state = state.copyWith(name: name.copyWith(isEmpty: true)),
  //     () => state = state.copyWith(ktp: ktp.copyWith(isEmpty: true)),
  //     () => state =
  //         state.copyWith(phoneNumber: phoneNumber.copyWith(isEmpty: true)),
  //     () => state = state.copyWith(birthday: birthday.copyWith(isEmpty: true)),
  //   ];
  //   List<Function()> errorSetterList = [
  //     () => state =
  //         state.copyWith(name: name.copyWith(errorMessage: name.errorMessage)),
  //     () => state =
  //         state.copyWith(ktp: ktp.copyWith(errorMessage: ktp.errorMessage)),
  //     () => state = state.copyWith(
  //         phoneNumber:
  //             phoneNumber.copyWith(errorMessage: phoneNumber.errorMessage)),
  //     () => state = state.copyWith(
  //         birthday: birthday.copyWith(errorMessage: birthday.errorMessage)),
  //   ];
  //   List<String> errorMsgStringList = [
  //     "Nama",
  //     "KTP",
  //     "Nomor HP",
  //     "Tanggal Lahir"
  //   ];
  //   for (int i = 0; i < textFieldModel.length; i++) {
  //     TextFieldModel item = textFieldModel[i];
  //     checkField(
  //       val: item.value,
  //       fieldEmpty: item.isEmpty,
  //       fieldErrorMsg: item.errorMessage,
  //       errorMsg: "${errorMsgStringList[i]} harus diisi",
  //       onFieldEmpty: emptyFuncList[i],
  //       errorMessageSetter: errorSetterList[i],
  //     );
  //   }
  // }
}
