import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/app_constant.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/tanamanku/screen/edit_nama_tanaman_screen.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/overview_section.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/progress_section.dart';
import 'package:mobile_flutter/view_model/service_provider/get_my_plants_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_fertilizing.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_progress_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_watering.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/overview_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/tanamanku_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

// enum TabPreview { overview, progress }

class DetailTanamanScreen extends StatefulWidget {
  final int idTanaman;
  final int idDetailTanaman;
  final String location;
  const DetailTanamanScreen({
    super.key,
    this.idTanaman = 0,
    this.idDetailTanaman = 0,
    this.location = '',
  });

  @override
  State<DetailTanamanScreen> createState() => _DetailTanamanScreenState();
}

class _DetailTanamanScreenState extends State<DetailTanamanScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initState();
    });
  }

  _initState() async {
    await context
        .read<TanamankuProvider>()
        .getMyPlantName(widget.idTanaman)
        .then((value) => context
            .read<TanamankuProvider>()
            .getPlantDetail(widget.idDetailTanaman));

    if (context.mounted) {
      context.read<OverviewProvider>().sudahMenanam =
          context.read<TanamankuProvider>().getDetails.isStartPlanting;

      context.read<OverviewProvider>().refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Consumer<TanamankuProvider>(
          builder: (context, provider, _) {
            if (provider.state == MyState.initial) {
              return const SizedBox.shrink();
            } else if (provider.state == MyState.loading) {
              return const SizedBox.shrink();
            } else if (provider.state == MyState.loaded) {
              return Padding(
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
                    provider.refresh();
                    context.read<AddWateringProvider>().refresh();
                    context.read<AddFertilizingProvider>().refresh();
                    context.read<AddProgressProvider>().refreshData();
                    context.read<GetMyPlantsProvider>().getMyPlantsData();
                    context.read<OverviewProvider>().sudahMenanam = false;
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
        body: Consumer<TanamankuProvider>(
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
                  Image.network(
                    '${AppConstant.imgUrl}${provider.getPlantDetails.picture}',
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      color: neutral[20],
                      child: const Icon(Icons.image_not_supported_outlined),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                provider.getDetails.name ?? "-",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  pushNewScreen(
                                    context,
                                    screen: EditNamaTanamanScreen(
                                      idTanaman: widget.idTanaman,
                                      defaultValue: provider.getDetails.name!,
                                      picture:
                                          provider.getPlantDetails.picture!,
                                    ),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                                icon: const Icon(FluentIcons.edit_16_regular))
                          ],
                        ),
                        Text(
                          provider.getDetails.latin ?? "-",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: neutral[40]),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                provider.setSelectedIndex(context, 0);
                              },
                              child: Container(
                                height: 25,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.5,
                                  vertical: 2.5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: provider.selectedIndex == 0
                                      ? success[500]
                                      : Colors.transparent,
                                ),
                                child: Center(
                                  child: Text(
                                    'Overview',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: provider.selectedIndex == 0
                                              ? neutral[10]
                                              : primary[500],
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                provider.setSelectedIndex(context, 1);
                              },
                              child: Container(
                                height: 25,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.5,
                                  vertical: 2.5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: provider.selectedIndex == 1
                                      ? primary[500]
                                      : Colors.transparent,
                                ),
                                child: Center(
                                  child: Text(
                                    'Progress',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: provider.selectedIndex == 1
                                              ? neutral[10]
                                              : success[500],
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        provider.selectedIndex == 0
                            ? OverviewSection(
                                idTanaman: widget.idTanaman,
                                idDetailTanaman: widget.idDetailTanaman,
                                location: widget.location,
                              )
                            : ProgressSection(idTanaman: widget.idTanaman),
                      ],
                    ),
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
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Kembali",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: error,
                                  ),
                            )),
                        TextButton(
                            onPressed: () {
                              provider.getMyPlantName(widget.idTanaman);
                            },
                            child: Text(
                              "Coba Lagi?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: neutral[70]!,
                                  ),
                            )),
                      ],
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
