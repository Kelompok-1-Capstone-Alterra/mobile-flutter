import 'dart:convert';
import 'package:equatable/equatable.dart';

List<PlantsResponseModel> myPlantResponseModelFromJson(String str) =>
    List<PlantsResponseModel>.from(
        json.decode(str).map((x) => PlantsResponseModel.fromJson(x)));

String myPlantResponseModelToJson(List<PlantsResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlantsResponseModel extends Equatable {
  final int? myplantId;
  final String? name;
  final String? picture;
  final String? latin;

  const PlantsResponseModel({
    this.myplantId,
    this.name,
    this.picture,
    this.latin,
  });

  factory PlantsResponseModel.fromJson(Map<String, dynamic> json) =>
      PlantsResponseModel(
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
