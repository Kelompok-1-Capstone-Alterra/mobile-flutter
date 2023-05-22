import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_progress_screen.dart';

enum TipeProgress { mingguan, panen, mati }

class ProgressCard extends StatelessWidget {
  final String title;
  final String date;
  final TipeProgress type;

  const ProgressCard({
    super.key,
    required this.title,
    required this.date,
    required this.type,
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
                  child: Image.asset(
                    'assets/images/sample_tomat.png',
                    fit: BoxFit.cover,
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailProgresScreen(),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
