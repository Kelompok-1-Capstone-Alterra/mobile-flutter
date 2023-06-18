import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:mobile_flutter/view/artikel/screen/artikel_lihatsemua_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../../dashboard/widget/artikel_trending_widget.dart';
import '../widget/artikel_terbaru_widget.dart';

class ArtikelScreen extends StatelessWidget {
  const ArtikelScreen({super.key});
  final double _horizontal = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Artikel',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: _horizontal),
            child: IconButton(
              onPressed: () {
                pushNewScreen(
                  context,
                  screen: const ArtikelLihatSemuaScreen(
                    title: 'Artikel yang disukai',
                  ),
                  withNavBar: false,
                );
              },
              icon: const Icon(FluentIcons.heart_24_regular),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          // ------------- artikel trending ------------------
          TitleSections(
            horizontal: _horizontal,
            title: "Artikel Trending",
            onPressed: () {
              pushNewScreen(
                context,
                screen: const ArtikelLihatSemuaScreen(
                  title: 'Artikel Trending',
                ),
                withNavBar: false,
              );
            },
          ),
          ArtikelWidget(horizontal: _horizontal),
          const SizedBox(
            height: 15,
          ),
          // ------------- artikel terbaru ------------------
          TitleSections(
            horizontal: _horizontal,
            title: "Artikel Terbaru",
            onPressed: () {
              pushNewScreen(
                context,
                screen: const ArtikelLihatSemuaScreen(
                  title: 'Artikel Terbaru',
                ),
                withNavBar: false,
              );
            },
          ),
          ArtikelTerbaruWidget(horizontal: _horizontal),
        ],
      ),
    );
  }
}

class TitleSections extends StatelessWidget {
  const TitleSections({
    super.key,
    required double horizontal,
    required this.title,
    required this.onPressed,
  }) : _horizontal = horizontal;
  final String title;
  final double _horizontal;
  final void Function() onPressed;

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
            onPressed: onPressed,
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
