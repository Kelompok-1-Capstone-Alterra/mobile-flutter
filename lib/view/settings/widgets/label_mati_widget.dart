import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:flutter/material.dart';

class LabelMatiWidget extends StatelessWidget {
  const LabelMatiWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
          right: 19,
        ),
        width: 56,
        height: 22,
        decoration: BoxDecoration(
          color: error[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Mati',
            style: ThemeData().textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: neutral[90],
                ),
          ),
        ),
      ),
    );
  }
}
