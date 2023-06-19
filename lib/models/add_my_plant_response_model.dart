// To parse this JSON data, do
//
//     final addMyplantResponseModel = addMyplantResponseModelFromJson(jsonString);

import 'dart:convert';

AddMyplantResponseModel addMyplantResponseModelFromJson(String str) =>
    AddMyplantResponseModel.fromJson(json.decode(str));

String addMyplantResponseModelToJson(AddMyplantResponseModel data) =>
    json.encode(data.toJson());

class AddMyplantResponseModel {
  int? myplantId;
  int? plantsId;

  AddMyplantResponseModel({
    this.myplantId,
    this.plantsId,
  });

  factory AddMyplantResponseModel.fromJson(Map<String, dynamic> json) =>
      AddMyplantResponseModel(
        myplantId: json["myplant_id"],
        plantsId: json["plant_id"],
      );

  Map<String, dynamic> toJson() => {
        "myplant_id": myplantId,
        "plants_id": plantsId,
      };
}
