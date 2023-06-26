// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_field_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginFieldState {
  TextFieldModel get email => throw _privateConstructorUsedError;
  TextFieldModel get password => throw _privateConstructorUsedError;
  bool get visiblePassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFieldStateCopyWith<LoginFieldState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFieldStateCopyWith<$Res> {
  factory $LoginFieldStateCopyWith(
          LoginFieldState value, $Res Function(LoginFieldState) then) =
      _$LoginFieldStateCopyWithImpl<$Res, LoginFieldState>;
  @useResult
  $Res call(
      {TextFieldModel email, TextFieldModel password, bool visiblePassword});

  $TextFieldModelCopyWith<$Res> get email;
  $TextFieldModelCopyWith<$Res> get password;
}

/// @nodoc
class _$LoginFieldStateCopyWithImpl<$Res, $Val extends LoginFieldState>
    implements $LoginFieldStateCopyWith<$Res> {
  _$LoginFieldStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? visiblePassword = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      visiblePassword: null == visiblePassword
          ? _value.visiblePassword
          : visiblePassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TextFieldModelCopyWith<$Res> get email {
    return $TextFieldModelCopyWith<$Res>(_value.email, (value) {
      return _then(_value.copyWith(email: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TextFieldModelCopyWith<$Res> get password {
    return $TextFieldModelCopyWith<$Res>(_value.password, (value) {
      return _then(_value.copyWith(password: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoginFieldStateCopyWith<$Res>
    implements $LoginFieldStateCopyWith<$Res> {
  factory _$$_LoginFieldStateCopyWith(
          _$_LoginFieldState value, $Res Function(_$_LoginFieldState) then) =
      __$$_LoginFieldStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextFieldModel email, TextFieldModel password, bool visiblePassword});

  @override
  $TextFieldModelCopyWith<$Res> get email;
  @override
  $TextFieldModelCopyWith<$Res> get password;
}

/// @nodoc
class __$$_LoginFieldStateCopyWithImpl<$Res>
    extends _$LoginFieldStateCopyWithImpl<$Res, _$_LoginFieldState>
    implements _$$_LoginFieldStateCopyWith<$Res> {
  __$$_LoginFieldStateCopyWithImpl(
      _$_LoginFieldState _value, $Res Function(_$_LoginFieldState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? visiblePassword = null,
  }) {
    return _then(_$_LoginFieldState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as TextFieldModel,
      visiblePassword: null == visiblePassword
          ? _value.visiblePassword
          : visiblePassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginFieldState implements _LoginFieldState {
  _$_LoginFieldState(
      {required this.email,
      required this.password,
      this.visiblePassword = false});

  @override
  final TextFieldModel email;
  @override
  final TextFieldModel password;
  @override
  @JsonKey()
  final bool visiblePassword;

  @override
  String toString() {
    return 'LoginFieldState(email: $email, password: $password, visiblePassword: $visiblePassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginFieldState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.visiblePassword, visiblePassword) ||
                other.visiblePassword == visiblePassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, visiblePassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginFieldStateCopyWith<_$_LoginFieldState> get copyWith =>
      __$$_LoginFieldStateCopyWithImpl<_$_LoginFieldState>(this, _$identity);
}

abstract class _LoginFieldState implements LoginFieldState {
  factory _LoginFieldState(
      {required final TextFieldModel email,
      required final TextFieldModel password,
      final bool visiblePassword}) = _$_LoginFieldState;

  @override
  TextFieldModel get email;
  @override
  TextFieldModel get password;
  @override
  bool get visiblePassword;
  @override
  @JsonKey(ignore: true)
  _$$_LoginFieldStateCopyWith<_$_LoginFieldState> get copyWith =>
      throw _privateConstructorUsedError;
}
