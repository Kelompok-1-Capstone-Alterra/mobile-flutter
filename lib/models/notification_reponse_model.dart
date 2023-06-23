// To parse this JSON data, do
//
//     final notificationResponseModel = notificationResponseModelFromJson(jsonString);

import 'dart:convert';

NotificationResponseModel notificationResponseModelFromJson(String str) =>
    NotificationResponseModel.fromJson(json.decode(str));

String notificationResponseModelToJson(NotificationResponseModel data) =>
    json.encode(data.toJson());

class NotificationResponseModel {
  String? description;
  int? idNotif;
  String? location;
  int? myplantId;
  String? namaTanamanku;
  int? plantId;
  bool? readStatus;

  NotificationResponseModel({
    this.description,
    this.idNotif,
    this.location,
    this.myplantId,
    this.namaTanamanku,
    this.plantId,
    this.readStatus,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      NotificationResponseModel(
        description: json["description"],
        idNotif: json["id_notif"],
        location: json["location"],
        myplantId: json["myplant_id"],
        namaTanamanku: json["nama_tanamanku"],
        plantId: json["plant_id"],
        readStatus: json["read_status"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "id_notif": idNotif,
        "location": location,
        "myplant_id": myplantId,
        "nama_tanamanku": namaTanamanku,
        "plant_id": plantId,
        "read_status": readStatus,
      };
}
