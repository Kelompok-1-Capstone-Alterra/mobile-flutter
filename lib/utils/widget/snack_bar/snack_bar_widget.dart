import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

SnackBar customSnackBar({
  required String text,
}) {
  return SnackBar(
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    content: Text(
      text,
      style: const TextStyle(color: error),
    ),
    backgroundColor: error[100],
    behavior: SnackBarBehavior.floating,
  );
}
