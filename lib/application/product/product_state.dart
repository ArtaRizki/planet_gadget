import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/product/product_model.dart';
part 'product_state.freezed.dart';

extension ProductGetters on ProductState {
  bool get isLoading => this is _ProductStateLoading;
}

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _ProductStateInitial;
  const factory ProductState.loading() = _ProductStateLoading;
  const factory ProductState.data({required List<List<ProductModel>> product}) =
      _ProductStateData;
  const factory ProductState.error([String? error]) = _ProductStateError;
}
