String seenCounter(int seenCounter) {
  if (seenCounter < 1000) {
    return "$seenCounter Dilihat";
  } else {
    double result = seenCounter.toDouble() / 1000;

    return "${result.toStringAsFixed(1)}RB Dilihat";
  }
}
