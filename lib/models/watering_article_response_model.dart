// To parse this JSON data, do
//
//     final wateringArticleResponse = wateringArticleResponseFromJson(jsonString);

import 'dart:convert';

WateringArticleResponse wateringArticleResponseFromJson(String str) =>
    WateringArticleResponse.fromJson(json.decode(str));

String wateringArticleResponseToJson(WateringArticleResponse data) =>
    json.encode(data.toJson());

class WateringArticleResponse {
  String? description;
  String? name;
  String? picture;
  int? plantId;

  WateringArticleResponse({
    this.description,
    this.name,
    this.picture,
    this.plantId,
  });

  factory WateringArticleResponse.fromJson(Map<String, dynamic> json) =>
      WateringArticleResponse(
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
