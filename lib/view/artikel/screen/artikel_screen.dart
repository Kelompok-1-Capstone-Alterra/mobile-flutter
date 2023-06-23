import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:mobile_flutter/view/artikel/screen/artikel_lihatsemua_screen.dart';
import 'package:mobile_flutter/view/artikel/screen/artikel_liked_screen.dart';
import 'package:mobile_flutter/view_model/artikel_viewmodel/get_article_liked_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import '../../../view_model/artikel_viewmodel/get_article_lastest_provider.dart';
import '../../../view_model/service_provider/get_article_trending_provider.dart';
import '../../dashboard/widget/artikel_trending_widget.dart';
import '../widget/artikel_latest_widget.dart';

class ArtikelScreen extends StatefulWidget {
  const ArtikelScreen({super.key});

  @override
  State<ArtikelScreen> createState() => _ArtikelScreenState();
}

class _ArtikelScreenState extends State<ArtikelScreen> {
  final double _horizontal = 16;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetArticleLatestProvider>().getArticleLatestData();
      context.read<GetArticleLikedProvider>().getArticleLikedtData();
    });

    super.initState();
  }

  Future<void> _refreshPage() async {
    context.read<GetTrendingArticleProvider>().getTrendingArticleData();
    context.read<GetArticleLatestProvider>().getArticleLatestData();
  }

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
                  screen: const ArtikelLikedScreen(),
                  withNavBar: false,
                );
              },
              icon: const Icon(FluentIcons.heart_24_regular),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshPage,
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            // ------------- artikel trending ------------------
            TitleSections(
              horizontal: _horizontal,
              title: "Artikel Trending",
              onPressed: () {
                _refreshPage();
                pushNewScreen(
                  context,
                  screen: const ArtikelLihatSemuaScreen(
                    title: 'Artikel Trending',
                    latest: false,
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
                _refreshPage();
                pushNewScreen(
                  context,
                  screen: const ArtikelLihatSemuaScreen(
                    title: 'Artikel Terbaru',
                    latest: true,
                  ),
                  withNavBar: false,
                );
              },
            ),
            ArtikelLatestWidget(horizontal: _horizontal),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
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
