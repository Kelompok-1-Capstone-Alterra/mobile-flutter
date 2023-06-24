import 'package:intl/intl.dart';

NumberFormat numberFormat = NumberFormat("#,###", "en_US");

String convertPrice(int price) {
  return numberFormat.format(price);
}

String convertPrice2(int? price) {
  if (price == null) {
    return "Rp -";
  }

  String result = price.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]}.',
      );
  return "Rp $result";
}
