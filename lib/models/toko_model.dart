class BaseModel {
  final int id;
  final String imageUrl;
  final String name;
  final double price;
  final double review;
  final double star;
  final String simpleDeskripsi;
  final String deskripsi;

  BaseModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.review,
    required this.star,
    required this.simpleDeskripsi,
    required this.deskripsi,
  });
}

class Crousel {
  final int id;
  final String imageUrl;

  Crousel({
    required this.id,
    required this.imageUrl,
  });
}

class Category {
  final int id;
  final String imageUrl;
  final String name;

  Category({
    required this.id,
    required this.imageUrl,
    required this.name,
  });
}
