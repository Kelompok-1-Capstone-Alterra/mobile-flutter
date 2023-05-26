import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/widget/bottom_navbar/custom_navbar_provider.dart';
import 'package:mobile_flutter/view/dashboard/screen/artikel_cuaca_screen.dart';
import 'package:mobile_flutter/view/dashboard/screen/pilih_tambahkan_tanaman_screen.dart';
import 'package:mobile_flutter/view/settings/screens/settings_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../view_model/tanamanku_viewmodel/plant_gridview_provider.dart';
import '../widget/artikel_trending_widget.dart';
import '../widget/no_plant_card_widget.dart';
import '../widget/product_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  final double _horizontal = 20;
  // final double _vertical = 10;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: FloatingActionButton(
          heroTag: "fabDashboard",
          elevation: 10,
          backgroundColor: primary[300],
          onPressed: () {
            pushNewScreen(context,
                screen: const PilihTambahTanamanScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino);

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const PilihTambahTanamanScreen(),
            //   ),
            // );
          },
          child: Icon(
            Icons.add,
            size: 30,
            // weight: 3,
            color: neutral[10],
          ),
        ),
      ),
      body: ListView(
        // physics: BouncingScrollPhysics(),
        children: [
          // -----------header weather --------
          WeatherWidget(screenWidth: screenWidth, horizontal: _horizontal),

          const SizedBox(
            height: 15,
          ),

          Consumer<PlantGridviewProvider>(builder: (_, provider, __) {
            if (provider.data.isNotEmpty) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: _horizontal),
                child: Row(
                  children: [
                    Text(
                      "Tanamanku",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          }),

          TanamankuDasboardWidget(
              horizontal: _horizontal, screenWidth: screenWidth),

          // Consumer<DashboardProvider>(builder: (context, provider, child) {
          //   if (provider.isTanamankuEmpty) {
          //     // ----------------- card punya tanaman --------------------------
          //     return TanamankuDasboardWidget(
          //         horizontal: _horizontal, screenWidth: screenWidth);
          //   } else {
          //     // ----------------- card kamu belum punya tanaman --------------------------
          //     return NoPlantCardWidget(horizontal: _horizontal);
          //   }
          // }),

          // ------------- artikel trending ------------------
          TitleSections(horizontal: _horizontal, title: "Artikel Trending"),

          // ------------- artikel trending ------------------
          ArtikelWidget(horizontal: _horizontal),

          const SizedBox(
            height: 15,
          ),
          // ------------- artikel trending ------------------
          TitleSections(horizontal: _horizontal, title: "Produk"),

          ProductWidget(horizontal: _horizontal),

          SizedBox(
            height: screenHeight * 0.025,
          ),
        ],
      ),
    );
  }
}

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

class TanamankuDasboardItem extends StatelessWidget {
  const TanamankuDasboardItem({
    super.key,
    required this.screenWidth,
    required this.image,
    required this.namaTanaman,
    required this.lattinTanaman,
  });

  final String image;
  final String namaTanaman;
  final String lattinTanaman;

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.5,
                  child: AutoSizeText(
                    namaTanaman,
                    maxLines: 1,
                    minFontSize: 16,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: screenWidth * 0.5,
                  child: AutoSizeText(
                    lattinTanaman,
                    maxLines: 2,
                    minFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: neutral[40]),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.screenWidth,
    required double horizontal,
  }) : _horizontal = horizontal;

  final double screenWidth;
  final double _horizontal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: screenWidth,
          height: 210,
          child: SvgPicture.asset("assets/svg/Type=31.svg", fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // Colors.red,
                  Colors.transparent,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.black12.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                pushNewScreen(context,
                    screen: const ArtikelCuacaScreen(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.fade);
              },
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: _horizontal, vertical: screenWidth * 0.045),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // --------- nama dan kota---------
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.vertical,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.5,
                          child: AutoSizeText("Hi, Juna darendra",
                              maxLines: 2,
                              minFontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              FluentIcons.location_16_regular,
                              size: 23,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            SizedBox(
                              width: screenWidth * 0.5,
                              child: AutoSizeText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  minFontSize: 13,
                                  "Jakarta, Indonesia",
                                  style: Theme.of(context).textTheme.bodySmall),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // --------- icon lonceng dan setting---------
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            // context.read<DashboardProvider>().tanamankuEmpty();
                          },
                          icon: const Icon(
                            FluentIcons.alert_16_regular,
                            size: 30,
                          ),
                        ),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        IconButton(
                          onPressed: () {
                            pushNewScreen(context,
                                screen: const SettingsScreen(),
                                withNavBar: false);
                          },
                          icon: const Icon(
                            FluentIcons.settings_16_regular,
                            size: 30,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                // ------ suhu dan cuaca -----------
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    AutoSizeText(
                      "32°C",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          FluentIcons.weather_sunny_16_regular,
                          size: 25,
                          color: neutral[10],
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        AutoSizeText(
                          "Cerah",
                          minFontSize: 16,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: neutral[10]),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TitleSections extends StatelessWidget {
  const TitleSections({
    super.key,
    required double horizontal,
    required this.title,
  }) : _horizontal = horizontal;
  final String title;
  final double _horizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(primary.withOpacity(0.1)),
            ),
            onPressed: () {},
            child: Text(
              "Lihat Semua",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: primary[300]),
            ),
          ),
        ],
      ),
    );
  }
}
