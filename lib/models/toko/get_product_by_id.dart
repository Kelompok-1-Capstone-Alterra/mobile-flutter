import 'dart:convert';

GetProductById getProductByIdFromJson(String str) =>
    GetProductById.fromJson(json.decode(str));

String getProductByIdToJson(GetProductById data) => json.encode(data.toJson());

class GetProductById {
  Product? product;
  List<RelatedProduct>? relatedProducts;

  GetProductById({
    this.product,
    this.relatedProducts,
  });

  GetProductById copyWith({
    Product? product,
    List<RelatedProduct>? relatedProducts,
  }) =>
      GetProductById(
        product: product ?? this.product,
        relatedProducts: relatedProducts ?? this.relatedProducts,
      );

  factory GetProductById.fromJson(Map<String, dynamic> json) => GetProductById(
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        relatedProducts: json["related-products"] == null
            ? []
            : List<RelatedProduct>.from(json["related-products"]!
                .map((x) => RelatedProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
        "related-products": relatedProducts == null
            ? []
            : List<dynamic>.from(relatedProducts!.map((x) => x.toJson())),
      };
}

class Product {
  int? id;
  List<String>? productPictures;
  String? productName;
  String? productCategory;
  String? productDescription;
  int? productPrice;
  int? productSeen;
  bool? productStatus;
  String? productBrand;
  String? productCondition;
  int? productUnit;
  int? productWeight;
  String? productForm;

  Product({
    this.id,
    this.productPictures,
    this.productName,
    this.productCategory,
    this.productDescription,
    this.productPrice,
    this.productSeen,
    this.productStatus,
    this.productBrand,
    this.productCondition,
    this.productUnit,
    this.productWeight,
    this.productForm,
  });

  Product copyWith({
    int? id,
    List<String>? productPictures,
    String? productName,
    String? productCategory,
    String? productDescription,
    int? productPrice,
    int? productSeen,
    bool? productStatus,
    String? productBrand,
    String? productCondition,
    int? productUnit,
    int? productWeight,
    String? productForm,
  }) =>
      Product(
        id: id ?? this.id,
        productPictures: productPictures ?? this.productPictures,
        productName: productName ?? this.productName,
        productCategory: productCategory ?? this.productCategory,
        productDescription: productDescription ?? this.productDescription,
        productPrice: productPrice ?? this.productPrice,
        productSeen: productSeen ?? this.productSeen,
        productStatus: productStatus ?? this.productStatus,
        productBrand: productBrand ?? this.productBrand,
        productCondition: productCondition ?? this.productCondition,
        productUnit: productUnit ?? this.productUnit,
        productWeight: productWeight ?? this.productWeight,
        productForm: productForm ?? this.productForm,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productPictures: json["product_pictures"] == null
            ? []
            : List<String>.from(json["product_pictures"]!.map((x) => x)),
        productName: json["product_name"],
        productCategory: json["product_category"],
        productDescription: json["product_description"],
        productPrice: json["product_price"],
        productSeen: json["product_seen"],
        productStatus: json["product_status"],
        productBrand: json["product_brand"],
        productCondition: json["product_condition"],
        productUnit: json["product_unit"],
        productWeight: json["product_weight"],
        productForm: json["product_form"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_pictures": productPictures == null
            ? []
            : List<dynamic>.from(productPictures!.map((x) => x)),
        "product_name": productName,
        "product_category": productCategory,
        "product_description": productDescription,
        "product_price": productPrice,
        "product_seen": productSeen,
        "product_status": productStatus,
        "product_brand": productBrand,
        "product_condition": productCondition,
        "product_unit": productUnit,
        "product_weight": productWeight,
        "product_form": productForm,
      };
}

class RelatedProduct {
  int? id;
  List<String>? productPictures;
  String? productName;
  int? productPrice;
  int? productSeen;

  RelatedProduct({
    this.id,
    this.productPictures,
    this.productName,
    this.productPrice,
    this.productSeen,
  });

  RelatedProduct copyWith({
    int? id,
    List<String>? productPictures,
    String? productName,
    int? productPrice,
    int? productSeen,
  }) =>
      RelatedProduct(
        id: id ?? this.id,
        productPictures: productPictures ?? this.productPictures,
        productName: productName ?? this.productName,
        productPrice: productPrice ?? this.productPrice,
        productSeen: productSeen ?? this.productSeen,
      );

  factory RelatedProduct.fromJson(Map<String, dynamic> json) => RelatedProduct(
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
