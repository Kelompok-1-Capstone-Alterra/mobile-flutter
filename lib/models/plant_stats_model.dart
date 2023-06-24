import 'dart:convert';

List<PlantStatsModel> plantStatsModelFromJson(String str) =>
    List<PlantStatsModel>.from(
        json.decode(str).map((x) => PlantStatsModel.fromJson(x)));

String plantStatsModelToJson(List<PlantStatsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlantStatsModel {
  int? myplantId;
  List<Picture>? pictures;
  String? name;
  String? latin;
  String? status;

  PlantStatsModel({
    this.myplantId,
    this.pictures,
    this.name,
    this.latin,
    this.status,
  });

  PlantStatsModel copyWith({
    int? myplantId,
    List<Picture>? pictures,
    String? name,
    String? latin,
    String? status,
  }) =>
      PlantStatsModel(
        myplantId: myplantId ?? this.myplantId,
        pictures: pictures ?? this.pictures,
        name: name ?? this.name,
        latin: latin ?? this.latin,
        status: status ?? this.status,
      );

  factory PlantStatsModel.fromJson(Map<String, dynamic> json) =>
      PlantStatsModel(
        myplantId: json["myplant_id"],
        pictures: json["pictures"] == null
            ? []
            : List<Picture>.from(
                json["pictures"]!.map((x) => Picture.fromJson(x))),
        name: json["name"],
        latin: json["latin"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "myplant_id": myplantId,
        "pictures": pictures == null
            ? []
            : List<dynamic>.from(pictures!.map((x) => x.toJson())),
        "name": name,
        "latin": latin,
        "status": status,
      };
}

class Picture {
  String? url;

  Picture({
    this.url,
  });

  Picture copyWith({
    String? url,
  }) =>
      Picture(
        url: url ?? this.url,
      );

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
