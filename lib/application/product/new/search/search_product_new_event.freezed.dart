// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_product_new_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchProductNewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) searchedTextChanged,
    required TResult Function(List<ProductModel> productModelList)
        updateListItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? searchedTextChanged,
    TResult? Function(List<ProductModel> productModelList)? updateListItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? searchedTextChanged,
    TResult Function(List<ProductModel> productModelList)? updateListItems,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchProductNewedTextChanged value)
        searchedTextChanged,
    required TResult Function(UpdateListItems value) updateListItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchProductNewedTextChanged value)? searchedTextChanged,
    TResult? Function(UpdateListItems value)? updateListItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchProductNewedTextChanged value)? searchedTextChanged,
    TResult Function(UpdateListItems value)? updateListItems,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchProductNewEventCopyWith<$Res> {
  factory $SearchProductNewEventCopyWith(SearchProductNewEvent value,
          $Res Function(SearchProductNewEvent) then) =
      _$SearchProductNewEventCopyWithImpl<$Res, SearchProductNewEvent>;
}

/// @nodoc
class _$SearchProductNewEventCopyWithImpl<$Res,
        $Val extends SearchProductNewEvent>
    implements $SearchProductNewEventCopyWith<$Res> {
  _$SearchProductNewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchProductNewedTextChangedCopyWith<$Res> {
  factory _$$SearchProductNewedTextChangedCopyWith(
          _$SearchProductNewedTextChanged value,
          $Res Function(_$SearchProductNewedTextChanged) then) =
      __$$SearchProductNewedTextChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$SearchProductNewedTextChangedCopyWithImpl<$Res>
    extends _$SearchProductNewEventCopyWithImpl<$Res,
        _$SearchProductNewedTextChanged>
    implements _$$SearchProductNewedTextChangedCopyWith<$Res> {
  __$$SearchProductNewedTextChangedCopyWithImpl(
      _$SearchProductNewedTextChanged _value,
      $Res Function(_$SearchProductNewedTextChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$SearchProductNewedTextChanged(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchProductNewedTextChanged implements SearchProductNewedTextChanged {
  const _$SearchProductNewedTextChanged({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'SearchProductNewEvent.searchedTextChanged(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchProductNewedTextChanged &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchProductNewedTextChangedCopyWith<_$SearchProductNewedTextChanged>
      get copyWith => __$$SearchProductNewedTextChangedCopyWithImpl<
          _$SearchProductNewedTextChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) searchedTextChanged,
    required TResult Function(List<ProductModel> productModelList)
        updateListItems,
  }) {
    return searchedTextChanged(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? searchedTextChanged,
    TResult? Function(List<ProductModel> productModelList)? updateListItems,
  }) {
    return searchedTextChanged?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? searchedTextChanged,
    TResult Function(List<ProductModel> productModelList)? updateListItems,
    required TResult orElse(),
  }) {
    if (searchedTextChanged != null) {
      return searchedTextChanged(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchProductNewedTextChanged value)
        searchedTextChanged,
    required TResult Function(UpdateListItems value) updateListItems,
  }) {
    return searchedTextChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchProductNewedTextChanged value)? searchedTextChanged,
    TResult? Function(UpdateListItems value)? updateListItems,
  }) {
    return searchedTextChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchProductNewedTextChanged value)? searchedTextChanged,
    TResult Function(UpdateListItems value)? updateListItems,
    required TResult orElse(),
  }) {
    if (searchedTextChanged != null) {
      return searchedTextChanged(this);
    }
    return orElse();
  }
}

abstract class SearchProductNewedTextChanged implements SearchProductNewEvent {
  const factory SearchProductNewedTextChanged({required final String text}) =
      _$SearchProductNewedTextChanged;

  String get text;
  @JsonKey(ignore: true)
  _$$SearchProductNewedTextChangedCopyWith<_$SearchProductNewedTextChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateListItemsCopyWith<$Res> {
  factory _$$UpdateListItemsCopyWith(
          _$UpdateListItems value, $Res Function(_$UpdateListItems) then) =
      __$$UpdateListItemsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductModel> productModelList});
}

/// @nodoc
class __$$UpdateListItemsCopyWithImpl<$Res>
    extends _$SearchProductNewEventCopyWithImpl<$Res, _$UpdateListItems>
    implements _$$UpdateListItemsCopyWith<$Res> {
  __$$UpdateListItemsCopyWithImpl(
      _$UpdateListItems _value, $Res Function(_$UpdateListItems) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productModelList = null,
  }) {
    return _then(_$UpdateListItems(
      productModelList: null == productModelList
          ? _value._productModelList
          : productModelList // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc

class _$UpdateListItems implements UpdateListItems {
  const _$UpdateListItems({required final List<ProductModel> productModelList})
      : _productModelList = productModelList;

  final List<ProductModel> _productModelList;
  @override
  List<ProductModel> get productModelList {
    if (_productModelList is EqualUnmodifiableListView)
      return _productModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productModelList);
  }

  @override
  String toString() {
    return 'SearchProductNewEvent.updateListItems(productModelList: $productModelList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateListItems &&
            const DeepCollectionEquality()
                .equals(other._productModelList, _productModelList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productModelList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateListItemsCopyWith<_$UpdateListItems> get copyWith =>
      __$$UpdateListItemsCopyWithImpl<_$UpdateListItems>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) searchedTextChanged,
    required TResult Function(List<ProductModel> productModelList)
        updateListItems,
  }) {
    return updateListItems(productModelList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? searchedTextChanged,
    TResult? Function(List<ProductModel> productModelList)? updateListItems,
  }) {
    return updateListItems?.call(productModelList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? searchedTextChanged,
    TResult Function(List<ProductModel> productModelList)? updateListItems,
    required TResult orElse(),
  }) {
    if (updateListItems != null) {
      return updateListItems(productModelList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchProductNewedTextChanged value)
        searchedTextChanged,
    required TResult Function(UpdateListItems value) updateListItems,
  }) {
    return updateListItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchProductNewedTextChanged value)? searchedTextChanged,
    TResult? Function(UpdateListItems value)? updateListItems,
  }) {
    return updateListItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchProductNewedTextChanged value)? searchedTextChanged,
    TResult Function(UpdateListItems value)? updateListItems,
    required TResult orElse(),
  }) {
    if (updateListItems != null) {
      return updateListItems(this);
    }
    return orElse();
  }
}

abstract class UpdateListItems implements SearchProductNewEvent {
  const factory UpdateListItems(
      {required final List<ProductModel> productModelList}) = _$UpdateListItems;

  List<ProductModel> get productModelList;
  @JsonKey(ignore: true)
  _$$UpdateListItemsCopyWith<_$UpdateListItems> get copyWith =>
      throw _privateConstructorUsedError;
}
