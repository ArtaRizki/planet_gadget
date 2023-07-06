import 'dart:convert';
import 'dart:developer';

import 'package:planet_gadget/main.dart';

import '../../entity/product/product_model.dart';

abstract class IProductRepository {
  Future<List<List<ProductModel>>> getProduct({
    required String mode,
    required String page,
    required String limit,
  });
}

class ProductRepository implements IProductRepository {
  @override
  Future<List<List<ProductModel>>> getProduct({
    required String mode,
    required String page,
    required String limit,
  }) async {
    String url = "/getproduct";
    url = changeUrl(url, mode, page, limit);
    try {
      final response = await dio.requestGet(url: url, param: {});
      if (response!.statusCode == 200) {
        // log("RESPONSE : ${response!.data}");
        return productModelFromJson(jsonEncode(response.data));
      } else {
        throw Exception("Gagal : ${response.statusMessage}");
      }
    } catch (e) {
      throw Exception("Gagal : $e");
    }
  }

  changeUrl(String url, String mode, String page, String limit) {
    if (mode != "") {
      url += "?mode=$mode";
      if (page != "") {
        url += "&page=$page";
      }
      if (limit != "") {
        url += "&limit=$limit";
      }
      return url;
    }
    if (page != "") {
      url += "?page=$page";
    }
    if (limit != "") {
      url += "&limit=$limit";
    }
    return url;
  }
}
