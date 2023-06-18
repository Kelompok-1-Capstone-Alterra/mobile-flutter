import 'package:intl/intl.dart';

String formatDateMMMdyyyy(String dateStr) {
  DateTime date = DateTime.parse(dateStr);
  String formattedDate = DateFormat("MMM d, yyyy").format(date);
  return formattedDate;
}

String formatDatedd(String dateStr) {
  DateTime date = DateFormat("dd-MM-yyyy").parse(dateStr);
  String formattedDate = DateFormat("dd").format(date);
  return formattedDate;
}

String formatDateMMM(String dateStr) {
  DateTime date = DateFormat("dd-MM-yyyy").parse(dateStr);
  String formattedDate = DateFormat("MMM").format(date);
  return formattedDate;
}

String formatDateddMMM(String dateStr) {
  DateTime date = DateFormat("dd-MM-yyyy").parse(dateStr);
  String formattedDate = DateFormat("dd MMM").format(date);
  return formattedDate;
}

String formatDateddMMMyyyy(String dateStr) {
  DateTime date = DateFormat("dd-MM-yyyy").parse(dateStr);
  String formattedDate = DateFormat("dd MMM yyyy").format(date);
  return formattedDate;
}
