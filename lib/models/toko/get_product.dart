import 'dart:convert';

GetProducts getProductsFromJson(String str) =>
    GetProducts.fromJson(json.decode(str));

String getProductsToJson(GetProducts data) => json.encode(data.toJson());

class GetProducts {
  List<Produk>? fertilizers;
  List<Produk>? pesticides;
  List<Produk>? seeds;
  List<Produk>? tools;

  GetProducts({
    this.fertilizers,
    this.pesticides,
    this.seeds,
    this.tools,
  });

  GetProducts copyWith({
    List<Produk>? fertilizers,
    List<Produk>? pesticides,
    List<Produk>? seeds,
    List<Produk>? tools,
  }) =>
      GetProducts(
        fertilizers: fertilizers ?? this.fertilizers,
        pesticides: pesticides ?? this.pesticides,
        seeds: seeds ?? this.seeds,
        tools: tools ?? this.tools,
      );

  factory GetProducts.fromJson(Map<String, dynamic> json) => GetProducts(
        fertilizers: json["fertilizers"] == null
            ? []
            : List<Produk>.from(
                json["fertilizers"].map((x) => Produk.fromJson(x))),
        pesticides: json["pesticides"] == null
            ? []
            : List<Produk>.from(
                json["pesticides"].map((x) => Produk.fromJson(x))),
        seeds: json["seeds"] == null
            ? []
            : List<Produk>.from(json["seeds"].map((x) => Produk.fromJson(x))),
        tools: json["tools"] == null
            ? []
            : List<Produk>.from(json["tools"].map((x) => Produk.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fertilizers": fertilizers == null
            ? []
            : List<dynamic>.from(fertilizers!.map((x) => x.toJson())),
        "pesticides": pesticides == null
            ? []
            : List<dynamic>.from(pesticides!.map((x) => x.toJson())),
        "seeds": seeds == null
            ? []
            : List<dynamic>.from(seeds!.map((x) => x.toJson())),
        "tools": tools == null
            ? []
            : List<dynamic>.from(tools!.map((x) => x.toJson())),
      };
}

class Produk {
  int? id;
  List<String>? productPictures;
  String? productName;
  int? productPrice;
  int? productSeen;
  String? category; // Tambahkan properti category

  Produk({
    this.id,
    this.productPictures,
    this.productName,
    this.productPrice,
    this.productSeen,
    this.category, // Tambahkan properti category pada constructor
  });

  Produk copyWith({
    int? id,
    List<String>? productPictures,
    String? productName,
    int? productPrice,
    int? productSeen,
  }) =>
      Produk(
        id: id ?? this.id,
        productPictures: productPictures ?? this.productPictures,
        productName: productName ?? this.productName,
        productPrice: productPrice ?? this.productPrice,
        productSeen: productSeen ?? this.productSeen,
      );

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
        id: json["id"],
        productPictures: json["product_pictures"] == null
            ? []
            : List<String>.from(json["product_pictures"].map((x) => x)),
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
