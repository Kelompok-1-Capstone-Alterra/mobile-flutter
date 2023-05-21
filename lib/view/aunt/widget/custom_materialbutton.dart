import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/utils/themes/theme.dart';

class CustomMaterialButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? minWidth;

  const CustomMaterialButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: primary,
      //padding: EdgeInsets.all(16.0),
      minWidth: minWidth,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.0))),
      height: 50,
      child: Text(
        text,
        style: agriplantLight.textTheme.labelLarge!
            .copyWith(fontSize: 14, color: neutral[10]!),
      ),
    );
  }
}
