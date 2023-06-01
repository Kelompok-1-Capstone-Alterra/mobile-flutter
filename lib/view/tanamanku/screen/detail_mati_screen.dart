import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/detail_progress_provider.dart';
import 'package:provider/provider.dart';

class DetailMatiScreen extends StatefulWidget {
  const DetailMatiScreen({super.key});

  @override
  State<DetailMatiScreen> createState() => _DetailMatiScreenState();
}

class _DetailMatiScreenState extends State<DetailMatiScreen> {
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
        ),
        body: Consumer<DetailProgressProvider>(
          builder: (context, provider, _) {
            return ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tanaman Mati',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        '24 May 2023',
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
                      const Text('Hama'),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Alasan tanaman mati',
                          style: Theme.of(context).textTheme.labelLarge),
                      const Text(
                          'Tanaman tomat saya mati setelah di serang hama minggu lalu'),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
