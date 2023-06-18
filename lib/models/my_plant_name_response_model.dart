class MyPlantNameResponseModel {
  int? myplantId;
  String? name;
  String? latin;
  bool? isStartPlanting;

  MyPlantNameResponseModel({
    this.myplantId,
    this.name,
    this.latin,
    this.isStartPlanting,
  });

  MyPlantNameResponseModel copyWith({
    int? myplantId,
    String? name,
    String? latin,
    bool? isStartPlanting,
  }) =>
      MyPlantNameResponseModel(
        myplantId: myplantId ?? this.myplantId,
        name: name ?? this.name,
        latin: latin ?? this.latin,
        isStartPlanting: isStartPlanting ?? this.isStartPlanting,
      );

  factory MyPlantNameResponseModel.fromJson(Map<String, dynamic> json) =>
      MyPlantNameResponseModel(
        myplantId: json["myplant_id"],
        name: json["name"],
        latin: json["latin"],
        isStartPlanting: json["is_start_planting"],
      );

  Map<String, dynamic> toJson() => {
        "myplant_id": myplantId,
        "name": name,
        "latin": latin,
        "is_start_planting": isStartPlanting,
      };
}
