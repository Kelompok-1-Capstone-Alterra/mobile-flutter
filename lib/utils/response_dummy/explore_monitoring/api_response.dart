class ApiResponse {
  ApiResponse._();

  static const String getMyPlantName = '''  
{
  "myplant_id": 1,
  "name": "Tomatku yang genduuuddd",
  "latin": "uchiha bayu tomozaki",
  "is_start_planting": true
}
''';

  static const String getOverview = '''
{
  "watering": {
    "week": 1,
    "day": 7,
    "period": 2,
    "is_active": true,
    "history": [
      2,
      1,
      2,
      2,
      2,
      1,
      0
    ]
  },
  "fertilizing": {
    "is_active": true,
    "is_enabled": false
  },
  "weekly_progress": {
    "is_active": true,
    "from": "23-5-2023",
    "to": "28-5-2023",
    "is_enabled": true
  },
  "temperature_alert": {
    "is_active": true,
    "name": "Tomat",
    "current": 32,
    "min": 24,
    "max": 28
  },
  "button_harvest": true,
  "button_dead": true
}
''';

  static const String getProgres = '''  
[
    {
        "weekly_progress_id": 1,
        "week": 1,
        "picture": "4e8f1d1e-8fe0-4b56-a2b2-256d44b36f1d.png",
        "from": "23-5-2023",
        "to": "29-5-2023",
        "status": "planting"
    },
    {
        "weekly_progress_id": 2,
        "week": 2,
        "picture": "4e8f1d1e-8fe0-4b56-a2b2-256d44b36f1d.png",
        "from": "30-5-2023",
        "to": "5-6-2023",
        "status": "planting"
    },
    {
        "weekly_progress_id": 3,
        "week": 3,
        "picture": "4e8f1d1e-8fe0-4b56-a2b2-256d44b36f1d.png",
        "from": "6-6-2023",
        "to": null,
        "status": "dead"
    }
]
''';

  static const String getProgresDetail = '''  
{
    "status": "planting",
    "progress": {
        "weekly_progress_id": 1,
        "week": 3,
        "picture": [
            "5fe5c95d-030e-4623-91f4-b4b6fd8069b.png",
            "5fe5c95d-030e-4623-91f4-b4b6fd8069bf.png",
            "5fe5c95d-030e-4623-91f4-b4b6fd8069b.png"
        ],
        "from": "23-5-2023",
        "to": "29-5-2023",
        "condition": "Sangat Buruk",
        "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed et feugiat est.Fusce consectetur efficitur"
    },
    "watering": {
        "watering_id": 1,
        "week": 1,
        "history": [
            2,
            2,
            2,
            2,
            2,
            1,
            0
        ]
    },
    "fertilizing": {
        "fertilizing_id": 1,
        "week": 1,
        "history": 1
    }
}
''';
}
