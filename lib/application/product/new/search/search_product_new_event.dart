import '../../../../domain/entity/product/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_product_new_event.freezed.dart';

@freezed
class SearchProductNewEvent with _$SearchProductNewEvent {
  const factory SearchProductNewEvent.searchedTextChanged(
      {required String text}) = SearchProductNewedTextChanged;
  const factory SearchProductNewEvent.updateListItems(
      {required List<ProductModel> productModelList}) = UpdateListItems;
}
