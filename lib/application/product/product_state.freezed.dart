// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<List<ProductModel>> product) data,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<List<ProductModel>> product)? data,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<List<ProductModel>> product)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductStateInitial value) initial,
    required TResult Function(_ProductStateLoading value) loading,
    required TResult Function(_ProductStateData value) data,
    required TResult Function(_ProductStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductStateInitial value)? initial,
    TResult? Function(_ProductStateLoading value)? loading,
    TResult? Function(_ProductStateData value)? data,
    TResult? Function(_ProductStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductStateInitial value)? initial,
    TResult Function(_ProductStateLoading value)? loading,
    TResult Function(_ProductStateData value)? data,
    TResult Function(_ProductStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ProductStateInitialCopyWith<$Res> {
  factory _$$_ProductStateInitialCopyWith(_$_ProductStateInitial value,
          $Res Function(_$_ProductStateInitial) then) =
      __$$_ProductStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ProductStateInitialCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_ProductStateInitial>
    implements _$$_ProductStateInitialCopyWith<$Res> {
  __$$_ProductStateInitialCopyWithImpl(_$_ProductStateInitial _value,
      $Res Function(_$_ProductStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ProductStateInitial implements _ProductStateInitial {
  const _$_ProductStateInitial();

  @override
  String toString() {
    return 'ProductState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ProductStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<List<ProductModel>> product) data,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<List<ProductModel>> product)? data,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<List<ProductModel>> product)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductStateInitial value) initial,
    required TResult Function(_ProductStateLoading value) loading,
    required TResult Function(_ProductStateData value) data,
    required TResult Function(_ProductStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductStateInitial value)? initial,
    TResult? Function(_ProductStateLoading value)? loading,
    TResult? Function(_ProductStateData value)? data,
    TResult? Function(_ProductStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductStateInitial value)? initial,
    TResult Function(_ProductStateLoading value)? loading,
    TResult Function(_ProductStateData value)? data,
    TResult Function(_ProductStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ProductStateInitial implements ProductState {
  const factory _ProductStateInitial() = _$_ProductStateInitial;
}

/// @nodoc
abstract class _$$_ProductStateLoadingCopyWith<$Res> {
  factory _$$_ProductStateLoadingCopyWith(_$_ProductStateLoading value,
          $Res Function(_$_ProductStateLoading) then) =
      __$$_ProductStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ProductStateLoadingCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_ProductStateLoading>
    implements _$$_ProductStateLoadingCopyWith<$Res> {
  __$$_ProductStateLoadingCopyWithImpl(_$_ProductStateLoading _value,
      $Res Function(_$_ProductStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ProductStateLoading implements _ProductStateLoading {
  const _$_ProductStateLoading();

  @override
  String toString() {
    return 'ProductState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ProductStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<List<ProductModel>> product) data,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<List<ProductModel>> product)? data,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<List<ProductModel>> product)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductStateInitial value) initial,
    required TResult Function(_ProductStateLoading value) loading,
    required TResult Function(_ProductStateData value) data,
    required TResult Function(_ProductStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductStateInitial value)? initial,
    TResult? Function(_ProductStateLoading value)? loading,
    TResult? Function(_ProductStateData value)? data,
    TResult? Function(_ProductStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductStateInitial value)? initial,
    TResult Function(_ProductStateLoading value)? loading,
    TResult Function(_ProductStateData value)? data,
    TResult Function(_ProductStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ProductStateLoading implements ProductState {
  const factory _ProductStateLoading() = _$_ProductStateLoading;
}

/// @nodoc
abstract class _$$_ProductStateDataCopyWith<$Res> {
  factory _$$_ProductStateDataCopyWith(
          _$_ProductStateData value, $Res Function(_$_ProductStateData) then) =
      __$$_ProductStateDataCopyWithImpl<$Res>;
  @useResult
  $Res call({List<List<ProductModel>> product});
}

/// @nodoc
class __$$_ProductStateDataCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_ProductStateData>
    implements _$$_ProductStateDataCopyWith<$Res> {
  __$$_ProductStateDataCopyWithImpl(
      _$_ProductStateData _value, $Res Function(_$_ProductStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$_ProductStateData(
      product: null == product
          ? _value._product
          : product // ignore: cast_nullable_to_non_nullable
              as List<List<ProductModel>>,
    ));
  }
}

/// @nodoc

class _$_ProductStateData implements _ProductStateData {
  const _$_ProductStateData({required final List<List<ProductModel>> product})
      : _product = product;

  final List<List<ProductModel>> _product;
  @override
  List<List<ProductModel>> get product {
    if (_product is EqualUnmodifiableListView) return _product;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_product);
  }

  @override
  String toString() {
    return 'ProductState.data(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductStateData &&
            const DeepCollectionEquality().equals(other._product, _product));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_product));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductStateDataCopyWith<_$_ProductStateData> get copyWith =>
      __$$_ProductStateDataCopyWithImpl<_$_ProductStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<List<ProductModel>> product) data,
    required TResult Function(String? error) error,
  }) {
    return data(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<List<ProductModel>> product)? data,
    TResult? Function(String? error)? error,
  }) {
    return data?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<List<ProductModel>> product)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductStateInitial value) initial,
    required TResult Function(_ProductStateLoading value) loading,
    required TResult Function(_ProductStateData value) data,
    required TResult Function(_ProductStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductStateInitial value)? initial,
    TResult? Function(_ProductStateLoading value)? loading,
    TResult? Function(_ProductStateData value)? data,
    TResult? Function(_ProductStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductStateInitial value)? initial,
    TResult Function(_ProductStateLoading value)? loading,
    TResult Function(_ProductStateData value)? data,
    TResult Function(_ProductStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _ProductStateData implements ProductState {
  const factory _ProductStateData(
      {required final List<List<ProductModel>> product}) = _$_ProductStateData;

  List<List<ProductModel>> get product;
  @JsonKey(ignore: true)
  _$$_ProductStateDataCopyWith<_$_ProductStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ProductStateErrorCopyWith<$Res> {
  factory _$$_ProductStateErrorCopyWith(_$_ProductStateError value,
          $Res Function(_$_ProductStateError) then) =
      __$$_ProductStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$_ProductStateErrorCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_ProductStateError>
    implements _$$_ProductStateErrorCopyWith<$Res> {
  __$$_ProductStateErrorCopyWithImpl(
      _$_ProductStateError _value, $Res Function(_$_ProductStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_ProductStateError(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ProductStateError implements _ProductStateError {
  const _$_ProductStateError([this.error]);

  @override
  final String? error;

  @override
  String toString() {
    return 'ProductState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductStateErrorCopyWith<_$_ProductStateError> get copyWith =>
      __$$_ProductStateErrorCopyWithImpl<_$_ProductStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<List<ProductModel>> product) data,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<List<ProductModel>> product)? data,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<List<ProductModel>> product)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductStateInitial value) initial,
    required TResult Function(_ProductStateLoading value) loading,
    required TResult Function(_ProductStateData value) data,
    required TResult Function(_ProductStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductStateInitial value)? initial,
    TResult? Function(_ProductStateLoading value)? loading,
    TResult? Function(_ProductStateData value)? data,
    TResult? Function(_ProductStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductStateInitial value)? initial,
    TResult Function(_ProductStateLoading value)? loading,
    TResult Function(_ProductStateData value)? data,
    TResult Function(_ProductStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ProductStateError implements ProductState {
  const factory _ProductStateError([final String? error]) =
      _$_ProductStateError;

  String? get error;
  @JsonKey(ignore: true)
  _$$_ProductStateErrorCopyWith<_$_ProductStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
