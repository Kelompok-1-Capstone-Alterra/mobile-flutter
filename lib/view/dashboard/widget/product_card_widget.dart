import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/themes/custom_color.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 15,

      shadowColor: Colors.black26,
      // shadowColor: const Color.fromARGB(40, 0, 0, 0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          SizedBox(
            width: 150,
            child: Image.asset(
              "assets/images/sample_tomat.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                SizedBox(
                  width: 130,
                  child: AutoSizeText(
                    "Benih Sayuran Sawi",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 13,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 130,
                  child: AutoSizeText(
                    "Rp 55.000",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductCardWidgetloading extends StatelessWidget {
  const ProductCardWidgetloading({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 15,

      shadowColor: Colors.black26,
      // shadowColor: const Color.fromARGB(40, 0, 0, 0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: neutral[30]!,
            highlightColor: neutral[20]!,
            child: Container(
              width: 130,
              height: 100,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  color: neutral[20]!, borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Shimmer.fromColors(
                  baseColor: neutral[30]!,
                  highlightColor: neutral[20]!,
                  child: Container(
                    decoration: BoxDecoration(
                        color: neutral[20]!,
                        borderRadius: BorderRadius.circular(10)),
                    height: 10,
                    width: 40,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Shimmer.fromColors(
                  baseColor: neutral[30]!,
                  highlightColor: neutral[20]!,
                  child: Container(
                    decoration: BoxDecoration(
                        color: neutral[20]!,
                        borderRadius: BorderRadius.circular(10)),
                    height: 10,
                    width: 70,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
