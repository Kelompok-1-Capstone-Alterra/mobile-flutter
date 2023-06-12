// To parse this JSON data, do
//
//     final locationPlantResponseModel = locationPlantResponseModelFromJson(jsonString);

import 'dart:convert';

LocationPlantResponseModel locationPlantResponseModelFromJson(String str) =>
    LocationPlantResponseModel.fromJson(json.decode(str));

String locationPlantResponseModelToJson(LocationPlantResponseModel data) =>
    json.encode(data.toJson());

class LocationPlantResponseModel {
  int? locationPlant;
  String? picture;

  LocationPlantResponseModel({
    this.locationPlant,
    this.picture,
  });

  factory LocationPlantResponseModel.fromJson(Map<String, dynamic> json) =>
      LocationPlantResponseModel(
        locationPlant: json["location_plant"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "location_plant": locationPlant,
        "picture": picture,
      };
}
