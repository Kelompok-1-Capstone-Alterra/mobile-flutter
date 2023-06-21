import 'dart:convert';

List<dynamic> articleByIdResponseModelFromJson(String str) =>
    List<dynamic>.from(json.decode(str).map((x) => x));

String articleByIdResponseModelToJson(List<dynamic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticleByIdResponseModel {
  int? id;
  String? title;
  String? picture;
  String? description;
  bool? isLiked;

  ArticleByIdResponseModel({
    this.id,
    this.title,
    this.picture,
    this.description,
    this.isLiked,
  });

  factory ArticleByIdResponseModel.fromJson(Map<String, dynamic> json) =>
      ArticleByIdResponseModel(
        id: json["id"],
        title: json["title"],
        picture: json["picture"],
        description: json["description"],
        isLiked: json["is_liked"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "picture": picture,
        "description": description,
        "is_liked": isLiked,
      };
}
