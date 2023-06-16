import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
// import 'package:mobile_flutter/view/tanamanku/screen/add_progress_mati_screen.dart';
import 'package:mobile_flutter/view/tanamanku/screen/add_progress_panen_screen.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/description_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/informasi_tanaman_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/pemupukan_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/penyiraman_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/progres_penyiraman_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/sudah_menanam_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/warning_cuaca.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/weekly_progres_card.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_fertilizing.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_progress_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_watering.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/overview_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/tanamanku_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class OverviewSection extends StatefulWidget {
  final int idTanaman;
  const OverviewSection({super.key, this.idTanaman = 0});

  @override
  State<OverviewSection> createState() => _OverviewSectionState();
}

class _OverviewSectionState extends State<OverviewSection> {
  @override
  void initState() {
    super.initState();

    bool? sudahMenanamResponse =
        context.read<TanamankuProvider>().getDetails.isStartPlanting;

    context.read<AddWateringProvider>().getWateringData(widget.idTanaman);

    context.read<AddFertilizingProvider>().getFertilizingData(widget.idTanaman);

    context.read<AddProgressProvider>().getWeeklyProgressData(widget.idTanaman);

    context.read<OverviewProvider>().getOverview(widget.idTanaman);

    context.read<OverviewProvider>().sudahMenanam = sudahMenanamResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OverviewProvider>(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              provider.getOverviewData.temperatureAlert!.isActive!
                  ? const WarningCuaca()
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 10,
              ),
              provider.sudahMenanam!
                  ? Column(
                      children: [
                        const ProgresPenyiraman(),
                        const SizedBox(
                          height: 10,
                        ),
                        PenyiramanCard(idTanaman: widget.idTanaman),
                        const SizedBox(
                          height: 10,
                        ),
                        provider.getOverviewData.fertilizing!.isActive!
                            ? PemupukanCard(idTanaman: widget.idTanaman)
                            : const SizedBox.shrink(),
                        const SizedBox(
                          height: 10,
                        ),
                        provider.getOverviewData.weeklyProgress!.isActive!
                            ? WeeklyProgressCard(idTanaman: widget.idTanaman)
                            : const SizedBox.shrink(),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  : const SudahMenanamCard(),
              const SizedBox(
                height: 10,
              ),
              const DescriptionCard(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Informasi Tanaman',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const InformasiTanamanCard(
                caraMenanamType: CaraMenanamType.spesifikCaraMenanam,
              ),
              const SizedBox(
                height: 20,
              ),
              provider.sudahMenanam!
                  ? Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: provider.getOverviewData.buttonHarvest!
                                ? () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                            'Tanamanmu sudah panen?',
                                            style: ThemeData()
                                                .textTheme
                                                .headlineSmall!
                                                .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 24,
                                                ),
                                          ),
                                          content: Text(
                                            'Silahkan isi progres panen kamu',
                                            style: ThemeData()
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStatePropertyAll(
                                                        neutral
                                                            .withOpacity(0.1)),
                                              ),
                                              child: Text(
                                                'Batal',
                                                style: ThemeData()
                                                    .textTheme
                                                    .headlineSmall!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: neutral[40],
                                                    ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                pushNewScreen(
                                                  context,
                                                  screen: AddPanenScreen(),
                                                  withNavBar: false,
                                                  pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                );
                                              },
                                              style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStatePropertyAll(
                                                        primary
                                                            .withOpacity(0.1)),
                                              ),
                                              child: Text(
                                                'Progres',
                                                style: ThemeData()
                                                    .textTheme
                                                    .headlineSmall!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: primary,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              backgroundColor: primary,
                              minimumSize: const Size(double.infinity, 0),
                            ),
                            child: Text(
                              'Tanamanmu Berhasil Panen?',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: neutral[10],
                                  ),
                            ),
                          ),
                          TextButton(
                            onPressed: provider.getOverviewData.buttonDead!
                                ? () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                            'Tanamanmu mati?',
                                            style: ThemeData()
                                                .textTheme
                                                .headlineSmall!
                                                .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 24,
                                                ),
                                          ),
                                          content: Text(
                                            'Silahkan isi penyebab tanamanmu mati',
                                            style: ThemeData()
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStatePropertyAll(
                                                        neutral
                                                            .withOpacity(0.1)),
                                              ),
                                              child: Text(
                                                'Batal',
                                                style: ThemeData()
                                                    .textTheme
                                                    .headlineSmall!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: neutral[40],
                                                    ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                // pushNewScreen(
                                                //   context,
                                                //   screen: AddProgresMatiScreen(
                                                //       idTanaman:
                                                //           widget.idTanaman),
                                                //   withNavBar: false,
                                                //   pageTransitionAnimation:
                                                //       PageTransitionAnimation
                                                //           .cupertino,
                                                // );
                                              },
                                              style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStatePropertyAll(
                                                        primary
                                                            .withOpacity(0.1)),
                                              ),
                                              child: Text(
                                                'Isi Penyebab',
                                                style: ThemeData()
                                                    .textTheme
                                                    .headlineSmall!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: primary,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                : null,
                            style: ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(
                                  error.withOpacity(0.1)),
                            ),
                            child: Text(
                              'Tanamanmu mati?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color:
                                          provider.getOverviewData.buttonDead!
                                              ? error
                                              : neutral[40]),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          );
        } else {
          return const Center(
            child: Text("Oops! Something went error."),
          );
        }
      },
    );
  }
}
