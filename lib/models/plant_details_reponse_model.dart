// To parse this JSON data, do
//
//     final detailsPlantResponseModel = detailsPlantResponseModelFromJson(jsonString);

import 'dart:convert';

PlantDetailsResponseModel detailsPlantResponseModelFromJson(String str) =>
    PlantDetailsResponseModel.fromJson(json.decode(str));

String detailsPlantResponseModelToJson(PlantDetailsResponseModel data) =>
    json.encode(data.toJson());

class PlantDetailsResponseModel {
  int? plantId;
  String? picture;
  String? name;
  String? latin;
  String? description;
  int? fertilizingArticleId;
  int? wateringArticleId;
  int? temperatureArticleId;

  PlantDetailsResponseModel({
    this.plantId,
    this.picture,
    this.name,
    this.latin,
    this.description,
    this.fertilizingArticleId,
    this.wateringArticleId,
    this.temperatureArticleId,
  });

  factory PlantDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      PlantDetailsResponseModel(
        plantId: json["plant_id"],
        picture: json["picture"],
        name: json["name"],
        latin: json["latin"],
        description: json["description"],
        fertilizingArticleId: json["fertilizing_article_id"],
        wateringArticleId: json["watering_article_id"],
        temperatureArticleId: json["temperature_article_id"],
      );

  Map<String, dynamic> toJson() => {
        "plant_id": plantId,
        "picture": picture,
        "name": name,
        "latin": latin,
        "description": description,
        "fertilizing_article_id": fertilizingArticleId,
        "watering_article_id": wateringArticleId,
        "temperature_article_id": temperatureArticleId,
      };
}
