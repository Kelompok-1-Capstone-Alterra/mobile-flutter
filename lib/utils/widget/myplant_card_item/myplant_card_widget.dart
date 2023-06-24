import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:shimmer/shimmer.dart';

import '../../app_constant.dart';

class CardMyPlantWidget extends StatelessWidget {
  const CardMyPlantWidget({
    super.key,
    required this.picture,
    required this.plantName,
    required this.latinName,
  });

  final String picture;
  final String plantName;
  final String latinName;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 10,
      shadowColor: Colors.black26,
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
              // picture,
              "${AppConstant.imgUrl}$picture",
              // image,
              width: double.maxFinite,
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
                    width: double.maxFinite,
                    color: neutral[20]!,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => Container(
                  width: double.maxFinite,
                  color: neutral[20],
                  child: const Icon(Icons.image_not_supported_outlined)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Wrap(
                direction: Axis.vertical,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.38,
                    child: AutoSizeText(
                      plantName,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 14,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.38,
                    child: AutoSizeText(
                      latinName,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          overflow: TextOverflow.ellipsis, color: neutral[40]),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardMyPlantWidgetLoading extends StatelessWidget {
  const CardMyPlantWidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 10,
      shadowColor: Colors.black26,
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Shimmer.fromColors(
              baseColor: neutral[30]!,
              highlightColor: neutral[20]!,
              child: Container(
                width: double.maxFinite,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    color: neutral[20]!,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
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
                      width: MediaQuery.of(context).size.width * 0.1,
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
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
