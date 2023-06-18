import 'package:flutter/material.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProgresProvider>().getProgres(widget.idTanaman);
    });
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
                        final String fromMonth = formatDateMMM(progress.from!);

                        final String toMonth = formatDateMMM(progress.to!);

                        String fromFormat = '';

                        if (fromMonth == toMonth) {
                          fromFormat = formatDatedd(progress.from!);
                        } else {
                          fromFormat = formatDateddMMM(progress.to!);
                        }

                        final String toFormat =
                            formatDateddMMMyyyy(progress.to!);
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
                                  ? '$fromFormat - $toFormat'
                                  : progress.status == 'harvest' ||
                                          progress.status == 'dead'
                                      ? formatDateddMMMyyyy(progress.from!)
                                      : 'null',
                              type: progress.status == 'planting'
                                  ? TipeProgress.mingguan
                                  : progress.status == 'harvest'
                                      ? TipeProgress.panen
                                      : progress.status == 'dead'
                                          ? TipeProgress.mati
                                          : null,
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: progress.status == 'planting'
                                      ? DetailProgresScreen(
                                          idTanaman: widget.idTanaman,
                                          idProgress:
                                              progress.weeklyProgressId!,
                                        )
                                      : progress.status == 'harvest'
                                          ? DetailPanenScreen(
                                              idTanaman: widget.idTanaman,
                                              idProgress:
                                                  progress.weeklyProgressId!,
                                            )
                                          : progress.status == 'dead'
                                              ? DetailMatiScreen(
                                                  idTanaman: widget.idTanaman,
                                                  idProgress: progress
                                                      .weeklyProgressId!,
                                                )
                                              : const SizedBox(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
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
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: neutral[50]!,
                      ),
                ),
                TextButton(
                    onPressed: () {
                      provider.getProgres(widget.idTanaman);
                    },
                    child: Text(
                      "Coba Lagi?",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: neutral[70]!,
                          ),
                    ))
              ],
            ),
          );
        }
      },
    );
  }
}
