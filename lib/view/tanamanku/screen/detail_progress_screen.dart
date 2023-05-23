import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/pemupukan_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/progres_penyiraman_card.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/detail_progress_provider.dart';
import 'package:provider/provider.dart';

class DetailProgresScreen extends StatefulWidget {
  const DetailProgresScreen({super.key});

  @override
  State<DetailProgresScreen> createState() => _DetailProgresScreenState();
}

class _DetailProgresScreenState extends State<DetailProgresScreen> {
  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<DetailProgressProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: FloatingActionButton.small(
            elevation: 0,
            backgroundColor: Colors.transparent,
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
        ),
        body: Consumer<DetailProgressProvider>(
          builder: (context, provider, _) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CarouselSlider(
                        items: provider.imageList
                            .map(
                              (item) => Image.asset(
                                item['image_path'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            )
                            .toList(),
                        carouselController: provider.carouselController,
                        options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          height: 300,
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
                          children:
                              provider.imageList.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => provider.carouselController
                                  .animateToPage(entry.key),
                              child: Container(
                                width: 7,
                                height: 7,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.5),
                                  color: provider.currentIndex == entry.key
                                      ? primary
                                      : neutral[20],
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
                          'Minggu ke 1',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          '24-30 May 2023',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: neutral[40]),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Text('Kondisi Tanaman',
                            style: Theme.of(context).textTheme.labelLarge),
                        const SizedBox(
                          height: 14,
                        ),
                        Card(
                          margin: const EdgeInsets.all(0),
                          elevation: 15,
                          shadowColor: Colors.black26,
                          color: success[100],
                          surfaceTintColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                      color: primary[400],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(
                                    FluentIcons.plant_grass_20_regular,
                                    color: neutral[10],
                                  ),
                                ),
                                const SizedBox(width: 36),
                                AutoSizeText(
                                  "Sangat Sehat",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const ProgresPenyiraman(),
                        const SizedBox(
                          height: 12,
                        ),
                        const PemupukanCard(),
                        const SizedBox(
                          height: 28,
                        ),
                        Text('Progres',
                            style: Theme.of(context).textTheme.labelLarge),
                        const Text(
                            'Minggu ke 1 tanaman tomat saya sangat sehat dan segar. Minggu ke 1 tanaman tomat saya sangat sehat dan segar. Minggu ke 1 tanaman tomat saya sangat sehat dan segar.'),
                        const SizedBox(
                          height: 44,
                        ),
                        ElevatedButton(
                          onPressed: () {},
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
              ),
            );
          },
        ),
      ),
    );
  }
}
