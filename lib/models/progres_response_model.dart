class ProgresResponseModel {
  int? weeklyProgressId;
  int? week;
  String? picture;
  String? from;
  String? to;
  String? status;

  ProgresResponseModel({
    this.weeklyProgressId,
    this.week,
    this.picture,
    this.from,
    this.to,
    this.status,
  });

  ProgresResponseModel copyWith({
    int? weeklyProgressId,
    int? week,
    String? picture,
    String? from,
    String? to,
    String? status,
  }) =>
      ProgresResponseModel(
        weeklyProgressId: weeklyProgressId ?? this.weeklyProgressId,
        week: week ?? this.week,
        picture: picture ?? this.picture,
        from: from ?? this.from,
        to: to ?? this.to,
        status: status ?? this.status,
      );

  factory ProgresResponseModel.fromJson(Map<String, dynamic> json) =>
      ProgresResponseModel(
        weeklyProgressId: json["weekly_progress_id"],
        week: json["week"],
        picture: json["picture"],
        from: json["from"],
        to: json["to"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "weekly_progress_id": weeklyProgressId,
        "week": week,
        "picture": picture,
        "from": from,
        "to": to,
        "status": status,
      };
}
