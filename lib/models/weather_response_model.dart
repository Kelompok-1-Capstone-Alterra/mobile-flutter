// To parse this JSON data, do
//
//     final weatherResponseModel = weatherResponseModelFromJson(jsonString);

import 'dart:convert';

WeatherResponseModel weatherResponseModelFromJson(String str) =>
    WeatherResponseModel.fromJson(json.decode(str));

String weatherResponseModelToJson(WeatherResponseModel data) =>
    json.encode(data.toJson());

class WeatherResponseModel {
  String? city;
  String? country;
  String? label;
  int? labelId;
  String? temperature;

  WeatherResponseModel({
    this.city,
    this.country,
    this.label,
    this.labelId,
    this.temperature,
  });

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) =>
      WeatherResponseModel(
        city: json["city"],
        country: json["country"],
        label: json["label"],
        labelId: json["label_id"],
        temperature: json["temperature"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "country": country,
        "label": label,
        "label_id": labelId,
        "temperature": temperature,
      };
}
