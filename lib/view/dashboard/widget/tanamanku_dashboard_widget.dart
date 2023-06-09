import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/view/dashboard/widget/tanamanku_dashboard_item.dart';
import 'package:mobile_flutter/view_model/service_provider/get_my_plants_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/themes/custom_color.dart';
import '../../../utils/widget/bottom_navbar/custom_navbar_provider.dart';
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
    return Consumer<GetMyPlantsProvider>(builder: (context, provider, __) {
      // --------------kalau loading--------------
      if (provider.state == MyState.loading) {
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
                itemBuilder: (context, index) =>
                    const TanamankuDashboardItemLoading(),
                itemCount: 3,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
              ),
            ),
          ),
        );
      }

      // --------------kalau loaded--------------

      else if (provider.state == MyState.loaded) {
        if (provider.myPlants.isEmpty) {
          // --------------kalau data nya kosong--------------
          return NoPlantCardWidget(horizontal: _horizontal);
        } else if (provider.myPlants.length >= 3) {
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
                              image: provider.myPlants[index].picture!,
                              lattinTanaman: provider.myPlants[index].latin!,
                              namaTanaman: provider.myPlants[index].name!),
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
                          image: provider.myPlants[index].picture!,
                          lattinTanaman: provider.myPlants[index].latin!,
                          namaTanaman: provider.myPlants[index].name!),
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
                  itemCount: provider.myPlants.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                ),
              ),
            ),
          );
        }
      }

      // --------------kalau failed--------------
      else {
        return Container(
          height: 128,
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: EdgeInsets.symmetric(horizontal: _horizontal),
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
            color: Colors.white,
            elevation: 15,
            shadowColor: Colors.black26,
            // shadowColor: const Color.fromARGB(40, 0, 0, 0),
            surfaceTintColor: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            child: Center(
              child: Text(
                "Something went wrong ☹",
                style: TextStyle(color: neutral[40]),
              ),
            ),
          ),
        );
      }
    });
  }
}
