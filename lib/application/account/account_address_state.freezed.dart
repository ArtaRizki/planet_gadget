// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountAddressState {
  TextFieldModel get recipient => throw _privateConstructorUsedError;
  TextFieldModel get phoneNumber => throw _privateConstructorUsedError;
  TextFieldModel get address => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountAddressStateCopyWith<AccountAddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountAddressStateCopyWith<$Res> {
  factory $AccountAddressStateCopyWith(
          AccountAddressState value, $Res Function(AccountAddressState) then) =
      _$AccountAddressStateCopyWithImpl<$Res, AccountAddressState>;
  @useResult
  $Res call(
      {TextFieldModel recipient,
      TextFieldModel phoneNumber,
      TextFieldModel address});

  $TextFieldModelCopyWith<$Res> get recipient;
  $TextFieldModelCopyWith<$Res> get phoneNumber;
  $TextFieldModelCopyWith<$Res> get address;
}

/// @nodoc
class _$AccountAddressStateCopyWithImpl<$Res, $Val extends AccountAddressState>
    implements $AccountAddressStateCopyWith<$Res> {
  _$AccountAddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipient = null,
    Object? phoneNumber = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TextFieldModelCopyWith<$Res> get recipient {
    return $TextFieldModelCopyWith<$Res>(_value.recipient, (value) {
      return _then(_value.copyWith(recipient: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TextFieldModelCopyWith<$Res> get phoneNumber {
    return $TextFieldModelCopyWith<$Res>(_value.phoneNumber, (value) {
      return _then(_value.copyWith(phoneNumber: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TextFieldModelCopyWith<$Res> get address {
    return $TextFieldModelCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AccountAddressStateCopyWith<$Res>
    implements $AccountAddressStateCopyWith<$Res> {
  factory _$$_AccountAddressStateCopyWith(_$_AccountAddressState value,
          $Res Function(_$_AccountAddressState) then) =
      __$$_AccountAddressStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextFieldModel recipient,
      TextFieldModel phoneNumber,
      TextFieldModel address});

  @override
  $TextFieldModelCopyWith<$Res> get recipient;
  @override
  $TextFieldModelCopyWith<$Res> get phoneNumber;
  @override
  $TextFieldModelCopyWith<$Res> get address;
}

/// @nodoc
class __$$_AccountAddressStateCopyWithImpl<$Res>
    extends _$AccountAddressStateCopyWithImpl<$Res, _$_AccountAddressState>
    implements _$$_AccountAddressStateCopyWith<$Res> {
  __$$_AccountAddressStateCopyWithImpl(_$_AccountAddressState _value,
      $Res Function(_$_AccountAddressState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipient = null,
    Object? phoneNumber = null,
    Object? address = null,
  }) {
    return _then(_$_AccountAddressState(
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
    ));
  }
}

/// @nodoc

class _$_AccountAddressState implements _AccountAddressState {
  _$_AccountAddressState(
      {required this.recipient,
      required this.phoneNumber,
      required this.address});

  @override
  final TextFieldModel recipient;
  @override
  final TextFieldModel phoneNumber;
  @override
  final TextFieldModel address;

  @override
  String toString() {
    return 'AccountAddressState(recipient: $recipient, phoneNumber: $phoneNumber, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountAddressState &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recipient, phoneNumber, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountAddressStateCopyWith<_$_AccountAddressState> get copyWith =>
      __$$_AccountAddressStateCopyWithImpl<_$_AccountAddressState>(
          this, _$identity);
}

abstract class _AccountAddressState implements AccountAddressState {
  factory _AccountAddressState(
      {required final TextFieldModel recipient,
      required final TextFieldModel phoneNumber,
      required final TextFieldModel address}) = _$_AccountAddressState;

  @override
  TextFieldModel get recipient;
  @override
  TextFieldModel get phoneNumber;
  @override
  TextFieldModel get address;
  @override
  @JsonKey(ignore: true)
  _$$_AccountAddressStateCopyWith<_$_AccountAddressState> get copyWith =>
      throw _privateConstructorUsedError;
}
