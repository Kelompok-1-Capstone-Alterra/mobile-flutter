// To parse this JSON data, do
//
//     final plantingArticleResponseModel = plantingArticleResponseModelFromJson(jsonString);

// import 'dart:convert';

// PlantingArticleResponseModel plantingArticleResponseModelFromJson(String str) =>
//     PlantingArticleResponseModel.fromJson(json.decode(str));

// String plantingArticleResponseModelToJson(PlantingArticleResponseModel data) =>
//     json.encode(data.toJson());

// class PlantingArticleResponseModel {
//   Description? description;
//   String? linkVideo;
//   String? location;
//   int? plantId;

//   PlantingArticleResponseModel({
//     this.description,
//     this.linkVideo,
//     this.location,
//     this.plantId,
//   });

//   factory PlantingArticleResponseModel.fromJson(Map<String, dynamic> json) =>
//       PlantingArticleResponseModel(
//         description: json["description"] == null
//             ? null
//             : Description.fromJson(json["description"]),
//         linkVideo: json["link_video"],
//         location: json["location"],
//         plantId: json["plant_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "description": description?.toJson(),
//         "link_video": linkVideo,
//         "location": location,
//         "plant_id": plantId,
//       };
// }

// class Description {
//   String? instruction;
//   String? material;

//   Description({
//     this.instruction,
//     this.material,
//   });

//   factory Description.fromJson(Map<String, dynamic> json) => Description(
//         instruction: json["instruction"],
//         material: json["material"],
//       );

//   Map<String, dynamic> toJson() => {
//         "instruction": instruction,
//         "material": material,
//       };
// }

// To parse this JSON data, do
//
//     final plantingArticleResponseModel = plantingArticleResponseModelFromJson(jsonString);

import 'dart:convert';

PlantingArticleResponseModel plantingArticleResponseModelFromJson(String str) =>
    PlantingArticleResponseModel.fromJson(json.decode(str));

String plantingArticleResponseModelToJson(PlantingArticleResponseModel data) =>
    json.encode(data.toJson());

class PlantingArticleResponseModel {
  Description? description;
  String? linkVideo;
  String? location;
  int? plantId;

  PlantingArticleResponseModel({
    this.description,
    this.linkVideo,
    this.location,
    this.plantId,
  });

  factory PlantingArticleResponseModel.fromJson(Map<String, dynamic> json) =>
      PlantingArticleResponseModel(
        description: json["description"] == null
            ? null
            : Description.fromJson(json["description"]),
        linkVideo: json["link_video"],
        location: json["location"],
        plantId: json["plant_id"],
      );

  Map<String, dynamic> toJson() => {
        "description": description?.toJson(),
        "link_video": linkVideo,
        "location": location,
        "plant_id": plantId,
      };
}

class Description {
  String? instruction;
  String? material;

  Description({
    this.instruction,
    this.material,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        instruction: json["instruction"],
        material: json["material"],
      );

  Map<String, dynamic> toJson() => {
        "instruction": instruction,
        "material": material,
      };
}
