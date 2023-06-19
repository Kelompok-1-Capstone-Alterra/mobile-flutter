// To parse this JSON data, do
//
// final detailsPlantResponseModel = detailsPlantResponseModelFromJson(jsonString);

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

// To parse this JSON data, do
//
//     final plantDetailsResponseModel = plantDetailsResponseModelFromJson(jsonString);

// import 'dart:convert';

// PlantDetailsResponseModel plantDetailsResponseModelFromJson(String str) =>
//     PlantDetailsResponseModel.fromJson(json.decode(str));

// String plantDetailsResponseModelToJson(PlantDetailsResponseModel data) =>
//     json.encode(data.toJson());

// class PlantDetailsResponseModel {
//   String? description;
//   String? latin;
//   String? name;
//   String? picture;
//   int? plantId;

//   PlantDetailsResponseModel({
//     this.description,
//     this.latin,
//     this.name,
//     this.picture,
//     this.plantId,
//   });

//   factory PlantDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
//       PlantDetailsResponseModel(
//         description: json["description"],
//         latin: json["latin"],
//         name: json["name"],
//         picture: json["picture"],
//         plantId: json["plant_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "description": description,
//         "latin": latin,
//         "name": name,
//         "picture": picture,
//         "plant_id": plantId,
//       };
// }
