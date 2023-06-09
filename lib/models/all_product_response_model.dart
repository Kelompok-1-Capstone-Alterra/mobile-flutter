// To parse this JSON data, do
//
//     final allProductResponseModel = allProductResponseModelFromJson(jsonString);

import 'dart:convert';

AllProductsResponseModel allProductResponseModelFromJson(String str) =>
    AllProductsResponseModel.fromJson(json.decode(str));

String allProductResponseModelToJson(AllProductsResponseModel data) =>
    json.encode(data.toJson());

class AllProductsResponseModel {
  List<Product>? fertilizers;
  List<Product>? pesticides;
  List<Product>? seeds;
  List<Product>? tools;

  AllProductsResponseModel({
    this.fertilizers,
    this.pesticides,
    this.seeds,
    this.tools,
  });

  factory AllProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      AllProductsResponseModel(
        fertilizers: json["fertilizers"] == null
            ? []
            : List<Product>.from(
                json["fertilizers"]!.map((x) => Product.fromJson(x))),
        pesticides: json["pesticides"] == null
            ? []
            : List<Product>.from(
                json["pesticides"]!.map((x) => Product.fromJson(x))),
        seeds: json["seeds"] == null
            ? []
            : List<Product>.from(
                json["seeds"]!.map((x) => Product.fromJson(x))),
        tools: json["tools"] == null
            ? []
            : List<Product>.from(
                json["tools"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fertilizers": fertilizers == null
            ? []
            : List<dynamic>.from(fertilizers!.map((x) => x.toJson())),
        "pesticides": pesticides == null
            ? []
            : List<dynamic>.from(pesticides!.map((x) => x.toJson())),
        "seeds": seeds == null
            ? []
            : List<dynamic>.from(seeds!.map((x) => x.toJson())),
        "tools": tools == null
            ? []
            : List<dynamic>.from(tools!.map((x) => x.toJson())),
      };
}

class Product {
  int? id;
  List<String>? productPictures;
  String? productName;
  int? productPrice;
  int? productSeen;

  Product({
    this.id,
    this.productPictures,
    this.productName,
    this.productPrice,
    this.productSeen,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productPictures: json["product_pictures"] == null
            ? []
            : List<String>.from(json["product_pictures"]!.map((x) => x)),
        productName: json["product_name"],
        productPrice: json["product_price"],
        productSeen: json["product_seen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_pictures": productPictures == null
            ? []
            : List<dynamic>.from(productPictures!.map((x) => x)),
        "product_name": productName,
        "product_price": productPrice,
        "product_seen": productSeen,
      };
}
