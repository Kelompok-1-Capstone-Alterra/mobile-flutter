String tempOneDecimal(String temp) {
  double convert = double.parse(temp);

  return "${convert.toStringAsFixed(1)}°C";
}
