import 'package:mobile_flutter/models/toko/get_product_by_id.dart';

class DummyProductByIdService {
  GetProductById getDummyData() {
    String getproductbyid = '''
   {
    "product": {
        "id": 17,
        "product_pictures": [
            "assets/images/toko_image/pestisida/pestisida1.png",
            "assets/images/toko_image/pestisida/pestisida2.png",
            "assets/images/toko_image/pestisida/pestisida1.png"
        ],
        "product_name": "Ini bibit",
        "product_category": "Bibit",
        "product_description": "General information about the product aselole jos",
        "product_price": 50000,
        "product_seen": 4,
        "product_status": false,
        "product_brand": "Infram",
        "product_condition": "Baru",
        "product_unit": 1,
        "product_weight": 500,
        "product_form": "Cair"
    },
    "related-products": null
}
    ''';

    return getProductByIdFromJson(getproductbyid);
  }
}
