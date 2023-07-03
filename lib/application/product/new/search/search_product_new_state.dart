import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entity/product/product_model.dart';
part 'search_product_new_state.freezed.dart';

@freezed
class SearchProductNewState with _$SearchProductNewState {
  factory SearchProductNewState({
    required List<ProductModel> productList,
  }) = _SearchProductNewState;
  const SearchProductNewState._();

  factory SearchProductNewState.empty() =>
      SearchProductNewState(productList: []);
}
