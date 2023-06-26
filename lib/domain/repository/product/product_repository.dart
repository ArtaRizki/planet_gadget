import 'dart:convert';
import 'dart:developer';

import 'package:planet_gadget/main.dart';

import '../../entity/product/product_model.dart';

abstract class IProductRepository {
  Future<List<List<ProductModel>>> getProduct();
}

class ProductRepository implements IProductRepository {
  @override
  Future<List<List<ProductModel>>> getProduct() async {
    // try {
    final response = await dio.requestGet(url: '/getproduct', param: {});
    if (response!.statusCode == 200) {
      // log("RESPONSE : ${response!.data}");
      return productModelFromJson(jsonEncode(response.data));
    } else {
      throw Exception("Gagal");
    }
    // } catch (e) {
    //   throw Exception("Gagal");
    // }
  }
}
