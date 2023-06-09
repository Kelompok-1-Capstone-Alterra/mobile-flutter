import 'dart:convert';

List<PlantStatsModel> plantStatsModelFromJson(String str) =>
    List<PlantStatsModel>.from(
        json.decode(str).map((x) => PlantStatsModel.fromJson(x)));

String plantStatsModelToJson(List<PlantStatsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlantStatsModel {
  int? myplantId;
  String? picture;
  String? name;
  String? latin;
  String? status;

  PlantStatsModel({
    this.myplantId,
    this.picture,
    this.name,
    this.latin,
    this.status,
  });

  PlantStatsModel copyWith({
    int? myplantId,
    String? picture,
    String? name,
    String? latin,
    String? status,
  }) =>
      PlantStatsModel(
        myplantId: myplantId ?? this.myplantId,
        picture: picture ?? this.picture,
        name: name ?? this.name,
        latin: latin ?? this.latin,
        status: status ?? this.status,
      );

  factory PlantStatsModel.fromJson(Map<String, dynamic> json) =>
      PlantStatsModel(
        myplantId: json["myplant_id"],
        picture: json["picture"],
        name: json["name"],
        latin: json["latin"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "myplant_id": myplantId,
        "picture": picture,
        "name": name,
        "latin": latin,
        "status": status,
      };
}
