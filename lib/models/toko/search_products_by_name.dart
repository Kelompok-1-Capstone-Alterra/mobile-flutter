import 'dart:convert';

List<SearchProductsByName> searchProductsByNameFromJson(String str) =>
    List<SearchProductsByName>.from(
        json.decode(str).map((x) => SearchProductsByName.fromJson(x)));

String searchProductsByNameToJson(List<SearchProductsByName> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchProductsByName {
  int? id;
  List<String>? productPictures;
  String? productName;
  int? productPrice;
  int? productSeen;

  SearchProductsByName({
    this.id,
    this.productPictures,
    this.productName,
    this.productPrice,
    this.productSeen,
  });

  SearchProductsByName copyWith({
    int? id,
    List<String>? productPictures,
    String? productName,
    int? productPrice,
    int? productSeen,
  }) =>
      SearchProductsByName(
        id: id ?? this.id,
        productPictures: productPictures ?? this.productPictures,
        productName: productName ?? this.productName,
        productPrice: productPrice ?? this.productPrice,
        productSeen: productSeen ?? this.productSeen,
      );

  factory SearchProductsByName.fromJson(Map<String, dynamic> json) =>
      SearchProductsByName(
        id: json["id"],
        productPictures: json["product_pictures"] == null
            ? []
            : List<String>.from(json["product_pictures"]!.map((x) => x)),
        productName: json["product_name"],
        productPrice: json["product_price"],
        productSeen: json["product_seen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_pictures": productPictures == null
            ? []
            : List<dynamic>.from(productPictures!.map((x) => x)),
        "product_name": productName,
        "product_price": productPrice,
        "product_seen": productSeen,
      };
}
