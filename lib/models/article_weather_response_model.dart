// To parse this JSON data, do
//
//     final articleWeatherResponseModel = articleWeatherResponseModelFromJson(jsonString);

import 'dart:convert';

ArticleWeatherResponseModel articleWeatherResponseModelFromJson(String str) =>
    ArticleWeatherResponseModel.fromJson(json.decode(str));

String articleWeatherResponseModelToJson(ArticleWeatherResponseModel data) =>
    json.encode(data.toJson());

class ArticleWeatherResponseModel {
  int? articleId;
  String? desc;
  String? label;
  int? labelId;
  String? picture;
  String? title;

  ArticleWeatherResponseModel({
    this.articleId,
    this.desc,
    this.label,
    this.labelId,
    this.picture,
    this.title,
  });

  factory ArticleWeatherResponseModel.fromJson(Map<String, dynamic> json) =>
      ArticleWeatherResponseModel(
        articleId: json["article_id"],
        desc: json["desc"],
        label: json["label"],
        labelId: json["label_id"],
        picture: json["picture"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "article_id": articleId,
        "desc": desc,
        "label": label,
        "label_id": labelId,
        "picture": picture,
        "title": title,
      };
}
