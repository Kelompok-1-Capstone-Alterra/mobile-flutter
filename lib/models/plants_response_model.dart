import 'dart:convert';
import 'package:equatable/equatable.dart';

MyPlantsResponseModel myPlantsResponseModelFromJson(String str) =>
    MyPlantsResponseModel.fromJson(json.decode(str));

String myPlantsResponseModelToJson(MyPlantsResponseModel data) =>
    json.encode(data.toJson());

// ignore: must_be_immutable
class MyPlantsResponseModel extends Equatable {
  final String? latin;
  final String? location;
  final int? myplantId;
  final String? name;
  final String? picture;
  final int? plantId;
  bool isSelected = false;

  MyPlantsResponseModel({
    this.latin,
    this.location,
    this.myplantId,
    this.name,
    this.picture,
    this.plantId,
  });

  factory MyPlantsResponseModel.fromJson(Map<String, dynamic> json) =>
      MyPlantsResponseModel(
        latin: json["latin"],
        location: json["location"],
        myplantId: json["myplant_id"],
        name: json["name"],
        picture: json["picture"],
        plantId: json["plant_id"],
      );

  Map<String, dynamic> toJson() => {
        "latin": latin,
        "location": location,
        "myplant_id": myplantId,
        "name": name,
        "picture": picture,
        "plant_id": plantId,
      };
  @override
  List<Object?> get props => [myplantId, name];
}
