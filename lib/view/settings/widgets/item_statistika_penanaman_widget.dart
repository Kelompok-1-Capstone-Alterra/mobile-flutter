import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/plant_stats_model.dart';
import 'package:mobile_flutter/utils/app_constant.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/settings/screens/detail_item_statistika_penanaman.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ItemStatistikaPenanamanWidget extends StatelessWidget {
  const ItemStatistikaPenanamanWidget({
    super.key,
    required this.index,
    required this.plantStatsModel,
  });
  final int index;
  final PlantStatsModel plantStatsModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushNewScreen(
          context,
          screen: DetailItemStatistikPenanaman(
            index: index,
            myplantId: plantStatsModel.myplantId!,
            plantStatsModel: plantStatsModel,
            picture: plantStatsModel.pictures![0].url!,
          ),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Card(
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
                Image.network(
                  // ' ${AppConstant.imgUrl}${plantStatsModel.picture}',
                  '${AppConstant.imgUrl}${plantStatsModel.pictures![0].url!}',
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: neutral[20],
                    width: double.infinity,
                    height: 120,
                    child: const Icon(Icons.image_not_supported_outlined),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      right: 12,
                    ),
                    width: 56,
                    height: 22,
                    decoration: BoxDecoration(
                      color: plantStatsModel.status == 'harvest'
                          ? primary[200]
                          : error[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        plantStatsModel.status == 'harvest' ? 'Panen' : 'Mati',
                        style: ThemeData().textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: neutral[90],
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 12,
                right: 10,
              ),
              child: Text(
                plantStatsModel.name!,
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
                left: 12,
                right: 10,
              ),
              child: Text(
                plantStatsModel.latin!,
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
      ),
    );
  }
}
