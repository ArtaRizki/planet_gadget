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
      required String errorMsg}) {
    String? msg = checkGeneralField(val: val, errorMsg: errorMsg);
    fieldEmpty = msg != null;
    if (fieldEmpty) {
      state = state.copyWith(name: state.name.copyWith(isEmpty: true));
    }
    fieldErrorMsg = msg ?? "";
    state =
        state.copyWith(name: state.name.copyWith(errorMessage: fieldErrorMsg));
  }

  Future<void> login() async {
    List<TextFieldModel> textFieldModel = [
      state.name,
      state.ktp,
      state.phoneNumber,
      state.birthday,
    ];
    List<String> name = ["Nama", "KTP", "Nomor HP", "Tanggal Lahir"];
    for (int i = 0; i < textFieldModel.length; i++) {
      TextFieldModel item = textFieldModel[i];
      checkField(
          val: item.value,
          fieldEmpty: item.isEmpty,
          fieldErrorMsg: item.errorMessage,
          errorMsg: "${name[i]} harus diisi");
    }
  }
}
