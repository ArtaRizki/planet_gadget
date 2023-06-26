// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditAccountState {
  TextFieldModel get name => throw _privateConstructorUsedError;
  TextFieldModel get ktp => throw _privateConstructorUsedError;
  TextFieldModel get phoneNumber => throw _privateConstructorUsedError;
  TextFieldModel get birthday => throw _privateConstructorUsedError;
  String get genre => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditAccountStateCopyWith<EditAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditAccountStateCopyWith<$Res> {
  factory $EditAccountStateCopyWith(
          EditAccountState value, $Res Function(EditAccountState) then) =
      _$EditAccountStateCopyWithImpl<$Res, EditAccountState>;
  @useResult
  $Res call(
      {TextFieldModel name,
      TextFieldModel ktp,
      TextFieldModel phoneNumber,
      TextFieldModel birthday,
      String genre});

  $TextFieldModelCopyWith<$Res> get name;
  $TextFieldModelCopyWith<$Res> get ktp;
  $TextFieldModelCopyWith<$Res> get phoneNumber;
  $TextFieldModelCopyWith<$Res> get birthday;
}

/// @nodoc
class _$EditAccountStateCopyWithImpl<$Res, $Val extends EditAccountState>
    implements $EditAccountStateCopyWith<$Res> {
  _$EditAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ktp = null,
    Object? phoneNumber = null,
    Object? birthday = null,
    Object? genre = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      ktp: null == ktp
          ? _value.ktp
          : ktp // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TextFieldModelCopyWith<$Res> get name {
    return $TextFieldModelCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TextFieldModelCopyWith<$Res> get ktp {
    return $TextFieldModelCopyWith<$Res>(_value.ktp, (value) {
      return _then(_value.copyWith(ktp: value) as $Val);
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
  $TextFieldModelCopyWith<$Res> get birthday {
    return $TextFieldModelCopyWith<$Res>(_value.birthday, (value) {
      return _then(_value.copyWith(birthday: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EditAccountStateCopyWith<$Res>
    implements $EditAccountStateCopyWith<$Res> {
  factory _$$_EditAccountStateCopyWith(
          _$_EditAccountState value, $Res Function(_$_EditAccountState) then) =
      __$$_EditAccountStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextFieldModel name,
      TextFieldModel ktp,
      TextFieldModel phoneNumber,
      TextFieldModel birthday,
      String genre});

  @override
  $TextFieldModelCopyWith<$Res> get name;
  @override
  $TextFieldModelCopyWith<$Res> get ktp;
  @override
  $TextFieldModelCopyWith<$Res> get phoneNumber;
  @override
  $TextFieldModelCopyWith<$Res> get birthday;
}

/// @nodoc
class __$$_EditAccountStateCopyWithImpl<$Res>
    extends _$EditAccountStateCopyWithImpl<$Res, _$_EditAccountState>
    implements _$$_EditAccountStateCopyWith<$Res> {
  __$$_EditAccountStateCopyWithImpl(
      _$_EditAccountState _value, $Res Function(_$_EditAccountState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ktp = null,
    Object? phoneNumber = null,
    Object? birthday = null,
    Object? genre = null,
  }) {
    return _then(_$_EditAccountState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      ktp: null == ktp
          ? _value.ktp
          : ktp // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EditAccountState implements _EditAccountState {
  _$_EditAccountState(
      {required this.name,
      required this.ktp,
      required this.phoneNumber,
      required this.birthday,
      this.genre = "Male"});

  @override
  final TextFieldModel name;
  @override
  final TextFieldModel ktp;
  @override
  final TextFieldModel phoneNumber;
  @override
  final TextFieldModel birthday;
  @override
  @JsonKey()
  final String genre;

  @override
  String toString() {
    return 'EditAccountState(name: $name, ktp: $ktp, phoneNumber: $phoneNumber, birthday: $birthday, genre: $genre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditAccountState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ktp, ktp) || other.ktp == ktp) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.genre, genre) || other.genre == genre));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, ktp, phoneNumber, birthday, genre);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditAccountStateCopyWith<_$_EditAccountState> get copyWith =>
      __$$_EditAccountStateCopyWithImpl<_$_EditAccountState>(this, _$identity);
}

abstract class _EditAccountState implements EditAccountState {
  factory _EditAccountState(
      {required final TextFieldModel name,
      required final TextFieldModel ktp,
      required final TextFieldModel phoneNumber,
      required final TextFieldModel birthday,
      final String genre}) = _$_EditAccountState;

  @override
  TextFieldModel get name;
  @override
  TextFieldModel get ktp;
  @override
  TextFieldModel get phoneNumber;
  @override
  TextFieldModel get birthday;
  @override
  String get genre;
  @override
  @JsonKey(ignore: true)
  _$$_EditAccountStateCopyWith<_$_EditAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}
