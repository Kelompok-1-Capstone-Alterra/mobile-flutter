class OverviewResponseModel {
  Watering? watering;
  Fertilizing? fertilizing;
  WeeklyProgress? weeklyProgress;
  TemperatureAlert? temperatureAlert;
  bool? buttonHarvest;
  bool? buttonDead;

  OverviewResponseModel({
    this.watering,
    this.fertilizing,
    this.weeklyProgress,
    this.temperatureAlert,
    this.buttonHarvest,
    this.buttonDead,
  });

  OverviewResponseModel copyWith({
    Watering? watering,
    Fertilizing? fertilizing,
    WeeklyProgress? weeklyProgress,
    TemperatureAlert? temperatureAlert,
    bool? buttonHarvest,
    bool? buttonDead,
  }) =>
      OverviewResponseModel(
        watering: watering ?? this.watering,
        fertilizing: fertilizing ?? this.fertilizing,
        weeklyProgress: weeklyProgress ?? this.weeklyProgress,
        temperatureAlert: temperatureAlert ?? this.temperatureAlert,
        buttonHarvest: buttonHarvest ?? this.buttonHarvest,
        buttonDead: buttonDead ?? this.buttonDead,
      );

  factory OverviewResponseModel.fromJson(Map<String, dynamic> json) =>
      OverviewResponseModel(
        watering: json["watering"] == null
            ? null
            : Watering.fromJson(json["watering"]),
        fertilizing: json["fertilizing"] == null
            ? null
            : Fertilizing.fromJson(json["fertilizing"]),
        weeklyProgress: json["weekly_progress"] == null
            ? null
            : WeeklyProgress.fromJson(json["weekly_progress"]),
        temperatureAlert: json["temperature_alert"] == null
            ? null
            : TemperatureAlert.fromJson(json["temperature_alert"]),
        buttonHarvest: json["button_harvest"],
        buttonDead: json["button_dead"],
      );

  Map<String, dynamic> toJson() => {
        "watering": watering?.toJson(),
        "fertilizing": fertilizing?.toJson(),
        "weekly_progress": weeklyProgress?.toJson(),
        "temperature_alert": temperatureAlert?.toJson(),
        "button_harvest": buttonHarvest,
        "button_dead": buttonDead,
      };
}

class Fertilizing {
  bool? isActive;
  bool? isEnabled;

  Fertilizing({
    this.isActive,
    this.isEnabled,
  });

  Fertilizing copyWith({
    bool? isActive,
    bool? isEnabled,
  }) =>
      Fertilizing(
        isActive: isActive ?? this.isActive,
        isEnabled: isEnabled ?? this.isEnabled,
      );

  factory Fertilizing.fromJson(Map<String, dynamic> json) => Fertilizing(
        isActive: json["is_active"],
        isEnabled: json["is_enabled"],
      );

  Map<String, dynamic> toJson() => {
        "is_active": isActive,
        "is_enabled": isEnabled,
      };
}

class TemperatureAlert {
  bool? isActive;
  String? name;
  double? current;
  int? min;
  int? max;

  TemperatureAlert({
    this.isActive,
    this.name,
    this.current,
    this.min,
    this.max,
  });

  TemperatureAlert copyWith({
    bool? isActive,
    String? name,
    double? current,
    int? min,
    int? max,
  }) =>
      TemperatureAlert(
        isActive: isActive ?? this.isActive,
        name: name ?? this.name,
        current: current ?? this.current,
        min: min ?? this.min,
        max: max ?? this.max,
      );

  factory TemperatureAlert.fromJson(Map<String, dynamic> json) =>
      TemperatureAlert(
        isActive: json["is_active"],
        name: json["name"],
        current: json["current"],
        min: json["min"],
        max: json["max"],
      );

  Map<String, dynamic> toJson() => {
        "is_active": isActive,
        "name": name,
        "current": current,
        "min": min,
        "max": max,
      };
}

class Watering {
  int? week;
  int? day;
  int? period;
  bool? isActive;
  List<int>? history;

  Watering({
    this.week,
    this.day,
    this.period,
    this.isActive,
    this.history,
  });

  Watering copyWith({
    int? week,
    int? day,
    int? period,
    bool? isActive,
    List<int>? history,
  }) =>
      Watering(
        week: week ?? this.week,
        day: day ?? this.day,
        period: period ?? this.period,
        isActive: isActive ?? this.isActive,
        history: history ?? this.history,
      );

  factory Watering.fromJson(Map<String, dynamic> json) => Watering(
        week: json["week"],
        day: json["day"],
        period: json["period"],
        isActive: json["is_active"],
        history: json["history"] == null
            ? []
            : List<int>.from(json["history"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "week": week,
        "day": day,
        "period": period,
        "is_active": isActive,
        "history":
            history == null ? [] : List<dynamic>.from(history!.map((x) => x)),
      };
}

class WeeklyProgress {
  bool? isActive;
  String? from;
  String? to;
  bool? isEnabled;

  WeeklyProgress({
    this.isActive,
    this.from,
    this.to,
    this.isEnabled,
  });

  WeeklyProgress copyWith({
    bool? isActive,
    String? from,
    String? to,
    bool? isEnabled,
  }) =>
      WeeklyProgress(
        isActive: isActive ?? this.isActive,
        from: from ?? this.from,
        to: to ?? this.to,
        isEnabled: isEnabled ?? this.isEnabled,
      );

  factory WeeklyProgress.fromJson(Map<String, dynamic> json) => WeeklyProgress(
        isActive: json["is_active"],
        from: json["from"],
        to: json["to"],
        isEnabled: json["is_enabled"],
      );

  Map<String, dynamic> toJson() => {
        "is_active": isActive,
        "from": from,
        "to": to,
        "is_enabled": isEnabled,
      };
}
