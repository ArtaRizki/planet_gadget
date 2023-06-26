// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

List<List<ProductModel>> productModelFromJson(String str) =>
    List<List<ProductModel>>.from(json.decode(str).map((x) =>
        List<ProductModel>.from(x.map((x) => ProductModel.fromJson(x)))));

String productModelToJson(List<List<ProductModel>> data) =>
    json.encode(List<dynamic>.from(
        data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

@freezed
class ProductModel with _$ProductModel {
  @JsonSerializable(explicitToJson: true)
  const factory ProductModel({
    required String id,
    required String name,
    required String url,
    // required List<Image> images,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

// @freezed
// class Image with _$Image {
//   const factory Image() = _Image;

//   factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
// }
