import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/widget/artikel_card/artikel_card_widget.dart';
import 'package:mobile_flutter/view/artikel/screen/detail_artikel.dart';
import 'package:mobile_flutter/view_model/artikel_viewmodel/get_article_lastest_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../utils/state/finite_state.dart';

class ArtikelLatestWidget extends StatelessWidget {
  const ArtikelLatestWidget({
    super.key,
    required double horizontal,
  }) : _horizontal = horizontal;

  final double _horizontal;

  @override
  Widget build(BuildContext context) {
    return Consumer<GetArticleLatestProvider>(builder: (context, provider, _) {
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
            itemCount: provider.artikelLatest.length >= 5
                ? 5
                : provider.artikelLatest.length,
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
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: _horizontal),
            child: SizedBox(
              height: 110,
              child: Card(
                margin: const EdgeInsets.all(0),
                elevation: 15,
                shadowColor: Colors.black26,
                // shadowColor: const Color.fromARGB(40, 0, 0, 0),
                color: Colors.white,
                surfaceTintColor: Colors.transparent,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Center(
                    child: Text(
                      "Artikel belum tersedia",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      } else if (provider.state == MyState.failed) {
        return SizedBox(
          height: 110,
          child: Card(
            margin: const EdgeInsets.all(0),
            elevation: 15,
            shadowColor: Colors.black26,
            // shadowColor: const Color.fromARGB(40, 0, 0, 0),
            color: Colors.white,
            surfaceTintColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Center(
                child: Text(
                  "error",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
