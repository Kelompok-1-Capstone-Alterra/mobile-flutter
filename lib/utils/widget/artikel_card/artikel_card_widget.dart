import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../app_constant.dart';
import '../../converter/convert_date.dart';
import '../../themes/custom_color.dart';

class ArtikelCardWidget extends StatelessWidget {
  const ArtikelCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.time,
  });
  final String image;
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 15,
        shadowColor: Colors.black26,
        // shadowColor: const Color.fromARGB(40, 0, 0, 0),
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  "${AppConstant.imgUrl}$image",
                  // image,
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
              const SizedBox(width: 13),
              Expanded(
                child: SizedBox(
                    height: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              title,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              minFontSize: 14,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              FluentIcons.clock_16_regular,
                              color: neutral[50],
                              size: 14,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              convertToRelativeTime(time),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: neutral[50],
                                  ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArtikelCardWidgetLoading extends StatelessWidget {
  const ArtikelCardWidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 15,
        shadowColor: Colors.black26,
        // shadowColor: const Color.fromARGB(40, 0, 0, 0),
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: neutral[30]!,
                highlightColor: neutral[20]!,
                child: Container(
                  width: 80,
                  height: 80,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      color: neutral[20]!,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: SizedBox(
                    height: double.maxFinite,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
