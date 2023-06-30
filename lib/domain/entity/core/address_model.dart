import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String label,
    required String name,
    required String phoneNumber,
    required String completeAddress,
    @Default(false) bool selected,
  }) = _AddressModel;
}
