import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/view_model/service_provider/get_watering_article_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/app_constant.dart';
import '../../utils/themes/custom_color.dart';

class InformasiPenyiramanScreen extends StatefulWidget {
  const InformasiPenyiramanScreen({super.key, required this.plantId});

  final int plantId;
  @override
  State<InformasiPenyiramanScreen> createState() =>
      _InformasiPenyiramanScreenState();
}

// const String _htmlData = r"""
// <p>Untuk menyirami tanaman tomat, perlu dilakukan 2 kali dalam sehari ketika pagi dan sore. Namun harus memperhatikan kelemahan tanaman tomat, yaitu tidak tahan dengan genangan dan rentan terhadap kekurangan oksigen.</p>

// <p>Oleh karena itu, siramlah tanaman secukupnya saja tidak perlu terlalu basah kuyup yang dapat menimbulkan genangan disekitar akar.</p>

// <p>Penyiraman saat pagi, harus dengan air yang lebih sedikit dari sore hari, karena ketika sore hari lebih diperlukan untuk menggantikan air yang hilang karena penguapan dan mengembalikan kekuatan tanaman ketika malam hari tiba.</p>
// """;

class _InformasiPenyiramanScreenState extends State<InformasiPenyiramanScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<GetWateringArticleProvider>()
          .getWateringArticleData(plantId: widget.plantId);
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
      body: Consumer<GetWateringArticleProvider>(
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
                    "${AppConstant.imgUrl}${provider.wateringArticle!.picture}",
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
                      child: const Icon(Icons.image_not_supported_outlined),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Informasi Penyiraman",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        "${provider.wateringArticle!.name}",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: neutral[40]),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Html(
                        data: provider.wateringArticle!.description,
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
                        provider.getWateringArticleData(
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

          // return ListView(
          //   shrinkWrap: true,
          //   children: [
          //     Container(
          //       color: Colors.red,
          //       height: MediaQuery.of(context).size.height * 0.32,
          //       child: Image.asset(
          //         "assets/images/sample_tomat.png",
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             "Informasi Penyiraman",
          //             style: Theme.of(context).textTheme.headlineSmall,
          //           ),
          //           Text(
          //             "Tomat",
          //             style: Theme.of(context)
          //                 .textTheme
          //                 .labelSmall!
          //                 .copyWith(color: neutral[40]),
          //           ),
          //           const SizedBox(
          //             height: 15,
          //           ),
          //           Html(
          //             data: _htmlData,
          //             style: {
          //               'p': Style(
          //                 textAlign: TextAlign.justify,
          //               ),
          //               '#': Style(
          //                 margin: Margins.symmetric(horizontal: 0),
          //                 padding: const EdgeInsets.only(bottom: 20),
          //               )
          //             },
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // );
        },
      ),
    );
  }
}
