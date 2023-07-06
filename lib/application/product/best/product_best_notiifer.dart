import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planet_gadget/application/product/best/product_best_state.dart';

import '../../../domain/repository/product/product_repository.dart';

final productBestDatasProvider =
    FutureProvider.autoDispose((ref) => ref.read(productBestNotifier.notifier));

final productBestNotifier = StateNotifierProvider
    .autoDispose<ProductBestNotifier, ProductBestState>((ref) =>
        ProductBestNotifier(productRepository: ref.watch(_productRepository)));

final _productRepository =
    Provider<IProductRepository>((ref) => ProductRepository());

class ProductBestNotifier extends StateNotifier<ProductBestState> {
  final IProductRepository _iProductRepository;
  ProductBestNotifier({required IProductRepository productRepository})
      : _iProductRepository = productRepository,
        super(const ProductBestState.initial()) {
    getProductBest(mode: "best", page: "1", limit: "10");
  }

  Future<void> getProductBest({
    String mode = "",
    String page = "1",
    String limit = "10",
  }) async {
    state = const ProductBestState.loading();
    try {
      final productBest = await _iProductRepository.getProduct(
          mode: mode, page: page, limit: limit);
      if (productBest != []) {
        state = ProductBestState.data(productBest: productBest);
      } else {
        state = const ProductBestState.error('Gagal : Kosong');
      }
    } catch (e) {
      state = ProductBestState.error(e.toString());
    }
  }
}
