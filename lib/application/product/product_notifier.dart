import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repository/product/product_repository.dart';
import 'product_state.dart';

final productDatasProvider =
    FutureProvider.autoDispose((ref) => ref.read(productNotifier.notifier));

final productNotifier =
    StateNotifierProvider.autoDispose<ProductNotifier, ProductState>((ref) =>
        ProductNotifier(productRepository: ref.watch(_productRepository)));

final _productRepository =
    Provider<IProductRepository>((ref) => ProductRepository());

class ProductNotifier extends StateNotifier<ProductState> {
  final IProductRepository _iProductRepository;
  ProductNotifier({required IProductRepository productRepository})
      : _iProductRepository = productRepository,
        super(const ProductState.initial()) {
    getProduct();
  }

  Future<void> getProduct() async {
    // _productFieldState = _productFieldState.copyWith();
    state = const ProductState.loading();
    // try {
    final product = await _iProductRepository.getProduct();
    if (product != []) {
      state = ProductState.data(product: product);
    } else {
      state = const ProductState.error('Gagal');
    }
    // } catch (e) {
    // }
    // state = const ProductState.initial();
  }
}
