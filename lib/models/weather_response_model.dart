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
  String? label;
  int? labelId;
  double? temperature;

  WeatherResponseModel({
    this.city,
    this.label,
    this.labelId,
    this.temperature,
  });

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) =>
      WeatherResponseModel(
        city: json["city"],
        label: json["label"],
        labelId: json["label_id"],
        temperature: json["temperature"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "label": label,
        "label_id": labelId,
        "temperature": temperature,
      };
}
