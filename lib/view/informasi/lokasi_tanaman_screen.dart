import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/view/informasi/informasi_cara_menanam_screen.dart';
import 'package:mobile_flutter/view_model/service_provider/get_plant_location_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/app_constant.dart';
import '../../utils/themes/custom_color.dart';

enum ScreenType { informasiLokasi, pemilihanLokasi }

class LokasiTanamanScreen extends StatefulWidget {
  const LokasiTanamanScreen(
      {super.key, required this.type, required this.plantid});
  final ScreenType type;
  final int plantid;
  @override
  State<LokasiTanamanScreen> createState() => _LokasiTanamanScreenState();
}

class _LokasiTanamanScreenState extends State<LokasiTanamanScreen> {
  @override
  void initState() {
    context
        .read<GetPlantLocationProvider>()
        .getPlantingLocationData(widget.plantid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Lokasi Penanaman",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                FluentIcons.chevron_left_16_regular,
                size: 30,
              ),
            )),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Consumer<GetPlantLocationProvider>(builder: (ctx, provider, _) {
              if (provider.state == MyState.loading) {
                return ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) =>
                      const LokasiPenanamanWidgetLoading(),
                );
              } else if (provider.state == MyState.loaded) {
                if (provider.plantinglocation.isEmpty) {
                  return SizedBox(
                    height: 110,
                    child: Card(
                      margin: const EdgeInsets.all(0),
                      elevation: 15,
                      shadowColor: Colors.black26,
                      // shadowColor: const Color.fromARGB(40, 0, 0, 0),
                      color: Colors.white,
                      surfaceTintColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Center(
                          child: Text(
                            "Data Lokasi penanam belum tersedia",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: provider.plantinglocation.length,
                  itemBuilder: (context, index) => Stack(
                    children: [
                      LokasiPenanamanWidget(
                        locationId:
                            provider.plantinglocation[index].locationPlant!,
                        picture: provider.plantinglocation[index].picture!,
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              switch (widget.type) {
                                case ScreenType.informasiLokasi:
                                  {
                                    pushNewScreen(
                                      context,
                                      screen: InformasiCaraMenanamScreen(
                                          plantId: widget.plantid,
                                          location: provider
                                                      .plantinglocation[index]
                                                      .locationPlant! ==
                                                  1
                                              ? "container"
                                              : "ground"),
                                      withNavBar:
                                          false, // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino,
                                    );
                                  }
                                  break;
                                case ScreenType.pemilihanLokasi:
                                  {
                                    //select lokasi
                                  }
                                  break;
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text("Upss, something went error"),
                );
              }
            })));
  }
}

class LokasiPenanamanWidget extends StatelessWidget {
  const LokasiPenanamanWidget({
    super.key,
    required this.picture,
    required this.locationId,
  });

  final String picture;

  final int locationId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 0,
        shadowColor: Colors.black26,
        // shadowColor: const Color.fromARGB(40, 0, 0, 0),
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  "${AppConstant.imgUrl}$picture",
                  // image,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Shimmer.fromColors(
                      baseColor: neutral[30]!,
                      highlightColor: neutral[20]!,
                      child: Container(
                        height: 80,
                        width: 80,
                        color: neutral[20]!,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                      color: neutral[20],
                      child: const Icon(Icons.image_not_supported_outlined)),
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: SizedBox(
                    height: double.maxFinite,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Menanam",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 14,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          locationId == 1
                              ? "dengan pot / polybag"
                              : "tanpa pot",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: neutral[50],
                                  ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LokasiPenanamanWidgetLoading extends StatelessWidget {
  const LokasiPenanamanWidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 0,
        shadowColor: Colors.black26,
        // shadowColor: const Color.fromARGB(40, 0, 0, 0),
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: neutral[30]!,
                highlightColor: neutral[20]!,
                child: Container(
                  width: 80,
                  height: 80,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      color: neutral[20]!,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: SizedBox(
                    height: double.maxFinite,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: neutral[30]!,
                          highlightColor: neutral[20]!,
                          child: Container(
                            decoration: BoxDecoration(
                                color: neutral[20]!,
                                borderRadius: BorderRadius.circular(10)),
                            height: 10,
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Shimmer.fromColors(
                          baseColor: neutral[30]!,
                          highlightColor: neutral[20]!,
                          child: Container(
                            decoration: BoxDecoration(
                                color: neutral[20]!,
                                borderRadius: BorderRadius.circular(10)),
                            height: 10,
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
