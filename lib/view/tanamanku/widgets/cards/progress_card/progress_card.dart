import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/app_constant.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

enum TipeProgress { mingguan, panen, mati }

class ProgressCard extends StatelessWidget {
  final String title;
  final String picture;
  final String date;
  final TipeProgress? type;
  final VoidCallback onTap;

  const ProgressCard({
    super.key,
    required this.title,
    required this.date,
    required this.picture,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.all(0),
          elevation: 15,
          shadowColor: Colors.black26,
          color: type == TipeProgress.mingguan
              ? success[100]
              : type == TipeProgress.panen
                  ? success[200]
                  : type == TipeProgress.mati
                      ? error[200]
                      : neutral[10],
          surfaceTintColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      color: neutral[40],
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.network(
                    '${AppConstant.imgUrl}$picture',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 60,
                      width: 60,
                      color: neutral[20],
                      child: const Icon(Icons.image_not_supported_outlined),
                    ),
                  ),
                ),
                const SizedBox(width: 36),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AutoSizeText(
                        date,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: onTap,
            ),
          ),
        )
      ],
    );
  }
}
