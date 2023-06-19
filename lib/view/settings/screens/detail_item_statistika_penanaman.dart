import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/plant_stats_model.dart';
import 'package:mobile_flutter/utils/converter/convert_date.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_mati_screen.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_panen_screen.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_progress_screen.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/progress_card/no_progress_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/progress_card/progress_card.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/progres_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class DetailItemStatistikPenanaman extends StatefulWidget {
  const DetailItemStatistikPenanaman({
    super.key,
    required this.index,
    required this.plantStatsModel,
    this.myplantId = 0,
  });
  final int index;
  final int myplantId;
  final PlantStatsModel plantStatsModel;

  @override
  State<DetailItemStatistikPenanaman> createState() =>
      _DetailItemStatistikPenanamanState();
}

class _DetailItemStatistikPenanamanState
    extends State<DetailItemStatistikPenanaman> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProgresProvider>().getProgres(widget.myplantId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: FloatingActionButton.small(
            heroTag: "backDetailScreen",
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/sample_tomat.png',
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.plantStatsModel.name ?? 'Tomat',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      widget.plantStatsModel.latin ?? 'Solanum lycopersicum',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: neutral[40]),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      'Riwayat Tanamanmu',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 22,
                    ),

                    Consumer<ProgresProvider>(
                      builder: (context, provider, _) {
                        if (provider.state == MyState.initial) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                              const Center(child: CircularProgressIndicator()),
                            ],
                          );
                        } else if (provider.state == MyState.loading) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                              const Center(child: CircularProgressIndicator()),
                            ],
                          );
                        } else if (provider.state == MyState.loaded) {
                          return Column(
                            children: [
                              provider.weeklyProgressList.isNotEmpty
                                  ? Column(
                                      children: provider
                                          .weeklyProgressList.reversed
                                          .map((progress) {
                                        final String fromMonth =
                                            formatDateMMM(progress.from!);

                                        final String toMonth =
                                            formatDateMMM(progress.to!);

                                        String fromFormat = '';

                                        if (fromMonth == toMonth) {
                                          fromFormat =
                                              formatDatedd(progress.from!);
                                        } else {
                                          fromFormat =
                                              formatDateddMMM(progress.to!);
                                        }

                                        final String toFormat =
                                            formatDateddMMMyyyy(progress.to!);
                                        return Column(
                                          children: [
                                            ProgressCard(
                                              title: progress.status ==
                                                      'planting'
                                                  ? 'Minggu ke ${progress.week}'
                                                  : progress.status == 'harvest'
                                                      ? 'Sudah Panen'
                                                      : progress.status ==
                                                              'dead'
                                                          ? 'Tanaman Mati'
                                                          : '',
                                              date: progress.status ==
                                                      'planting'
                                                  ? '$fromFormat - $toFormat'
                                                  : progress.status ==
                                                              'harvest' ||
                                                          progress.status ==
                                                              'dead'
                                                      ? formatDateddMMMyyyy(
                                                          progress.from!)
                                                      : 'null',
                                              type: progress.status ==
                                                      'planting'
                                                  ? TipeProgress.mingguan
                                                  : progress.status == 'harvest'
                                                      ? TipeProgress.panen
                                                      : progress.status ==
                                                              'dead'
                                                          ? TipeProgress.mati
                                                          : null,
                                              onTap: () {
                                                pushNewScreen(
                                                  context,
                                                  screen: progress.status ==
                                                          'planting'
                                                      ? DetailProgresScreen(
                                                          idTanaman:
                                                              widget.myplantId,
                                                          idProgress: progress
                                                              .weeklyProgressId!,
                                                        )
                                                      : progress.status ==
                                                              'harvest'
                                                          ? const DetailPanenScreen()
                                                          : progress.status ==
                                                                  'dead'
                                                              ? DetailMatiScreen(
                                                                  idTanaman: widget
                                                                      .myplantId,
                                                                  idProgress:
                                                                      progress
                                                                          .weeklyProgressId!,
                                                                )
                                                              : const SizedBox(),
                                                  withNavBar: false,
                                                  pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                );
                                              },
                                            ),
                                            const SizedBox(height: 13),
                                          ],
                                        );
                                      }).toList(),
                                    )
                                  : const NoProgressCard(),
                              const SizedBox(
                                height: 13,
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.vertical,
                              children: [
                                Icon(
                                  Icons.error,
                                  size: 40,
                                  color: neutral[40]!,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Terjadi kesalahan.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: neutral[50]!,
                                      ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    provider.getProgres(widget.myplantId);
                                  },
                                  child: Text(
                                    "Coba Lagi?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: neutral[70]!,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),

                    //! dummy
                    // Column(
                    //   children: [
                    //     ProgressCard(
                    //       title: 'Sudah Panen',
                    //       date: '24 Mei 2023',
                    //       type: TipeProgress.panen,
                    //       onTap: () {
                    //         pushNewScreen(
                    //           context,
                    //           screen: const DetailPanenScreen(),
                    //           withNavBar: true,
                    //           pageTransitionAnimation:
                    //               PageTransitionAnimation.cupertino,
                    //         );
                    //       },
                    //     ),
                    //     const SizedBox(
                    //       height: 13,
                    //     ),
                    //     ProgressCard(
                    //       title: 'Tanaman Mati',
                    //       date: '24 May 2023',
                    //       type: TipeProgress.mati,
                    //       onTap: () {
                    //         pushNewScreen(
                    //           context,
                    //           screen: const DetailMatiScreen(),
                    //           withNavBar: true,
                    //           pageTransitionAnimation:
                    //               PageTransitionAnimation.cupertino,
                    //         );
                    //       },
                    //     ),
                    //     const SizedBox(
                    //       height: 13,
                    //     ),
                    //     ProgressCard(
                    //       title: 'Minggu ke 2',
                    //       date: '11 - 20 May 2023',
                    //       type: TipeProgress.mingguan,
                    //       onTap: () {
                    //         pushNewScreen(
                    //           context,
                    //           screen: const DetailProgresScreen(),
                    //           withNavBar: true,
                    //           pageTransitionAnimation:
                    //               PageTransitionAnimation.cupertino,
                    //         );
                    //       },
                    //     ),
                    //     const SizedBox(
                    //       height: 13,
                    //     ),
                    //     ProgressCard(
                    //       title: 'Minggu ke 1',
                    //       date: '01 - 07 May 2023',
                    //       type: TipeProgress.mingguan,
                    //       onTap: () {
                    //         pushNewScreen(
                    //           context,
                    //           screen: const DetailProgresScreen(),
                    //           withNavBar: true,
                    //           pageTransitionAnimation:
                    //               PageTransitionAnimation.cupertino,
                    //         );
                    //       },
                    //     ),
                    //     const SizedBox(
                    //       height: 13,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
