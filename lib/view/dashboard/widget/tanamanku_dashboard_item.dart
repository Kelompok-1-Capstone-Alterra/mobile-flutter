import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_constant.dart';
import '../../../utils/themes/custom_color.dart';

class TanamankuDasboardItem extends StatelessWidget {
  const TanamankuDasboardItem({
    super.key,
    required this.screenWidth,
    required this.image,
    required this.namaTanaman,
    required this.lattinTanaman,
  });

  final String image;
  final String namaTanaman;
  final String lattinTanaman;

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  "${AppConstant.imgUrl}$image",
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Shimmer.fromColors(
                      baseColor: neutral[30]!,
                      highlightColor: neutral[20]!,
                      child: Container(
                        height: 80,
                        width: 80,
                        color: neutral[20]!,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                      color: neutral[20],
                      child: const Icon(Icons.image_not_supported_outlined)),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.5,
                  child: AutoSizeText(
                    namaTanaman,
                    maxLines: 1,
                    minFontSize: 16,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: screenWidth * 0.5,
                  child: AutoSizeText(
                    lattinTanaman,
                    maxLines: 2,
                    minFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: neutral[40]),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class TanamankuDashboardItemLoading extends StatelessWidget {
  const TanamankuDashboardItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Shimmer.fromColors(
                baseColor: neutral[30]!,
                highlightColor: neutral[20]!,
                child: Container(
                  color: neutral[20]!,
                  height: 80,
                  width: 80,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: neutral[30]!,
                  highlightColor: neutral[20]!,
                  child: Container(
                    decoration: BoxDecoration(
                        color: neutral[20]!,
                        borderRadius: BorderRadius.circular(10)),
                    height: 10,
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Shimmer.fromColors(
                  baseColor: neutral[30]!,
                  highlightColor: neutral[20]!,
                  child: Container(
                    decoration: BoxDecoration(
                        color: neutral[20]!,
                        borderRadius: BorderRadius.circular(10)),
                    height: 10,
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
