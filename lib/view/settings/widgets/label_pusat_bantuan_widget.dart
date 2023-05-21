import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:flutter/material.dart';

class LabelPusatBantuanWidget extends StatelessWidget {
  const LabelPusatBantuanWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: ThemeData().textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 9,
              color: neutral[10],
            ),
      ),
    );
  }
}
