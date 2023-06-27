import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planet_gadget/application/product/new/product_new_state.dart';

import '../../../domain/repository/product/product_repository.dart';

final productNewDatasProvider =
    FutureProvider.autoDispose((ref) => ref.read(productNewNotifier.notifier));

final productNewNotifier = StateNotifierProvider
    .autoDispose<ProductNewNotifier, ProductNewState>((ref) =>
        ProductNewNotifier(productRepository: ref.watch(_productRepository)));

final _productRepository =
    Provider<IProductRepository>((ref) => ProductRepository());

class ProductNewNotifier extends StateNotifier<ProductNewState> {
  final IProductRepository _iProductRepository;
  ProductNewNotifier({required IProductRepository productRepository})
      : _iProductRepository = productRepository,
        super(const ProductNewState.initial()) {
    getProductNew(mode: "new", page: "1", limit: "10");
  }

  Future<void> getProductNew({
    String mode = "",
    String page = "1",
    String limit = "10",
  }) async {
    state = const ProductNewState.loading();
    // try {
    final productNew = await _iProductRepository.getProduct(
        mode: mode, page: page, limit: limit);
    if (productNew != []) {
      state = ProductNewState.data(productNew: productNew);
    } else {
      state = const ProductNewState.error('Gagal');
    }
    // } catch (e) {
    // }
    // state = const ProductNewState.initial();
  }
}
