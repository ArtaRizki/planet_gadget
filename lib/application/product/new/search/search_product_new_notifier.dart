import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planet_gadget/application/product/new/search/search_product_new_event.dart';
import 'package:planet_gadget/application/product/new/search/search_product_new_state.dart';
import '../product_new_notiifer.dart';

// final searchProvider = StateNotifierProvider.autoDispose<
//     SearchProductNewNotifier, SearchProductNewState>(
//   (ref) {
//     final productModelList =
//         ref.watch(productNewNotifier).whenOrNull(data: (data) => data.first);

//     return SearchProductNewNotifier()
//       ..mapEventsToState(
//           UpdateListItems(productModelList: productModelList ?? []));
//   },
// );

final searchProvider = StateNotifierProvider.autoDispose<
    SearchProductNewNotifier,
    SearchProductNewState>((ref) => SearchProductNewNotifier()
  ..mapEventsToState(UpdateListItems(
      productModelList: (ref
              .watch(productNewNotifier)
              .whenOrNull(data: (productNew) => productNew.first)) ??
          [])));

class SearchProductNewNotifier extends StateNotifier<SearchProductNewState> {
  SearchProductNewNotifier() : super(SearchProductNewState.empty());

  void mapEventsToState(SearchProductNewEvent event) {
    event.map(
      searchedTextChanged: (searchedTextChangedEvent) {
        final productList = [...state.productList];
        final searchedProductList = productList
            .where((productModel) => productModel.name.toLowerCase().contains(
                searchedTextChangedEvent.text.toLowerCase().trimLeft()))
            .toList();

        state = state.copyWith(productList: searchedProductList);
      },
      updateListItems: (updateListItemsEvent) {
        state = state.copyWith(
          productList: updateListItemsEvent.productModelList,
        );
      },
    );
  }
}
