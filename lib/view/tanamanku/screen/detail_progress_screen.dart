import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/tanamanku/screen/edit_nama_tanaman_screen.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/overview_section.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/progress_section.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/detail_progress_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/tanamanku_provider.dart';
import 'package:provider/provider.dart';

class DetailProgresScreen extends StatefulWidget {
  const DetailProgresScreen({super.key});

  @override
  State<DetailProgresScreen> createState() => _DetailProgresScreenState();
}

class _DetailProgresScreenState extends State<DetailProgresScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TanamankuProvider>(context, listen: false);
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
              provider.fullDescription = false;
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
                        Row(
                          children: [
                            Text(
                              'Tomat',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const EditNamaTanamanScreen(),
                                    ),
                                  );
                                },
                                icon: const Icon(FluentIcons.edit_16_regular))
                          ],
                        ),
                        Text(
                          'Solanum lycopersicum',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: neutral[40]),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () {
                        //         provider.setSelectedIndex(context, 0);
                        //       },
                        //       child: Container(
                        //         height: 25,
                        //         padding: const EdgeInsets.symmetric(
                        //           horizontal: 8.5,
                        //           vertical: 2.5,
                        //         ),
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(20),
                        //           color: provider.selectedIndex == 0
                        //               ? success[500]
                        //               : Colors.transparent,
                        //         ),
                        //         child: Center(
                        //           child: Text(
                        //             'Overview',
                        //             style: Theme.of(context)
                        //                 .textTheme
                        //                 .labelLarge!
                        //                 .copyWith(
                        //                   color: provider.selectedIndex == 0
                        //                       ? neutral[10]
                        //                       : primary[500],
                        //                 ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     GestureDetector(
                        //       onTap: () {
                        //         provider.setSelectedIndex(context, 1);
                        //       },
                        //       child: Container(
                        //         height: 25,
                        //         padding: const EdgeInsets.symmetric(
                        //           horizontal: 8.5,
                        //           vertical: 2.5,
                        //         ),
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(20),
                        //           color: provider.selectedIndex == 1
                        //               ? primary[500]
                        //               : Colors.transparent,
                        //         ),
                        //         child: Center(
                        //           child: Text(
                        //             'Progress',
                        //             style: Theme.of(context)
                        //                 .textTheme
                        //                 .labelLarge!
                        //                 .copyWith(
                        //                   color: provider.selectedIndex == 1
                        //                       ? neutral[10]
                        //                       : success[500],
                        //                 ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 22,
                        // ),
                        // provider.selectedIndex == 0
                        //     ? const OverviewSection()
                        //     : const ProgressSection(),
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
