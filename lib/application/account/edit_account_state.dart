import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/core/textfield_model.dart';
part 'edit_account_state.freezed.dart';

@freezed
class EditAccountState with _$EditAccountState {
  factory EditAccountState({
    required TextFieldModel name,
    required TextFieldModel ktp,
    required TextFieldModel phoneNumber,
    required TextFieldModel birthday,
    @Default("Male") String genre,
  }) = _EditAccountState;

  factory EditAccountState.empty() => EditAccountState(
        name: const TextFieldModel(value: ""),
        ktp: const TextFieldModel(value: ""),
        phoneNumber: const TextFieldModel(value: ""),
        birthday: const TextFieldModel(value: ""),
        genre: "",
      );
}
