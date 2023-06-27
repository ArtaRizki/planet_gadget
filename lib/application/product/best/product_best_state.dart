import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/product/product_model.dart';
part 'product_best_state.freezed.dart';

extension ProductBestGetters on ProductBestState {
  bool get isLoading => this is _ProductBestStateLoading;
}

@freezed
class ProductBestState with _$ProductBestState {
  const factory ProductBestState.initial() = _ProductBestStateInitial;
  const factory ProductBestState.loading() = _ProductBestStateLoading;
  const factory ProductBestState.data(
      {required List<List<ProductModel>> productBest}) = _ProductBestStateData;
  const factory ProductBestState.error([String? error]) =
      _ProductBestStateError;
}
