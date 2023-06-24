import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view_model/service_provider/get_avalilable_plants_provider.dart';
import 'package:provider/provider.dart';
import '../../../utils/themes/custom_color.dart';
import '../widget/add_plant_gridview_widget.dart';

class PilihTambahTanamanScreen extends StatefulWidget {
  const PilihTambahTanamanScreen({super.key});

  @override
  State<PilihTambahTanamanScreen> createState() =>
      _PilihTambahTanamanScreenState();
}

const double _horizontalPadding = 20;

class _PilihTambahTanamanScreenState extends State<PilihTambahTanamanScreen> {
  @override
  void initState() {
    context.read<GetAvailablePlantsProvider>().getAvailablePlantsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          // leadingWidth: screenWidth * 0.1,
          title: AutoSizeText(
            "Tambahkan Tanaman",
            maxFontSize: 22,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          leading: IconButton(
            padding: const EdgeInsets.all(5),
            onPressed: () {
              //
              // ini untuk back dan clear lagi search nya
              //
              Navigator.pop(context);
              context.read<GetAvailablePlantsProvider>().clearSearch();
            },
            icon: const Icon(
              FluentIcons.chevron_left_16_regular,
              size: 30,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: _horizontalPadding, vertical: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 80,
              child: TextField(
                // textAlign: TextAlign.justify,
                textAlignVertical: TextAlignVertical.center,

                onSubmitted: (value) {
                  //cuma bisa search kalau availble plants kaga kosong
                  if (context
                      .read<GetAvailablePlantsProvider>()
                      .availablePlants
                      .isNotEmpty) {
                    context
                        .read<GetAvailablePlantsProvider>()
                        .searchAvailablePlants();
                  }
                },

                textInputAction: TextInputAction.search,
                maxLength: 30,
                controller: context
                    .read<GetAvailablePlantsProvider>()
                    .searchFieldController,

                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 18),
                  suffixIcon: IconButton(
                    splashRadius: 5,
                    splashColor: Colors.black.withOpacity(0.01),
                    highlightColor: Colors.black.withOpacity(0.05),
                    onPressed: () {
                      //
                      // clear text field kalau pencet icon X

                      context.read<GetAvailablePlantsProvider>().clearSearch();
                    },
                    icon: Icon(
                      Icons.close,
                      color: neutral[70],
                      size: 20,
                    ),
                  ),
                  hintText: 'Cari Tanaman',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: Icon(
                      FluentIcons.search_16_regular,
                      size: 30,
                    ),
                  ),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: neutral[40]),
                  focusColor: Theme.of(context).inputDecorationTheme.focusColor,
                  focusedBorder:
                      Theme.of(context).inputDecorationTheme.focusedBorder,
                  border: Theme.of(context).inputDecorationTheme.border,
                  disabledBorder:
                      Theme.of(context).inputDecorationTheme.disabledBorder,
                ),
                // InputDecoration(
                //   suffixIcon: IconButton(
                //     splashRadius: 5,
                //     splashColor: Colors.black.withOpacity(0.01),
                //     highlightColor: Colors.black.withOpacity(0.05),
                //     onPressed: () {
                //       //
                //       // clear text field kalau pencet icon X

                //       context.read<GetAvailablePlantsProvider>().clearSearch();
                //     },
                //     icon: const Icon(
                //       Icons.close,
                //       color: Colors.black,
                //       size: 20,
                //     ),
                //   ),
                //   hintText: 'Cari Tanaman',
                //   prefixIcon: const Icon(
                //     FluentIcons.search_16_regular,
                //   ),
                //   focusColor: Theme.of(context).inputDecorationTheme.focusColor,
                //   focusedBorder:
                //       Theme.of(context).inputDecorationTheme.focusedBorder,
                //   border: Theme.of(context).inputDecorationTheme.border,
                //   disabledBorder:
                //       Theme.of(context).inputDecorationTheme.disabledBorder,
                // ),
              ),
            ),
            const SizedBox(height: 10),
            AddPlantGridview(
                screenHeight: screenHeight, screenWidth: screenWidth),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
