import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/app_constant.dart';
import 'package:mobile_flutter/utils/converter/convert_date.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/detail_progress_provider.dart';
import 'package:provider/provider.dart';

class DetailMatiScreen extends StatefulWidget {
  final int idTanaman;
  final int idProgress;
  const DetailMatiScreen({super.key, this.idTanaman = 0, this.idProgress = 0});

  @override
  State<DetailMatiScreen> createState() => _DetailMatiScreenState();
}

class _DetailMatiScreenState extends State<DetailMatiScreen> {
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
              return ListView(
                children: [
                  provider.imageList.isEmpty
                      ? Image.asset(
                          'assets/images/tanaman_default.png',
                          height: MediaQuery.of(context).size.height * 0.35,
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
                                    MediaQuery.of(context).size.height * 0.35,
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
                          'Tanaman Mati',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          formatDateddMMMyyyy(
                                  provider.getProgresDetailData.progress!.from!)
                              .toString()
                              .toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: neutral[40]),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Text('Penyebab',
                            style: Theme.of(context).textTheme.labelLarge),
                        Text(provider.getProgresDetailData.progress!.condition
                            .toString()),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Alasan tanaman mati',
                            style: Theme.of(context).textTheme.labelLarge),
                        Text(
                          provider.getProgresDetailData.progress!.desc
                                      .toString() ==
                                  ''
                              ? '-'
                              : provider.getProgresDetailData.progress!.desc
                                  .toString(),
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
