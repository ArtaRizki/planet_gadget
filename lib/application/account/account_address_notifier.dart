import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planet_gadget/domain/entity/core/textfield_model.dart';
import '../../library/validator.dart';
import 'account_address_state.dart';

final accountAddressNotifier = StateNotifierProvider.autoDispose<
    AccountAddressNotifier,
    AccountAddressState>((ref) => AccountAddressNotifier());

class AccountAddressNotifier extends StateNotifier<AccountAddressState> {
  AccountAddressNotifier() : super(AccountAddressState.empty());

  init() {
    state = AccountAddressState.empty();
  }

  checkField(
      {String? val,
      required bool fieldEmpty,
      required String fieldErrorMsg,
      required String errorMsg,
      required String type}) {
    changeValue(type: type, value: val ?? "");
    String? msg = checkGeneralField(val: val, errorMsg: errorMsg);
    fieldEmpty = msg != null;
    if (fieldEmpty) {
      changeEmpty(type: type);
    }
    fieldErrorMsg = msg ?? "";
    changeErrorMessage(type: type, fieldErrorMsg: fieldErrorMsg);
  }

  changeValue({required String type, required String value}) {
    if (type == "recipient") {
      state = state.copyWith(recipient: state.recipient.copyWith(value: value));
    }
    if (type == "phoneNumber") {
      state =
          state.copyWith(phoneNumber: state.phoneNumber.copyWith(value: value));
    }
    if (type == "address") {
      state = state.copyWith(address: state.address.copyWith(value: value));
    }
  }

  changeErrorMessage({required String type, required String fieldErrorMsg}) {
    if (type == "recipient") {
      state = state.copyWith(
          recipient: state.recipient.copyWith(errorMessage: fieldErrorMsg));
    }
    if (type == "phoneNumber") {
      state = state.copyWith(
          phoneNumber: state.phoneNumber.copyWith(errorMessage: fieldErrorMsg));
    }
    if (type == "address") {
      state = state.copyWith(
          address: state.address.copyWith(errorMessage: fieldErrorMsg));
    }
  }

  changeEmpty({required String type}) {
    if (type == "recipient") {
      state =
          state.copyWith(recipient: state.recipient.copyWith(isEmpty: true));
    }
    if (type == "phoneNumber") {
      state = state.copyWith(
          phoneNumber: state.phoneNumber.copyWith(isEmpty: true));
    }
    if (type == "address") {
      state = state.copyWith(address: state.address.copyWith(isEmpty: true));
    }
  }

  // Future<void> login() async {
  //   List<TextFieldModel> textFieldModel = [
  //     state.name,
  //     state.ktp,
  //     state.phoneNumber,
  //     state.birthday,
  //   ];
  //   List<String> typeList = ["name", "ktp", "phoneNumber", "birthday"];
  //   List<String> errorMsgStringList = [
  //     "Nama",
  //     "KTP",
  //     "Nomor HP",
  //     "Tanggal Lahir",
  //   ];
  //   for (int i = 0; i < textFieldModel.length; i++) {
  //     TextFieldModel item = textFieldModel[i];
  //     checkField(
  //       val: item.value,
  //       fieldEmpty: item.isEmpty,
  //       fieldErrorMsg: item.errorMessage,
  //       errorMsg: "${errorMsgStringList[i]} harus diisi",
  //       type: typeList[i],
  //     );
  //   }
  // }
}
