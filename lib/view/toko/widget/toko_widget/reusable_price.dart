import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ReuseablePrice extends StatelessWidget {
  const ReuseablePrice({super.key, required this.price});

  final double price;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            children: [
              WidgetSpan(
                child: AutoSizeText(
                  "Rp.${price.toStringAsFixed(0).replaceAllMapped(
                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]}.',
                      )}",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: error[300],
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
