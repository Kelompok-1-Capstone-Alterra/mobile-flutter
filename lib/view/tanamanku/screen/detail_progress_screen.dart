import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/app_constant.dart';
import 'package:mobile_flutter/utils/converter/convert_date.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/tanamanku/screen/edit_progress_mingguan_screen.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/detail_progress_card/kondisi_tanaman_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/detail_progress_card/pemupukan_detail_card.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/detail_progress_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/overview_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class DetailProgresScreen extends StatefulWidget {
  final int idTanaman;
  final int idProgress;
  const DetailProgresScreen(
      {super.key, this.idTanaman = 0, this.idProgress = 0});

  @override
  State<DetailProgresScreen> createState() => _DetailProgresScreenState();
}

class _DetailProgresScreenState extends State<DetailProgresScreen> {
  @override
  void initState() {
    super.initState();

    context
        .read<DetailProgressProvider>()
        .getProgresDetail(widget.idTanaman, widget.idProgress);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Consumer<DetailProgressProvider>(
          builder: (context, provider, _) {
            if (provider.state == MyState.initial) {
              return const SizedBox.shrink();
            } else if (provider.state == MyState.loading) {
              return const SizedBox.shrink();
            } else if (provider.state == MyState.loaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: FloatingActionButton.small(
                  elevation: 0,
                  backgroundColor: Colors.black12,
                  highlightElevation: 0,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: const CircleBorder(),
                  disabledElevation: 0,
                  onPressed: () {
                    provider.currentIndex = 0;
                    Navigator.pop(context);
                  },
                  child: Icon(
                    FluentIcons.chevron_left_16_regular,
                    size: 30,
                    color: neutral[10],
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        body: Consumer<DetailProgressProvider>(
          builder: (context, provider, _) {
            if (provider.state == MyState.initial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (provider.state == MyState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (provider.state == MyState.loaded) {
              final String fromMonth =
                  formatDateMMM(provider.getProgresDetailData.progress!.from!);

              final String toMonth =
                  formatDateMMM(provider.getProgresDetailData.progress!.to!);

              String fromFormat = '';

              if (fromMonth == toMonth) {
                fromFormat =
                    formatDatedd(provider.getProgresDetailData.progress!.from!);
              } else {
                fromFormat = formatDateddMMM(
                    provider.getProgresDetailData.progress!.to!);
              }

              final String toFormat = formatDateddMMMyyyy(
                  provider.getProgresDetailData.progress!.to!);
              return ListView(
                children: [
                  provider.imageList.isEmpty
                      ? Image.asset(
                          'assets/images/tanaman_default.png',
                          fit: BoxFit.cover,
                        )
                      : Stack(
                          children: [
                            CarouselSlider(
                              items: provider.imageList
                                  .map(
                                    (item) => Image.network(
                                      '${AppConstant.imgUrl}${item['image_path']}',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        width: double.infinity,
                                        color: neutral[20],
                                        child: const Icon(
                                            Icons.image_not_supported_outlined),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              carouselController: provider.carouselController,
                              options: CarouselOptions(
                                scrollPhysics: const BouncingScrollPhysics(),
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                aspectRatio: 2,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  provider.setCurrentIndex(index);
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: provider.imageList
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  return GestureDetector(
                                    onTap: () => provider.carouselController
                                        .animateToPage(entry.key),
                                    child: Container(
                                      width: 7,
                                      height: 7,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(3.5),
                                        color:
                                            provider.currentIndex == entry.key
                                                ? primary
                                                : neutral[10],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Minggu ke ${provider.getProgresDetailData.progress?.week}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        AutoSizeText(
                          "$fromFormat - $toFormat",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: neutral[50],
                                  ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Text('Kondisi Tanaman',
                            style: Theme.of(context).textTheme.labelLarge),
                        const SizedBox(
                          height: 14,
                        ),
                        KondisiTanamanCard(
                            title: provider
                                .getProgresDetailData.progress!.condition!),
                        const SizedBox(
                          height: 12,
                        ),
                        Card(
                          elevation: 15,
                          shadowColor: Colors.black26,
                          color: primary[100],
                          surfaceTintColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Column(
                              children: [
                                Text(
                                  'Progres Penyiraman',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Consumer<DetailProgressProvider>(
                                  builder: (context, provider, _) {
                                    return SizedBox(
                                      height: 50.0,
                                      child: Row(
                                        children: List.generate(7, (index) {
                                          int? wateringValue = provider
                                              .getProgresDetailData
                                              .watering!
                                              .history?[index];
                                          Color? color = wateringValue ==
                                                  context
                                                      .read<OverviewProvider>()
                                                      .getOverviewData
                                                      .watering
                                                      ?.period
                                              ? primary
                                              : neutral[40];
                                          return Expanded(
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: color,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                wateringValue ==
                                                        context
                                                            .read<
                                                                OverviewProvider>()
                                                            .getOverviewData
                                                            .watering
                                                            ?.period
                                                    ? FluentIcons
                                                        .checkmark_16_regular
                                                    : FluentIcons
                                                        .snooze_20_filled,
                                                color: neutral[10],
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        provider.getProgresDetailData.fertilizing != null
                            ? const PemupukanDetailCard()
                            : const SizedBox.shrink(),
                        const SizedBox(
                          height: 28,
                        ),
                        Text('Catatan Progres',
                            style: Theme.of(context).textTheme.labelLarge),
                        Text(
                          provider.getProgresDetailData.progress!.desc
                                      .toString() ==
                                  ''
                              ? '-'
                              : provider.getProgresDetailData.progress!.desc
                                  .toString(),
                        ),
                        const SizedBox(
                          height: 44,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            pushNewScreen(
                              context,
                              screen: const EditProgressMingguanScreen(),
                              withNavBar: false,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            backgroundColor: primary,
                            minimumSize: const Size(double.infinity,
                                0), // Mengatur minimumSize dengan double.infinity
                          ),
                          child: Text(
                            'Edit progres mingguan',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color: neutral[10],
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text("eror di else"),
              );
            }
          },
        ),
      ),
    );
  }
}
