import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_flutter/view/informasi/informasi_tanaman_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../utils/state/finite_state.dart';
import '../../../utils/widget/myplant_card_item/myplant_card_widget.dart';
import '../../../view_model/service_provider/get_avalilable_plants_provider.dart';

class AddPlantGridview extends StatelessWidget {
  const AddPlantGridview({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Consumer<GetAvailablePlantsProvider>(
        builder: (context, provider, _) {
      // state loading
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
      // state loaded
      else if (provider.state == MyState.loaded) {
        //
        // kalau textfield kosong dan data availble tidak kosong
        if ((provider.searchFieldController.text.isEmpty ||
                provider.searchQuery == "") &&
            provider.availablePlants.isNotEmpty) {
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
            itemCount: provider.availablePlants.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  CardMyPlantWidget(
                    plantName: provider.availablePlants[index].name!,
                    latinName: provider.availablePlants[index].latin!,
                    picture: provider.availablePlants[index].picture!,
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        overlayColor: MaterialStatePropertyAll(
                            Colors.black.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          pushNewScreen(context,
                              screen: const InformasiTanamanScreen(plantId: 1),
                              withNavBar: false,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino);
                        },
                      ),
                    ),
                  )
                ],
              );
            },
          );
        }
        // kalau textfield terisi dan data di search tidak kosong
        // search data ga kosong
        else if (provider.searchedPlants.isNotEmpty &&
            provider.searchQuery.isNotEmpty) {
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
            itemCount: provider.searchedPlants.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  CardMyPlantWidget(
                    plantName: provider.availablePlants[index].name!,
                    latinName: provider.availablePlants[index].latin!,
                    picture: provider.availablePlants[index].picture!,
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        overlayColor: MaterialStatePropertyAll(
                            Colors.black.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          pushNewScreen(context,
                              screen: const InformasiTanamanScreen(plantId: 1),
                              withNavBar: false,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino);
                        },
                      ),
                    ),
                  )
                ],
              );
            },
          );
        }
        // state ga ketemu search nya
        else if (provider.searchedPlants.isEmpty &&
            provider.availablePlants.isNotEmpty &&
            provider.searchQuery.isNotEmpty) {
          return SizedBox(
            height: screenHeight * 0.65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.3,
                      child: SvgPicture.asset(
                          "assets/svg/tambah_tanaman_empty.svg",
                          fit: BoxFit.cover),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: AutoSizeText(
                        "Sepertinya tanaman '${provider.searchFieldController.text}' belum terdaftar",
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
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: RichText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              style: Theme.of(context).textTheme.bodySmall,
                              text: "Ingin tanamanmu ditambahkan?",
                            ),
                            TextSpan(
                              style: Theme.of(context).textTheme.labelMedium,
                              text: " klik disini",
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }
        // data benar-benar kosong
        else {
          return SizedBox(
            height: screenHeight * 0.65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.3,
                      child: SvgPicture.asset(
                          "assets/svg/empty_available_plants.svg",
                          fit: BoxFit.fitHeight),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: AutoSizeText(
                        "Maaf tanaman belum tersedia",
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

        // state error
      } else {
        return SizedBox(
          height: screenHeight * 0.65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.25,
                    child: SvgPicture.asset("assets/svg/cactus.svg",
                        fit: BoxFit.fitHeight),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: AutoSizeText(
                      "Upss, terjadi kesalahan",
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
    });
  }
}
