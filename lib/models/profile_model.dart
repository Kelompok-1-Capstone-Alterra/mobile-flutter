import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String? email;
  int? id;
  String? name;
  String? picture;

  ProfileModel({
    this.email,
    this.id,
    this.name,
    this.picture,
  });

  ProfileModel copyWith({
    String? email,
    int? id,
    String? name,
    String? picture,
  }) =>
      ProfileModel(
        email: email ?? this.email,
        id: id ?? this.id,
        name: name ?? this.name,
        picture: picture ?? this.picture,
      );

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        email: json["email"],
        id: json["id"],
        name: json["name"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "name": name,
        "picture": picture,
      };
}
