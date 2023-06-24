import 'package:equatable/equatable.dart';

class ArticleResponseModel extends Equatable {
  final int? id;
  final String? title;
  final String? picture;
  final String? postAt;

  const ArticleResponseModel({
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

  @override
  List<Object?> get props => [id, title];
}
