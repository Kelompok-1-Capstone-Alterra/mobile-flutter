import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/dashboard/widget/tanamanku_dashboard_item.dart';
import 'package:provider/provider.dart';

import '../../../utils/themes/custom_color.dart';
import '../../../utils/widget/bottom_navbar/custom_navbar_provider.dart';
import '../../../view_model/tanamanku_viewmodel/plant_gridview_provider.dart';
import 'no_plant_card_widget.dart';

class TanamankuDasboardWidget extends StatelessWidget {
  const TanamankuDasboardWidget({
    super.key,
    required double horizontal,
    required this.screenWidth,
  }) : _horizontal = horizontal;

  final double _horizontal;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantGridviewProvider>(builder: (_, provider, __) {
      if (provider.data.isEmpty) {
        // --------------kalau data nya kosong--------------
        return NoPlantCardWidget(horizontal: _horizontal);
      } else if (provider.data.length >= 3) {
        // --------------kalau data nya besar dari 3 agar muncul tombol tampilkan semua--------------
        return Container(
          margin: const EdgeInsets.only(top: 5, bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: _horizontal),
          child: Card(
            elevation: 15,
            shadowColor: Colors.black26,
            color: Colors.white,
            // color: Colors.green,
            surfaceTintColor: Colors.transparent,
            margin: const EdgeInsets.all(0),
            child: Container(
              // color: Colors.blue,
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              child: Column(
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        TanamankuDasboardItem(
                            screenWidth: screenWidth,
                            image: provider.data[index].picture,
                            lattinTanaman: provider.data[index].latinName,
                            namaTanaman: provider.data[index].plantName),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                    itemCount: 3,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 40,
                    child: Center(
                      child: TextButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStatePropertyAll(
                                primary.withOpacity(0.1)),
                          ),
                          onPressed: () {
                            context
                                .read<CustomNavbarProvider>()
                                .controller
                                .jumpToTab(1);
                          },
                          child: Text(
                            "Lihat semua",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: primary),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      } else {
        // --------------kalau data nya besar kurang dari 3 jadi ga ada tombol tampilkan semua--------------
        return Container(
          margin: const EdgeInsets.only(top: 5, bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: _horizontal),
          child: Card(
            elevation: 15,
            shadowColor: Colors.black26,
            color: Colors.white,
            // color: Colors.green,
            surfaceTintColor: Colors.transparent,
            margin: const EdgeInsets.all(0),
            child: Container(
              // color: Colors.blue,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                itemBuilder: (context, index) => Stack(
                  children: [
                    TanamankuDasboardItem(
                        screenWidth: screenWidth,
                        image: provider.data[index].picture,
                        lattinTanaman: provider.data[index].latinName,
                        namaTanaman: provider.data[index].plantName),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                        ),
                      ),
                    )
                  ],
                ),
                itemCount: provider.data.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
