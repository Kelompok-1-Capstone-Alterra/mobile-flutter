import 'dart:convert';
import 'package:equatable/equatable.dart';

List<MyPlantsResponseModel> myPlantResponseModelFromJson(String str) =>
    List<MyPlantsResponseModel>.from(
        json.decode(str).map((x) => MyPlantsResponseModel.fromJson(x)));

String myPlantResponseModelToJson(List<MyPlantsResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// ignore: must_be_immutable
class MyPlantsResponseModel extends Equatable {
  final int? myplantId;
  final String? name;
  final String? picture;
  final String? latin;
  bool isSelected = false;

  MyPlantsResponseModel({
    this.myplantId,
    this.name,
    this.picture,
    this.latin,
  });

  factory MyPlantsResponseModel.fromJson(Map<String, dynamic> json) =>
      MyPlantsResponseModel(
        myplantId: json["myplant_id"],
        name: json["name"],
        picture: json["picture"],
        latin: json["latin"],
      );

  Map<String, dynamic> toJson() => {
        "myplant_id": myplantId,
        "name": name,
        "picture": picture,
        "latin": latin,
      };

  @override
  List<Object?> get props => [myplantId, name];
}
