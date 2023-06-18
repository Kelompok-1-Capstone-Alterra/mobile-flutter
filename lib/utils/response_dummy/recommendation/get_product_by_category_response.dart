import 'package:mobile_flutter/models/toko/get_product_by_category.dart';

class DummyProductByCategoryService {
  GetProductsByCategory getDummyData() {
    String getProductByCategory = '''
    {
      "category": "Pupuk",
      "products": [
          {
              "id": 14,
              "product_pictures": [
                  "assets/images/toko_image/pestisida/pestisida1.png"
              ],
              "product_name": "fred",
              "product_price": 50000,
              "product_seen": 5
          }
      ]
    }
    ''';

    return getProductsByCategoryFromJson(getProductByCategory);
  }
}
