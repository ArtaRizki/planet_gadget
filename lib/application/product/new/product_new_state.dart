import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/product/product_model.dart';
part 'product_new_state.freezed.dart';

extension ProductNewGetters on ProductNewState {
  bool get isLoading => this is _ProductNewStateLoading;
}

@freezed
class ProductNewState with _$ProductNewState {
  const factory ProductNewState.initial() = _ProductNewStateInitial;
  const factory ProductNewState.loading() = _ProductNewStateLoading;
  const factory ProductNewState.data(
      {required List<List<ProductModel>> productNew}) = _ProductNewStateData;
  // const factory ProductNewState.dataCompleted(
  //         {required List<List<ProductModel>> productNew}) =
  //     _ProductNewStateDataCompleted;
  const factory ProductNewState.error([String? error]) = _ProductNewStateError;
}
