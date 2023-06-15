import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_mati_screen.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_panen_screen.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_progress_screen.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/progress_card/no_progress_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/progress_card/progress_card.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/progres_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class ProgressSection extends StatefulWidget {
  final int idTanaman;
  const ProgressSection({super.key, this.idTanaman = 0});

  @override
  State<ProgressSection> createState() => _ProgressSectionState();
}

class _ProgressSectionState extends State<ProgressSection> {
  @override
  void initState() {
    super.initState();

    context.read<ProgresProvider>().getProgres(widget.idTanaman);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProgresProvider>(
      builder: (context, provider, _) {
        if (provider.state == MyState.initial) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
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
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const Center(child: CircularProgressIndicator()),
            ],
          );
        } else if (provider.state == MyState.loaded) {
          return Column(
            children: [
              provider.weeklyProgressList.isNotEmpty
                  ? Column(
                      children:
                          provider.weeklyProgressList.reversed.map((progress) {
                        return Column(
                          children: [
                            ProgressCard(
                              title: progress.status == 'planting'
                                  ? 'Minggu ke ${progress.week}'
                                  : progress.status == 'harvest'
                                      ? 'Sudah Panen'
                                      : progress.status == 'dead'
                                          ? 'Tanaman Mati'
                                          : '',
                              date: progress.status == 'planting'
                                  ? '${progress.from} - ${progress.to}'
                                  : progress.status == 'harvest' ||
                                          progress.status == 'dead'
                                      ? '${progress.from}'
                                      : 'null',
                              type: progress.status == 'planting'
                                  ? TipeProgress.mingguan
                                  : progress.status == 'harvest'
                                      ? TipeProgress.panen
                                      : progress.status == 'dead'
                                          ? TipeProgress.mati
                                          : null,
                              onTap: () {
                                // pushNewScreen(
                                //   context,
                                //   screen: progress.status == 'planting'
                                //       ? DetailProgresScreen(
                                //           idTanaman: widget.idTanaman,
                                //           idProgress:
                                //               progress.weeklyProgressId!,
                                //         )
                                //       : progress.status == 'harvest'
                                //           ? const DetailPanenScreen()
                                //           : progress.status == 'dead'
                                //               ? DetailMatiScreen(
                                //                   idTanaman: widget.idTanaman,
                                //                   idProgress: progress
                                //                       .weeklyProgressId!,
                                //                 )
                                //               : const SizedBox(),
                                //   withNavBar: false,
                                //   pageTransitionAnimation:
                                //       PageTransitionAnimation.cupertino,
                                // );
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
          return const Center(
            child: Text("eror di else"),
          );
        }
      },
    );
  }
}
