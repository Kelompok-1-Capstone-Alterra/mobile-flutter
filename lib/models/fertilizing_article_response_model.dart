// To parse this JSON data, do
//
//     final fertilizingArticleResponse = fertilizingArticleResponseFromJson(jsonString);

import 'dart:convert';
import 'package:mobile_flutter/models/product.dart';

FertilizingArticleResponseModel fertilizingArticleResponseFromJson(
        String str) =>
    FertilizingArticleResponseModel.fromJson(json.decode(str));

String fertilizingArticleResponseToJson(FertilizingArticleResponseModel data) =>
    json.encode(data.toJson());

class FertilizingArticleResponseModel {
  String? description;
  String? name;
  String? picture;
  int? plantId;
  List<Product>? productsRecomendation;

  FertilizingArticleResponseModel({
    this.description,
    this.name,
    this.picture,
    this.plantId,
    this.productsRecomendation,
  });

  factory FertilizingArticleResponseModel.fromJson(Map<String, dynamic> json) =>
      FertilizingArticleResponseModel(
        description: json["description"],
        name: json["name"],
        picture: json["picture"],
        plantId: json["plant_id"],
        productsRecomendation: json["products_recomendation"] == null
            ? []
            : List<Product>.from(json["products_recomendation"]!
                .map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "name": name,
        "picture": picture,
        "plant_id": plantId,
        "products_recomendation": productsRecomendation == null
            ? []
            : List<dynamic>.from(productsRecomendation!.map((x) => x.toJson())),
      };
}
