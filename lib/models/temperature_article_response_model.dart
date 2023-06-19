// To parse this JSON data, do
//
//     final tempArticleResponseModel = tempArticleResponseModelFromJson(jsonString);

import 'dart:convert';

TempArticleResponseModel tempArticleResponseModelFromJson(String str) =>
    TempArticleResponseModel.fromJson(json.decode(str));

String tempArticleResponseModelToJson(TempArticleResponseModel data) =>
    json.encode(data.toJson());

class TempArticleResponseModel {
  String? description;
  String? name;
  String? picture;
  int? plantId;

  TempArticleResponseModel({
    this.description,
    this.name,
    this.picture,
    this.plantId,
  });

  factory TempArticleResponseModel.fromJson(Map<String, dynamic> json) =>
      TempArticleResponseModel(
        description: json["description"],
        name: json["name"],
        picture: json["picture"],
        plantId: json["plant_id"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "name": name,
        "picture": picture,
        "plant_id": plantId,
      };
}
