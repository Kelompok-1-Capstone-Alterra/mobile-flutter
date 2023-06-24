import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/view_model/service_provider/get_my_plants_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../utils/themes/custom_color.dart';
import '../../../utils/widget/myplant_card_item/myplant_card_widget.dart';
import '../screen/detail_tanaman_screen.dart';
import 'empty_myplant_widget.dart';

class MyPlantGridviewWidget extends StatelessWidget {
  const MyPlantGridviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<GetMyPlantsProvider>(
      builder: (context, provider, _) {
        if (provider.state == MyState.loading) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 15),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 6 / 7,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return const CardMyPlantWidgetLoading();
            },
          );
        }

        // kalau text field kosong dan data list my plants tidak kosong
        if ((provider.searchFieldController.text.toLowerCase().isEmpty ||
                provider.searchQuery == "") &&
            provider.myPlants.isNotEmpty) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 6 / 7,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: provider.showDataPlants.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  // const CardMyPlantWidgetLoading(),
                  CardMyPlantWidget(
                    plantName: provider.showDataPlants[index].name!,
                    latinName: provider.showDataPlants[index].latin!,
                    picture: provider.showDataPlants[index].picture!,
                  ),
                  Positioned.fill(
                    child: AnimatedOpacity(
                      opacity: provider.myPlants[index].isSelected ? 1 : 0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOutQuint,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: primary[500],
                          // color: Colors.transparent,
                        ),
                        child: AnimatedScale(
                          scale: provider.myPlants[index].isSelected ? 1 : 0,
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
                                selectStatus:
                                    provider.showDataPlants[index].isSelected,
                                indexSelected: index);
                          } else {
                            pushNewScreen(context,
                                screen: DetailTanamanScreen(
                                  idTanaman:
                                      provider.showDataPlants[index].myplantId!,
                                  idDetailTanaman:
                                      provider.showDataPlants[index].plantId!,
                                  location:
                                      provider.showDataPlants[index].location!,
                                ),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino);
                          }
                        },
                      ),
                    ),
                  )
                ],
              );
            },
          );
        }
//
        // kalau data di dalam showData ga kosong
        else if (provider.showDataPlants.isNotEmpty) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 6 / 7,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: provider.showDataPlants.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  // const CardMyPlantWidgetLoading(),
                  CardMyPlantWidget(
                    plantName: provider.showDataPlants[index].name!,
                    latinName: provider.showDataPlants[index].latin!,
                    picture: provider.showDataPlants[index].picture!,
                  ),
                  Positioned.fill(
                    child: AnimatedOpacity(
                      opacity: provider.myPlants[index].isSelected ? 1 : 0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOutQuint,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: primary[500],
                          // color: Colors.transparent,
                        ),
                        child: AnimatedScale(
                          scale: provider.myPlants[index].isSelected ? 1 : 0,
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
                                selectStatus:
                                    provider.showDataPlants[index].isSelected,
                                indexSelected: index);
                          } else {
                            pushNewScreen(context,
                                // screen: DetailTanamanScreen(
                                //     idTanaman: provider
                                //         .showDataPlants[index].myplantId!),

                                // ini dummy id cuma lempar 1
                                screen: const DetailTanamanScreen(idTanaman: 1),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino);

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
        }
        //
        // kalau data di dalam showData kosong (tidak ketemu pencariannya)
        // (provider.showData.isEmpty && provider.myPlants.isNotEmpty)
        else if (provider.showDataPlants.isEmpty &&
            provider.myPlants.isNotEmpty) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: SvgPicture.asset(
                          "assets/svg/tambah_tanaman_empty.svg",
                          fit: BoxFit.cover),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: AutoSizeText(
                        "Tidak dapat menemukan tanaman '${provider.searchFieldController.text}'",
                        minFontSize: 14,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                )
              ],
            ),
          );
        }
        // kalau semua kosong
        else {
          return const EmptyMyPlantWidget();
        }
      },
    );
  }
}
