import 'package:mobile_flutter/models/toko/get_product.dart';

class DummyApiService {
  GetProducts getDummyData() {
    String getproduct = '''
    {
        "fertilizers": [
            {
                "id": 14,
                "product_pictures": [
                    "assets/images/toko_image/pestisida/pestisida1.png"
                ],
                "product_name": "frertilizerss",
                "product_price": 50000,
                "product_seen": 5
            }
        ],
        "pesticides": [
            {
                "id": 15,
                "product_pictures": [
                    "assets/images/toko_image/pestisida/pestisida1.png"
                ],
                "product_name": "Ini Pestisida",
                "product_price": 50000,
                "product_seen": 2
            }
        ],
        "seeds": [
            {
                "id": 17,
                "product_pictures": [
                    "assets/images/toko_image/pestisida/pestisida1.png"
                ],
                "product_name": "Ini bibit",
                "product_price": 50000,
                "product_seen": 3
            },
            {
                "id": 18,
                "product_pictures": [
                    "assets/images/toko_image/pestisida/pestisida1.png"
                ],
                "product_name": "Bibit",
                "product_price": 50000,
                "product_seen": 0
            }
        ],
        "tools": [
            {
                "id": 16,
                "product_pictures": [
                    "assets/images/toko_image/pestisida/pestisida1.png"
                ],
                "product_name": "Ini Alat tani",
                "product_price": 50000,
                "product_seen": 0
            }
        ]
    }
    ''';

    return getProductsFromJson(getproduct);
  }
}
