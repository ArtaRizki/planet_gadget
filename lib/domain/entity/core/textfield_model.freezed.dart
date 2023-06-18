// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'textfield_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TextFieldModel {
  String get value => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get isEmpty => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextFieldModelCopyWith<TextFieldModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextFieldModelCopyWith<$Res> {
  factory $TextFieldModelCopyWith(
          TextFieldModel value, $Res Function(TextFieldModel) then) =
      _$TextFieldModelCopyWithImpl<$Res, TextFieldModel>;
  @useResult
  $Res call({String value, String errorMessage, bool isEmpty});
}

/// @nodoc
class _$TextFieldModelCopyWithImpl<$Res, $Val extends TextFieldModel>
    implements $TextFieldModelCopyWith<$Res> {
  _$TextFieldModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? errorMessage = null,
    Object? isEmpty = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isEmpty: null == isEmpty
          ? _value.isEmpty
          : isEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TextFieldModelCopyWith<$Res>
    implements $TextFieldModelCopyWith<$Res> {
  factory _$$_TextFieldModelCopyWith(
          _$_TextFieldModel value, $Res Function(_$_TextFieldModel) then) =
      __$$_TextFieldModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String errorMessage, bool isEmpty});
}

/// @nodoc
class __$$_TextFieldModelCopyWithImpl<$Res>
    extends _$TextFieldModelCopyWithImpl<$Res, _$_TextFieldModel>
    implements _$$_TextFieldModelCopyWith<$Res> {
  __$$_TextFieldModelCopyWithImpl(
      _$_TextFieldModel _value, $Res Function(_$_TextFieldModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? errorMessage = null,
    Object? isEmpty = null,
  }) {
    return _then(_$_TextFieldModel(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isEmpty: null == isEmpty
          ? _value.isEmpty
          : isEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TextFieldModel implements _TextFieldModel {
  const _$_TextFieldModel(
      {required this.value, this.errorMessage = '', this.isEmpty = false});

  @override
  final String value;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final bool isEmpty;

  @override
  String toString() {
    return 'TextFieldModel(value: $value, errorMessage: $errorMessage, isEmpty: $isEmpty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextFieldModel &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isEmpty, isEmpty) || other.isEmpty == isEmpty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, errorMessage, isEmpty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TextFieldModelCopyWith<_$_TextFieldModel> get copyWith =>
      __$$_TextFieldModelCopyWithImpl<_$_TextFieldModel>(this, _$identity);
}

abstract class _TextFieldModel implements TextFieldModel {
  const factory _TextFieldModel(
      {required final String value,
      final String errorMessage,
      final bool isEmpty}) = _$_TextFieldModel;

  @override
  String get value;
  @override
  String get errorMessage;
  @override
  bool get isEmpty;
  @override
  @JsonKey(ignore: true)
  _$$_TextFieldModelCopyWith<_$_TextFieldModel> get copyWith =>
      throw _privateConstructorUsedError;
}
