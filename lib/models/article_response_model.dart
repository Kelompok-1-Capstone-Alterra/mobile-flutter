class ArticleResponseModel {
  int? id;
  String? title;
  String? picture;
  String? postAt;

  ArticleResponseModel({
    this.id,
    this.title,
    this.picture,
    this.postAt,
  });

  factory ArticleResponseModel.fromJson(Map<String, dynamic> json) =>
      ArticleResponseModel(
        id: json["id"],
        title: json["title"],
        picture: json["picture"],
        postAt: json["post_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "picture": picture,
        "post_at": postAt,
      };
}
