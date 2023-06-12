import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/informasi/informasi_cara_menanam_screen.dart';
import 'package:mobile_flutter/view/informasi/informasi_penyiraman_screen.dart';
import 'package:mobile_flutter/view/informasi/informasi_temperature_screen.dart';
import 'package:mobile_flutter/view/informasi/lokasi_tanaman_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../../informasi/informasi_pemupukan_screen.dart';

enum InformasiType {
  caraMenanam,
  pemupukan,
  penyiraman,
  temperaturIdeal,
  spesifikCaraMenanam
}

enum CaraMenanamType { informasiCaraMenanam, spesifikCaraMenanam }

class InformasiTanamanCard extends StatefulWidget {
  final CaraMenanamType caraMenanamType;
  final int plantId;
  final String location;
  const InformasiTanamanCard({
    super.key,
    required this.caraMenanamType,
    this.plantId = 0,
    this.location = "",
  });

  @override
  State<InformasiTanamanCard> createState() => _InformasiTanamanCardState();
}

class _InformasiTanamanCardState extends State<InformasiTanamanCard> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Container 1
              gridItem(
                context,
                FluentIcons.tree_deciduous_20_regular,
                'Cara Menanam',
                widget.caraMenanamType == CaraMenanamType.informasiCaraMenanam
                    ? InformasiType.caraMenanam
                    : InformasiType.spesifikCaraMenanam,
              ),

              // Container 2
              gridItem(
                context,
                FluentIcons.food_grains_20_regular,
                'Pemupukan',
                InformasiType.pemupukan,
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Container 3
              gridItem(
                context,
                FluentIcons.drop_16_regular,
                'Penyiraman',
                InformasiType.penyiraman,
              ),

              // Container 4
              gridItem(
                context,
                FluentIcons.temperature_16_regular,
                'Temperatur Ideal',
                InformasiType.temperaturIdeal,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget gridItem(
      BuildContext context, IconData icon, String title, InformasiType type) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        IconButton(
          onPressed: () {
            switch (type) {
              case InformasiType.caraMenanam:
                {
                  pushNewScreen(
                    context,
                    screen: LokasiTanamanScreen(
                      type: ScreenType.informasiLokasi,
                      plantid: widget.plantId,
                    ),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                }
                break;
              case InformasiType.spesifikCaraMenanam:
                {
                  pushNewScreen(
                    context,
                    screen: InformasiCaraMenanamScreen(
                        plantId: widget.plantId, location: widget.location),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                }
                break;
              case InformasiType.pemupukan:
                {
                  pushNewScreen(
                    context,
                    screen: const InformasiPemupukanScreen(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                }
                break;
              case InformasiType.penyiraman:
                {
                  pushNewScreen(
                    context,
                    screen: const InformasiPenyiramanScreen(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                }
                break;
              case InformasiType.temperaturIdeal:
                {
                  pushNewScreen(
                    context,
                    screen: const InformasiTempIdealScreen(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                }
                break;
            }

            if (type == InformasiType.pemupukan) {}
            if (type == InformasiType.caraMenanam) {}
            if (type == InformasiType.temperaturIdeal) {}
            if (type == InformasiType.penyiraman) {}
          },
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(primary[400]),
          ),
          padding: EdgeInsets.all(screenWidth * 0.08),
          icon: Icon(
            icon,
            color: neutral[10],
            size: screenWidth * 0.08,
          ),
        ),
        SizedBox(
          height: screenWidth * 0.03,
        ),
        SizedBox(
          width: screenWidth * 0.35,
          height: screenWidth * 0.1,
          child: AutoSizeText(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
