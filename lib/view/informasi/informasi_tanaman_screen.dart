import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_flutter/utils/converter/remove_html_tags.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/view/informasi/lokasi_tanaman_screen.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/informasi_tanaman_card.dart';
import 'package:mobile_flutter/view_model/service_provider/get_plant_details.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/app_constant.dart';
import '../../utils/themes/custom_color.dart';

enum TabPreview { overview, progress }

class InformasiTanamanScreen extends StatefulWidget {
  const InformasiTanamanScreen({super.key, required this.plantId});

  final int plantId;
  @override
  State<InformasiTanamanScreen> createState() => _InformasiTanamanScreenState();
}

ValueNotifier<TabPreview> tabActive = ValueNotifier(TabPreview.overview);

ValueNotifier<bool> readMore = ValueNotifier(false);

class _InformasiTanamanScreenState extends State<InformasiTanamanScreen> {
  @override
  void initState() {
    readMore.value = false;
    context
        .read<GetPlantDetailsProvider>()
        .getplantDetailsProvider(widget.plantId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: FloatingActionButton.small(
          heroTag: "asd",
          elevation: 0,
          backgroundColor: Colors.black12,
          highlightElevation: 0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const CircleBorder(),
          disabledElevation: 0,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            FluentIcons.chevron_left_16_regular,
            size: 30,
            color: neutral[10],
          ),
        ),
      ),
      body: Consumer<GetPlantDetailsProvider>(builder: (context, provider, _) {
        // loading state
        if (provider.state == MyState.loading) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: neutral[30]!,
                highlightColor: neutral[20]!,
                child: Container(
                  height: screenHeight * 0.31,
                  width: screenWidth,
                  color: neutral[20]!,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              UnconstrainedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Shimmer.fromColors(
                    baseColor: neutral[30]!,
                    highlightColor: neutral[20]!,
                    child: Container(
                      decoration: BoxDecoration(
                          color: neutral[20]!,
                          borderRadius: BorderRadius.circular(10)),
                      height: 15,
                      width: screenWidth * 0.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              UnconstrainedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Shimmer.fromColors(
                    baseColor: neutral[30]!,
                    highlightColor: neutral[20]!,
                    child: Container(
                      decoration: BoxDecoration(
                          color: neutral[20]!,
                          borderRadius: BorderRadius.circular(10)),
                      height: 10,
                      width: screenWidth * 0.25,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              UnconstrainedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Shimmer.fromColors(
                    baseColor: neutral[30]!,
                    highlightColor: neutral[20]!,
                    child: Container(
                      decoration: BoxDecoration(
                          color: neutral[20]!,
                          borderRadius: BorderRadius.circular(10)),
                      height: 10,
                      width: screenWidth * 0.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              UnconstrainedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Shimmer.fromColors(
                    baseColor: neutral[30]!,
                    highlightColor: neutral[20]!,
                    child: Container(
                      decoration: BoxDecoration(
                          color: neutral[20]!,
                          borderRadius: BorderRadius.circular(10)),
                      height: 10,
                      width: screenWidth * 0.6,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              UnconstrainedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Shimmer.fromColors(
                    baseColor: neutral[30]!,
                    highlightColor: neutral[20]!,
                    child: Container(
                      decoration: BoxDecoration(
                          color: neutral[20]!,
                          borderRadius: BorderRadius.circular(10)),
                      height: 10,
                      width: screenWidth * 0.7,
                    ),
                  ),
                ),
              ),
            ],
          );
          // loaded state
        } else if (provider.state == MyState.loaded) {
          return ListView(
            shrinkWrap: true,
            children: [
              // --------------------------image header--------------------------
              SizedBox(
                height: screenHeight * 0.3,
                child: Image.network(
                  "${AppConstant.imgUrl}${provider.plantDetails!.picture}",
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
                        width: double.maxFinite,
                        height: screenHeight * 0.30,
                        color: neutral[20]!,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                      width: double.maxFinite,
                      height: screenHeight * 0.3,
                      color: neutral[20],
                      child: const Icon(Icons.image_not_supported_outlined)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              // -------------------------- judul dan nama latin --------------------------
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      provider.plantDetails!.name ?? "-",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      provider.plantDetails!.latin ?? "-",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: neutral[40]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              // -------------------------- deskripsi --------------------------
              ValueListenableBuilder(
                  valueListenable: readMore,
                  builder: (context, bool readMoreValue, _) {
                    if (readMoreValue == false) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Wrap(
                          direction: Axis.vertical,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.9,
                              child: Text(
                                parseHtmlString(
                                  provider.plantDetails!.description ?? "-",
                                ),
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () {
                                readMore.value = !readMore.value;
                              },
                              child: Text("Baca Selengkapnya",
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Html(
                          data: provider.plantDetails!.description ?? "-",
                          style: {
                            'p': Style(
                              textAlign: TextAlign.justify,
                            ),
                            '#': Style(
                              margin: Margins.symmetric(horizontal: 0),
                              padding: const EdgeInsets.only(bottom: 10),
                            )
                          },
                        ),
                      );
                    }
                  }),

              const SizedBox(
                height: 10,
              ),
              // -------------------------- 4 grid button --------------------------
              InformasiTanamanCard(
                  caraMenanamType: CaraMenanamType.informasiCaraMenanam,
                  plantId: widget.plantId),

              //---------------- button tambkan tanaman -----------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    pushNewScreen(context,
                        screen: LokasiTanamanScreen(
                            type: ScreenType.pemilihanLokasi,
                            plantid: widget.plantId),
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                        withNavBar: true);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const LokasiTanamanScreen(),
                    //     ));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: primary,
                    minimumSize: const Size(double.infinity, 0),
                    // Mengatur minimumSize dengan double.infinity
                  ),
                  child: Text(
                    'Tambahkan Tanaman',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: neutral[10],
                        ),
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              )
            ],
          );
        } else {
          return Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              children: [
                Icon(
                  Icons.sentiment_dissatisfied_outlined,
                  size: 30,
                  color: neutral[40]!,
                ),
                Text(
                  "Something went wrong",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: neutral[50]!,
                      ),
                ),
                TextButton(
                    onPressed: () {
                      // context.read<GetWeatherProvider>().getWeatherData();
                    },
                    child: Text(
                      "Try Again?",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: neutral[70]!,
                          ),
                    ))
              ],
            ),
          );
        }
      }),
    );
  }
}
