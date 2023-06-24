import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_flutter/utils/widget/artikel_card/artikel_card_widget.dart';
import 'package:mobile_flutter/view/artikel/screen/detail_artikel.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../utils/state/finite_state.dart';
import '../../../utils/themes/custom_color.dart';
import '../../../view_model/artikel_viewmodel/get_article_lastest_provider.dart';
import '../../../view_model/service_provider/get_article_trending_provider.dart';

class ArtikelLihatSemuaWidget extends StatelessWidget {
  const ArtikelLihatSemuaWidget({
    super.key,
    required double horizontal,
    required this.latest,
  }) : _horizontal = horizontal;

  final bool latest;
  final double _horizontal;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    if (latest == true) {
      return Consumer<GetArticleLatestProvider>(
          builder: (context, provider, _) {
        if (provider.state == MyState.loading) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: _horizontal,
            ),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) => const ArtikelCardWidgetLoading(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          );
        } else if (provider.state == MyState.loaded) {
          // cek ada data artikel apa kaga
          if (provider.artikelLatest.isNotEmpty) {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: _horizontal,
              ),
              shrinkWrap: true,
              // cek kalau lebih dari >= 3 artikel tampilkan 3 saja kalau kurang seadanya aja
              itemCount: provider.artikelLatest.length,
              itemBuilder: (context, index) => Stack(
                children: [
                  ArtikelCardWidget(
                      title: provider.artikelLatest[index].title!,
                      time: provider.artikelLatest[index].postAt!,
                      image: provider.artikelLatest[index].picture!),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: DetailArtikelScreen(
                              artikelId: provider.artikelLatest[index].id!,
                            ),
                            withNavBar: false,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
            );
          } else {
            return SizedBox(
              height: screenHeight * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.3,
                    child: SvgPicture.asset(
                      "assets/svg/empty_state.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: AutoSizeText(
                      "Artikel terbaru belum tersedia",
                      minFontSize: 14,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            );
          }
        } else if (provider.state == MyState.failed) {
          return SizedBox(
            height: screenHeight * 0.8,
            child: Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: [
                  Icon(
                    Icons.sentiment_dissatisfied_outlined,
                    size: 40,
                    color: neutral[40]!,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Something went wrong",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: neutral[50]!,
                        ),
                  ),
                  TextButton(
                      onPressed: () {
                        // provider.getTemperatureArticleData(
                        //     plantId: widget.plantId);
                      },
                      child: Text(
                        "Try Again?",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: neutral[70]!,
                            ),
                      ))
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      });
    } else {
      return Consumer<GetTrendingArticleProvider>(
          builder: (context, provider, _) {
        if (provider.state == MyState.loading) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: _horizontal,
            ),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) => const ArtikelCardWidgetLoading(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          );
        } else if (provider.state == MyState.loaded) {
          // cek ada data artikel apa kaga
          if (provider.artikelTrending.isNotEmpty) {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: _horizontal,
              ),
              shrinkWrap: true,
              // cek kalau lebih dari >= 3 artikel tampilkan 3 saja kalau kurang seadanya aja
              itemCount: provider.artikelTrending.length,
              itemBuilder: (context, index) => Stack(
                children: [
                  ArtikelCardWidget(
                      title: provider.artikelTrending[index].title!,
                      time: provider.artikelTrending[index].postAt!,
                      image: provider.artikelTrending[index].picture!),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: DetailArtikelScreen(
                              artikelId: provider.artikelTrending[index].id!,
                            ),
                            withNavBar: false,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
            );
          } else {
            return SizedBox(
              height: screenHeight * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.3,
                    child: SvgPicture.asset(
                      "assets/svg/empty_state.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: AutoSizeText(
                      "Artikel trending belum tersedia",
                      minFontSize: 14,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            );
          }
        } else if (provider.state == MyState.failed) {
          return SizedBox(
            height: screenHeight * 0.8,
            child: Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: [
                  Icon(
                    Icons.sentiment_dissatisfied_outlined,
                    size: 40,
                    color: neutral[40]!,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Something went wrong",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: neutral[50]!,
                        ),
                  ),
                  TextButton(
                      onPressed: () {
                        // provider.getTemperatureArticleData(
                        //     plantId: widget.plantId);
                      },
                      child: Text(
                        "Try Again?",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: neutral[70]!,
                            ),
                      ))
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      });
    }
  }
}
