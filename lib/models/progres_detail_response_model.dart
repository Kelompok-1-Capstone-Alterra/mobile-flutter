class ProgresDetailResponseModel {
  String? status;
  Progress? progress;
  Watering? watering;
  Fertilizing? fertilizing;

  ProgresDetailResponseModel({
    this.status,
    this.progress,
    this.watering,
    this.fertilizing,
  });

  ProgresDetailResponseModel copyWith({
    String? status,
    Progress? progress,
    Watering? watering,
    Fertilizing? fertilizing,
  }) =>
      ProgresDetailResponseModel(
        status: status ?? this.status,
        progress: progress ?? this.progress,
        watering: watering ?? this.watering,
        fertilizing: fertilizing ?? this.fertilizing,
      );

  factory ProgresDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      ProgresDetailResponseModel(
        status: json["status"],
        progress: json["progress"] == null
            ? null
            : Progress.fromJson(json["progress"]),
        watering: json["watering"] == null
            ? null
            : Watering.fromJson(json["watering"]),
        fertilizing: json["fertilizing"] == null
            ? null
            : Fertilizing.fromJson(json["fertilizing"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "progress": progress?.toJson(),
        "watering": watering?.toJson(),
        "fertilizing": fertilizing?.toJson(),
      };
}

class Fertilizing {
  int? fertilizingId;
  int? week;
  int? history;

  Fertilizing({
    this.fertilizingId,
    this.week,
    this.history,
  });

  Fertilizing copyWith({
    int? fertilizingId,
    int? week,
    int? history,
  }) =>
      Fertilizing(
        fertilizingId: fertilizingId ?? this.fertilizingId,
        week: week ?? this.week,
        history: history ?? this.history,
      );

  factory Fertilizing.fromJson(Map<String, dynamic> json) => Fertilizing(
        fertilizingId: json["fertilizing_id"],
        week: json["week"],
        history: json["history"],
      );

  Map<String, dynamic> toJson() => {
        "fertilizing_id": fertilizingId,
        "week": week,
        "history": history,
      };
}

class Progress {
  int? weeklyProgressId;
  int? week;
  List<String>? pictures;
  String? from;
  String? to;
  String? condition;
  String? desc;

  Progress({
    this.weeklyProgressId,
    this.week,
    this.pictures,
    this.from,
    this.to,
    this.condition,
    this.desc,
  });

  Progress copyWith({
    int? weeklyProgressId,
    int? week,
    List<String>? pictures,
    String? from,
    String? to,
    String? condition,
    String? desc,
  }) =>
      Progress(
        weeklyProgressId: weeklyProgressId ?? this.weeklyProgressId,
        week: week ?? this.week,
        pictures: pictures ?? this.pictures,
        from: from ?? this.from,
        to: to ?? this.to,
        condition: condition ?? this.condition,
        desc: desc ?? this.desc,
      );

  factory Progress.fromJson(Map<String, dynamic> json) => Progress(
        weeklyProgressId: json["weekly_progress_id"],
        week: json["week"],
        pictures: json["pictures"] == null
            ? []
            : List<String>.from(json["pictures"]!.map((x) => x)),
        from: json["from"],
        to: json["to"],
        condition: json["condition"],
        desc: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "weekly_progress_id": weeklyProgressId,
        "week": week,
        "pictures":
            pictures == null ? [] : List<dynamic>.from(pictures!.map((x) => x)),
        "from": from,
        "to": to,
        "condition": condition,
        "description": desc,
      };
}

class Watering {
  int? wateringId;
  int? week;
  List<int>? history;

  Watering({
    this.wateringId,
    this.week,
    this.history,
  });

  Watering copyWith({
    int? wateringId,
    int? week,
    List<int>? history,
  }) =>
      Watering(
        wateringId: wateringId ?? this.wateringId,
        week: week ?? this.week,
        history: history ?? this.history,
      );

  factory Watering.fromJson(Map<String, dynamic> json) => Watering(
        wateringId: json["watering_id"],
        week: json["week"],
        history: json["history"] == null
            ? []
            : List<int>.from(json["history"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "watering_id": wateringId,
        "week": week,
        "history":
            history == null ? [] : List<dynamic>.from(history!.map((x) => x)),
      };
}
