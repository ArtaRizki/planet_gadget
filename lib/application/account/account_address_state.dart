
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/core/textfield_model.dart';
part 'account_address_state.freezed.dart';

@freezed
class AccountAddressState with _$AccountAddressState {
  factory AccountAddressState(
      {required TextFieldModel recipient,
      required TextFieldModel phoneNumber,
      required TextFieldModel address}) = _AccountAddressState;

  factory AccountAddressState.empty() => AccountAddressState(
      recipient: const TextFieldModel(value: ''),
      phoneNumber: const TextFieldModel(value: ''),
      address: const TextFieldModel(value: ''));
}
