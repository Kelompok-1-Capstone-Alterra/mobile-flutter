// To parse this JSON data, do
//
//     final availablePlantResponseModel = availablePlantResponseModelFromJson(jsonString);

import 'dart:convert';

AvailablePlantResponseModel availablePlantResponseModelFromJson(String str) =>
    AvailablePlantResponseModel.fromJson(json.decode(str));

String availablePlantResponseModelToJson(AvailablePlantResponseModel data) =>
    json.encode(data.toJson());

class AvailablePlantResponseModel {
  String? latin;
  String? name;
  String? pictures;
  int? plantId;

  AvailablePlantResponseModel({
    this.latin,
    this.name,
    this.pictures,
    this.plantId,
  });

  factory AvailablePlantResponseModel.fromJson(Map<String, dynamic> json) =>
      AvailablePlantResponseModel(
        latin: json["latin"],
        name: json["name"],
        pictures: json["picture"],
        plantId: json["plant_id"],
      );

  Map<String, dynamic> toJson() => {
        "latin": latin,
        "name": name,
        "picture": pictures,
        "plant_id": plantId,
      };
}
