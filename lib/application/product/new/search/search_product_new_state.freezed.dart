// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_product_new_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchProductNewState {
  List<ProductModel> get productList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchProductNewStateCopyWith<SearchProductNewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchProductNewStateCopyWith<$Res> {
  factory $SearchProductNewStateCopyWith(SearchProductNewState value,
          $Res Function(SearchProductNewState) then) =
      _$SearchProductNewStateCopyWithImpl<$Res, SearchProductNewState>;
  @useResult
  $Res call({List<ProductModel> productList});
}

/// @nodoc
class _$SearchProductNewStateCopyWithImpl<$Res,
        $Val extends SearchProductNewState>
    implements $SearchProductNewStateCopyWith<$Res> {
  _$SearchProductNewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productList = null,
  }) {
    return _then(_value.copyWith(
      productList: null == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchProductNewStateCopyWith<$Res>
    implements $SearchProductNewStateCopyWith<$Res> {
  factory _$$_SearchProductNewStateCopyWith(_$_SearchProductNewState value,
          $Res Function(_$_SearchProductNewState) then) =
      __$$_SearchProductNewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductModel> productList});
}

/// @nodoc
class __$$_SearchProductNewStateCopyWithImpl<$Res>
    extends _$SearchProductNewStateCopyWithImpl<$Res, _$_SearchProductNewState>
    implements _$$_SearchProductNewStateCopyWith<$Res> {
  __$$_SearchProductNewStateCopyWithImpl(_$_SearchProductNewState _value,
      $Res Function(_$_SearchProductNewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productList = null,
  }) {
    return _then(_$_SearchProductNewState(
      productList: null == productList
          ? _value._productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc

class _$_SearchProductNewState extends _SearchProductNewState {
  _$_SearchProductNewState({required final List<ProductModel> productList})
      : _productList = productList,
        super._();

  final List<ProductModel> _productList;
  @override
  List<ProductModel> get productList {
    if (_productList is EqualUnmodifiableListView) return _productList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productList);
  }

  @override
  String toString() {
    return 'SearchProductNewState(productList: $productList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchProductNewState &&
            const DeepCollectionEquality()
                .equals(other._productList, _productList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchProductNewStateCopyWith<_$_SearchProductNewState> get copyWith =>
      __$$_SearchProductNewStateCopyWithImpl<_$_SearchProductNewState>(
          this, _$identity);
}

abstract class _SearchProductNewState extends SearchProductNewState {
  factory _SearchProductNewState(
          {required final List<ProductModel> productList}) =
      _$_SearchProductNewState;
  _SearchProductNewState._() : super._();

  @override
  List<ProductModel> get productList;
  @override
  @JsonKey(ignore: true)
  _$$_SearchProductNewStateCopyWith<_$_SearchProductNewState> get copyWith =>
      throw _privateConstructorUsedError;
}
