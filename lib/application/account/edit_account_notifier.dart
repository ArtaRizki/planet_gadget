import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planet_gadget/domain/entity/core/textfield_model.dart';
import '../../library/validator.dart';
import 'edit_account_state.dart';

final editAccountNotifier =
    StateNotifierProvider<EditAccountNotifier, EditAccountState>(
        (ref) => EditAccountNotifier());

class EditAccountNotifier extends StateNotifier<EditAccountState> {
  EditAccountNotifier() : super(EditAccountState.empty());

  checkField(
      {String? val,
      required bool fieldEmpty,
      required String fieldErrorMsg,
      required String errorMsg,
      required Function() onFieldEmpty,
      required Function(String) errorMessageSetter}) {
    String? msg = checkGeneralField(val: val, errorMsg: errorMsg);
    fieldEmpty = msg != null;
    if (fieldEmpty) {
      onFieldEmpty();
    }
    fieldErrorMsg = msg ?? "";
    errorMessageSetter(fieldErrorMsg);
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
