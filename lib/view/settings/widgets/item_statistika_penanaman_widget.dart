import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class ItemStatistikaPenanamanWidget extends StatelessWidget {
  const ItemStatistikaPenanamanWidget({super.key, required this.label});
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black26,
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset('assets/images/penanaman_item.png'),
              label,
              // const LabelPanenWidget(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 5),
            child: Text(
              'Cabai Rawit',
              style: ThemeData().textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
            ),
            child: Text(
              'Solanum lycopersicum',
              style: ThemeData().textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: neutral[40],
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
