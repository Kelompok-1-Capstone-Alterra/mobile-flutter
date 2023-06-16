import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_flutter/utils/converter/convert_price.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/view_model/service_provider/get_fertilizing_article_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/app_constant.dart';
import '../../utils/themes/custom_color.dart';

class InformasiPemupukanScreen extends StatefulWidget {
  const InformasiPemupukanScreen({super.key, required this.plantId});

  final int plantId;
  @override
  State<InformasiPemupukanScreen> createState() =>
      _InformasiPemupukanScreenState();
}

// const String _htmlData = r"""
// <p>Pemupukan susulan tanaman tomat dianjurkan menggunakan pupuk NPK daun, kompos atau bisa juga dengan Pupuk Langsung Pakai (PLP), ketika usia tanam menginjak satu minggu, dan seterusnya setelah satu bulan, dan setiap 30 hari sekali.</p>
// <p>Jika menggunakan kompos, berikan satu kepalan tangan pada setiap tanaman baik dalam pot, polibag atau bedengan. Dan NPK sebanyak 2 gram per tanaman.</p>
// """;

class _InformasiPemupukanScreenState extends State<InformasiPemupukanScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<GetFertilizingArticleProvider>()
          .getFertilizingArticleData(plantId: widget.plantId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Navigator.pop(context);
          },
          child: Icon(
            FluentIcons.chevron_left_16_regular,
            size: 30,
            color: neutral[10],
          ),
        ),
      ),
      body: Consumer<GetFertilizingArticleProvider>(
        builder: (context, provider, _) {
          if (provider.state == MyState.loading) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: neutral[30]!,
                    highlightColor: neutral[20]!,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.31,
                      width: MediaQuery.of(context).size.width,
                      color: neutral[20]!,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  UnconstrainedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Shimmer.fromColors(
                        baseColor: neutral[30]!,
                        highlightColor: neutral[20]!,
                        child: Container(
                          decoration: BoxDecoration(
                              color: neutral[20]!,
                              borderRadius: BorderRadius.circular(10)),
                          height: 15,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  UnconstrainedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Shimmer.fromColors(
                        baseColor: neutral[30]!,
                        highlightColor: neutral[20]!,
                        child: Container(
                          decoration: BoxDecoration(
                              color: neutral[20]!,
                              borderRadius: BorderRadius.circular(10)),
                          height: 10,
                          width: MediaQuery.of(context).size.width * 0.25,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  UnconstrainedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Shimmer.fromColors(
                        baseColor: neutral[30]!,
                        highlightColor: neutral[20]!,
                        child: Container(
                          decoration: BoxDecoration(
                              color: neutral[20]!,
                              borderRadius: BorderRadius.circular(10)),
                          height: 10,
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  UnconstrainedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Shimmer.fromColors(
                        baseColor: neutral[30]!,
                        highlightColor: neutral[20]!,
                        child: Container(
                          decoration: BoxDecoration(
                              color: neutral[20]!,
                              borderRadius: BorderRadius.circular(10)),
                          height: 10,
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  UnconstrainedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Shimmer.fromColors(
                        baseColor: neutral[30]!,
                        highlightColor: neutral[20]!,
                        child: Container(
                          decoration: BoxDecoration(
                              color: neutral[20]!,
                              borderRadius: BorderRadius.circular(10)),
                          height: 10,
                          width: MediaQuery.of(context).size.width * 0.7,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (provider.state == MyState.loaded) {
            return ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.network(
                    "${AppConstant.imgUrl}${provider.fertilizingArticle!.picture}",
                    // image,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Shimmer.fromColors(
                        baseColor: neutral[30]!,
                        highlightColor: neutral[20]!,
                        child: Container(
                          width: double.maxFinite,
                          height: MediaQuery.of(context).size.height * 0.30,
                          color: neutral[20]!,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height * 0.3,
                        color: neutral[20],
                        child: const Icon(Icons.image_not_supported_outlined)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cara pemupukan",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        "${provider.fertilizingArticle!.name}",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: neutral[40]),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Html(
                        data: provider.fertilizingArticle!.description,
                        style: {
                          'p': Style(
                            textAlign: TextAlign.justify,
                          ),
                          '#': Style(
                            margin: Margins.symmetric(horizontal: 0),
                          ),
                          'br': Style(
                            margin: Margins.symmetric(horizontal: 0),
                            padding: EdgeInsets.zero,
                            fontSize: FontSize(10),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                provider.fertilizingArticle!.productsRecomendation!.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Rekomendasi Pupuk",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    : const SizedBox.shrink(),
                const ProductRecomendationGridviewWidget(),
                const SizedBox(height: 5)
              ],
            );
          } else {
            return Center(
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
                        provider.getFertilizingArticleData(
                            plantId: widget.plantId);
                      },
                      child: Text(
                        "Try Again?",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: neutral[70]!,
                            ),
                      ))
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class ProductRecomendationGridviewWidget extends StatelessWidget {
  const ProductRecomendationGridviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: const EdgeInsets.symmetric(vertical: 2),
      height: 230,
      child: Consumer<GetFertilizingArticleProvider>(
        builder: (context, provider, _) {
          if (provider.fertilizingArticle!.productsRecomendation!.isNotEmpty) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) => Stack(
                      children: [
                        Card(
                          // margin: const EdgeInsets.symmetric(vertical: 10),
                          margin: const EdgeInsets.all(0),
                          color: Colors.white,
                          surfaceTintColor: Colors.transparent,
                          elevation: 15,

                          shadowColor: Colors.black26,
                          // shadowColor: const Color.fromARGB(40, 0, 0, 0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 150,
                                height: 100,
                                child: Image.network(
                                  "${AppConstant.imgUrl}${provider.fertilizingArticle!.productsRecomendation![index].productPictures![0]}",
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Shimmer.fromColors(
                                      baseColor: neutral[30]!,
                                      highlightColor: neutral[20]!,
                                      child: Container(
                                        width: 150,
                                        height: 100,
                                        color: neutral[20]!,
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                    width: 150,
                                    height: 100,
                                    color: neutral[20],
                                    child: const Icon(
                                        Icons.image_not_supported_outlined),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Wrap(
                                  direction: Axis.vertical,
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      child: AutoSizeText(
                                        "${provider.fertilizingArticle!.productsRecomendation![index].productName}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        minFontSize: 13,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 130,
                                      child: AutoSizeText(
                                        convertPrice2(provider
                                            .fertilizingArticle!
                                            .productsRecomendation![index]
                                            .productPrice),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(color: neutral[40]),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 15,
                    ),
                itemCount:
                    provider.fertilizingArticle!.productsRecomendation!.length);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
