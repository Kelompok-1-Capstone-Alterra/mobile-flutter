import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:provider/provider.dart';

import '../../../view_model/artikel_viewmodel/artikel_provider.dart';
import '../../dashboard/widget/artikel_trending_widget.dart';
import '../widget/artikel_terbaru_widget.dart';

class ArtikelScreen extends StatelessWidget {
  const ArtikelScreen({super.key});
  final double _horizontal = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 25),
      //   child: FloatingActionButton(
      //     elevation: 10,
      //     backgroundColor: primary[300],
      //     onPressed: () {},
      //     child: Icon(
      //       Icons.add,
      //       size: 30,
      //       // weight: 3,
      //       color: neutral[10],
      //     ),
      //   ),
      // ),
      body: Consumer<ArtikelProvider>(builder: (context, provider, _) {
        return ListView(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: provider.imageList
                      .map(
                        (item) => Stack(
                          children: [
                            Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Positioned(
                              bottom: 32,
                              left: 16,
                              right: 45,
                              child: Text(
                                item['title'],
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: neutral[10],
                                    ),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                  carouselController: provider.carouselController,
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    height: 192,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    onPageChanged: (index, reason) {
                      provider.setCurrentIndex(index);
                    },
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: provider.imageList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => provider.carouselController
                            .animateToPage(entry.key),
                        child: Container(
                          width: 20,
                          height: 5,
                          margin: const EdgeInsets.symmetric(horizontal: 3.0),
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
            const SizedBox(
              height: 10,
            ),
            // ------------- artikel trending ------------------
            TitleSections(horizontal: _horizontal, title: "Artikel Trending"),
            ArtikelWidget(horizontal: _horizontal),
            const SizedBox(
              height: 15,
            ),
            // ------------- artikel terbaru ------------------
            TitleSections(horizontal: _horizontal, title: "Artikel Terbaru"),
            ArtikelTerbaruWidget(horizontal: _horizontal),
          ],
        );
      }),
    );
  }
}

class TitleSections extends StatelessWidget {
  const TitleSections({
    super.key,
    required double horizontal,
    required this.title,
  }) : _horizontal = horizontal;
  final String title;
  final double _horizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(primary.withOpacity(0.1)),
            ),
            onPressed: () {},
            child: Text(
              "Lihat Semua",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: primary[300]),
            ),
          ),
        ],
      ),
    );
  }
}
