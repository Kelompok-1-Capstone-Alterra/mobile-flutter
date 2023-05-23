import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

import '../../../models/card_myplant_model.dart';

class CardMyPlantWidget extends StatelessWidget {
  const CardMyPlantWidget({super.key, required this.data});

  final CardMyPlantModel data;

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
            child: Image.asset(
              data.picture,
              width: double.maxFinite,
              fit: BoxFit.cover,
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
                      data.plantName,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 14,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.38,
                    child: AutoSizeText(
                      data.latinName,
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
