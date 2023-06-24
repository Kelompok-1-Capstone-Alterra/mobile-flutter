import 'dart:convert';

GetProductsByCategory getProductsByCategoryFromJson(String str) =>
    GetProductsByCategory.fromJson(json.decode(str));

String getProductsByCategoryToJson(GetProductsByCategory data) =>
    json.encode(data.toJson());

class GetProductsByCategory {
  String? category;
  List<Product>? products;

  GetProductsByCategory({
    this.category,
    this.products,
  });

  GetProductsByCategory copyWith({
    String? category,
    List<Product>? products,
  }) =>
      GetProductsByCategory(
        category: category ?? this.category,
        products: products ?? this.products,
      );

  factory GetProductsByCategory.fromJson(Map<String, dynamic> json) =>
      GetProductsByCategory(
        category: json["category"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  int? id;
  List<String>? productPictures;
  String? productName;
  int? productPrice;
  int? productSeen;

  Product({
    this.id,
    this.productPictures,
    this.productName,
    this.productPrice,
    this.productSeen,
  });

  Product copyWith({
    int? id,
    List<String>? productPictures,
    String? productName,
    int? productPrice,
    int? productSeen,
  }) =>
      Product(
        id: id ?? this.id,
        productPictures: productPictures ?? this.productPictures,
        productName: productName ?? this.productName,
        productPrice: productPrice ?? this.productPrice,
        productSeen: productSeen ?? this.productSeen,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
