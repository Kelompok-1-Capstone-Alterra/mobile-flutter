class ArticleResponseModel {
  int? id;
  String? title;
  String? picture;
  int? hours;

  ArticleResponseModel({
    this.id,
    this.title,
    this.picture,
    this.hours,
  });

  factory ArticleResponseModel.fromJson(Map<String, dynamic> json) =>
      ArticleResponseModel(
        id: json["id"],
        title: json["title"],
        picture: json["picture"],
        hours: json["hours"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "picture": picture,
        "hours": hours,
      };
}
