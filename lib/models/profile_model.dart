import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String? name;
  String? email;
  String? password;
  String? picture;
  String? id;

  ProfileModel({
    this.name,
    this.email,
    this.password,
    this.picture,
    this.id,
  });

  ProfileModel copyWith({
    String? name,
    String? email,
    String? password,
    String? picture,
    String? id,
  }) =>
      ProfileModel(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        picture: picture ?? this.picture,
        id: id ?? this.id,
      );

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        picture: json["picture"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "picture": picture,
        "id": id,
      };
}
