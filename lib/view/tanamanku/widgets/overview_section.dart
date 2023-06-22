import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/tanamanku/screen/add_progress_mati_screen.dart';
import 'package:mobile_flutter/view/tanamanku/screen/add_progress_panen_screen.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/description_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/informasi_tanaman_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/pemupukan_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/penyiraman_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/progres_penyiraman_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/warning_cuaca.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/weekly_progres_card.dart';
import 'package:mobile_flutter/view_model/service_provider/get_weather_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_fertilizing.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_progress_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_watering.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/overview_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class OverviewSection extends StatefulWidget {
  final int idTanaman;
  final int idDetailTanaman;
  final String location;
  const OverviewSection({
    super.key,
    this.idTanaman = 0,
    this.idDetailTanaman = 0,
    this.location = '',
  });

  @override
  State<OverviewSection> createState() => _OverviewSectionState();
}

class _OverviewSectionState extends State<OverviewSection> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initState();
    });
  }

  Future<void> _initState() async {
    context.read<OverviewProvider>().getPlantDetail(widget.idDetailTanaman);
    if (context.read<OverviewProvider>().sudahMenanam!) {
      await context
          .read<OverviewProvider>()
          .getOverview(widget.idTanaman, widget.idDetailTanaman);
      if (context.mounted) {
        if (Provider.of<OverviewProvider>(context, listen: false).state !=
            MyState.failed) {
          context.read<AddWateringProvider>().addHistoryFromList(context
              .read<OverviewProvider>()
              .getOverviewData
              .watering!
              .history!);
          context.read<AddWateringProvider>().week =
              context.read<OverviewProvider>().getOverviewData.watering?.week;
          context.read<AddWateringProvider>().day =
              context.read<OverviewProvider>().getOverviewData.watering?.day;
          context.read<AddWateringProvider>().period =
              context.read<OverviewProvider>().getOverviewData.watering?.period;

          context.read<AddFertilizingProvider>().isActive = context
              .read<OverviewProvider>()
              .getOverviewData
              .fertilizing
              ?.isActive;
          context.read<AddFertilizingProvider>().isEnabled = context
              .read<OverviewProvider>()
              .getOverviewData
              .fertilizing
              ?.isEnabled;

          context.read<AddProgressProvider>().isActive = context
              .read<OverviewProvider>()
              .getOverviewData
              .weeklyProgress
              ?.isActive;
          context.read<AddProgressProvider>().from = context
              .read<OverviewProvider>()
              .getOverviewData
              .weeklyProgress
              ?.from;
          context.read<AddProgressProvider>().to = context
              .read<OverviewProvider>()
              .getOverviewData
              .weeklyProgress
              ?.to;
          context.read<AddProgressProvider>().isEnabled = context
              .read<OverviewProvider>()
              .getOverviewData
              .weeklyProgress
              ?.isEnabled;
        }
      }
    }
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
          if (context.read<AddWateringProvider>().history.isEmpty &&
              provider.sudahMenanam!) {
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
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                provider.sudahMenanam!
                    ? Column(
                        children: [
                          provider.getOverviewData.temperatureAlert!.isActive!
                              ? const WarningCuaca()
                              : const SizedBox.shrink(),
                          const SizedBox(
                            height: 10,
                          ),
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
                    : Card(
                        margin: const EdgeInsets.all(0),
                        elevation: 15,
                        shadowColor: Colors.black26,
                        color: Colors.white,
                        surfaceTintColor: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                    color: neutral[40],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(
                                  'assets/images/sudah_menanam.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 13),
                              Expanded(
                                child: AutoSizeText(
                                  "Sudah Melakukan Penanaman?",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  minFontSize: 14,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  context
                                      .read<GetWeatherProvider>()
                                      .getWeatherData();
                                  await provider.startPlanting(
                                    context,
                                    widget.idTanaman,
                                    widget.idDetailTanaman,
                                    context
                                        .read<GetWeatherProvider>()
                                        .longitude!,
                                    context
                                        .read<GetWeatherProvider>()
                                        .latitude!,
                                  );

                                  _initState();
                                },
                                style: ButtonStyle(
                                    foregroundColor: MaterialStatePropertyAll(
                                      neutral[10],
                                    ),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            primary)),
                                child: const Text('Sudah'),
                              ),
                            ],
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                DescriptionCard(
                  htmlData: provider.getPlantDetails.description!,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Informasi Tanaman',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                InformasiTanamanCard(
                  caraMenanamType: CaraMenanamType.spesifikCaraMenanam,
                  plantId: widget.idDetailTanaman,
                  location: widget.location,
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
                                                          neutral.withOpacity(
                                                              0.1)),
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
                                                    screen: AddPanenScreen(
                                                        idTanaman:
                                                            widget.idTanaman),
                                                    withNavBar: false,
                                                    pageTransitionAnimation:
                                                        PageTransitionAnimation
                                                            .cupertino,
                                                  );
                                                },
                                                style: ButtonStyle(
                                                  overlayColor:
                                                      MaterialStatePropertyAll(
                                                          primary.withOpacity(
                                                              0.1)),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
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
                                                          neutral.withOpacity(
                                                              0.1)),
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
                                                    screen:
                                                        AddProgresMatiScreen(
                                                            idTanaman: widget
                                                                .idTanaman),
                                                    withNavBar: false,
                                                    pageTransitionAnimation:
                                                        PageTransitionAnimation
                                                            .cupertino,
                                                  );
                                                },
                                                style: ButtonStyle(
                                                  overlayColor:
                                                      MaterialStatePropertyAll(
                                                          primary.withOpacity(
                                                              0.1)),
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
          }
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
                      if (provider.sudahMenanam!) {
                        provider.getOverview(
                            widget.idTanaman, widget.idDetailTanaman);
                      } else {
                        // context
                        //     .read<TanamankuProvider>()
                        //     .getMyPlantName(widget.idTanaman);
                        context.read<OverviewProvider>().refresh();
                      }
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
