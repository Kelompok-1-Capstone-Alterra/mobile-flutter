import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/routes.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../utils/themes/custom_color.dart';
import '../../../utils/widget/myplant_card_item/myplant_card_widget.dart';
import '../../../view_model/tanamanku_viewmodel/plant_gridview_provider.dart';
import '../screen/detail_tanaman_screen.dart';

class MyPlantGridviewWidget extends StatelessWidget {
  const MyPlantGridviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantGridviewProvider>(
      builder: (context, provider, _) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 6 / 7,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: provider.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                CardMyPlantWidget(
                  data: provider.data[index],
                ),
                Positioned.fill(
                  child: AnimatedOpacity(
                    opacity: provider.data[index].isSelected ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOutQuint,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: primary[500],
                        // color: Colors.transparent,
                      ),
                      child: AnimatedScale(
                        scale: provider.data[index].isSelected ? 1 : 0,
                        duration: const Duration(milliseconds: 1200),
                        curve: Curves.elasticInOut,
                        child: const Center(
                          child: Icon(
                            FluentIcons.checkmark_circle_24_regular,
                            size: 40,
                            color: Colors.white,
                            // color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      overlayColor: MaterialStatePropertyAll(
                          Colors.black.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        if (provider.isDeleteMode == true) {
                          provider.onSelectedCard(
                              selectStatus: provider.data[index].isSelected,
                              indexSelected: index);
                        } else {
                          // pushNewScreen(context,
                          //     screen: const DetailTanamanScreen(),
                          //     withNavBar: true,
                          //     pageTransitionAnimation:
                          //         PageTransitionAnimation.cupertino);

                          pushNewScreenWithRouteSettings(
                            context,
                            settings: const RouteSettings(
                                name: Routes.detailTanamankuPage),
                            screen: const DetailTanamanScreen(idTanaman: 2),
                            withNavBar: true,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const DetailTanamanScreen(),
                          //   ),
                          // );
                        }
                      },
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
