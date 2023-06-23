import 'dart:async';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:like_button/like_button.dart';
import 'package:mobile_flutter/utils/keys/navigator_keys.dart';
import 'package:mobile_flutter/view_model/artikel_viewmodel/artikel_detail_provider.dart';
import 'package:mobile_flutter/view_model/artikel_viewmodel/get_article_liked_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_constant.dart';
import '../../../utils/state/finite_state.dart';
import '../../../utils/themes/custom_color.dart';

class DetailArtikelScreen extends StatefulWidget {
  const DetailArtikelScreen({super.key, required this.artikelId});

  final int artikelId;

  @override
  State<DetailArtikelScreen> createState() => _DetailArtikelScreenState();
}

class _DetailArtikelScreenState extends State<DetailArtikelScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context
          .read<ArtikelProvider>()
          .getArticleDetail(artikelId: widget.artikelId);
    });
  }

  Future<void> _refreshPage() async {
    context
        .read<ArtikelProvider>()
        .getArticleDetail(artikelId: widget.artikelId);
  }

  // _showLiked() async {
  //   OverlayState? overlayState = Overlay.of(context);
  //   OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
  //     return Positioned(
  //         top: MediaQuery.of(context).size.height / 2.5,
  //         right: MediaQuery.of(context).size.width / 2.5,
  //         child: const Icon(
  //           FluentIcons.heart_48_filled,
  //           size: 70,
  //           color: primary,
  //         ));
  //   });

  //   overlayState.insert(overlayEntry);
  //   await Future.delayed(const Duration(milliseconds: 500));
  //   overlayEntry.remove();
  // }

  @override
  Widget build(BuildContext context) {
    final providerLiked =
        Provider.of<GetArticleLikedProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        providerLiked.getArticleLikedtData();
        return true;
      },
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
              // menjalankan fungsi like artikel
              providerLiked.getArticleLikedtData();
              Navigator.pop(context);
            },
            child: Icon(
              FluentIcons.chevron_left_16_regular,
              size: 30,
              color: neutral[10],
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshPage,
          child: Consumer<ArtikelProvider>(builder: (context, provider, _) {
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
              return ListView.separated(
                itemCount: provider.articleDetail!.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        "${AppConstant.imgUrl}${provider.articleDetail![index].picture!}",
                        // "asdad",
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
                            child:
                                const Icon(Icons.image_not_supported_outlined)),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  provider.articleDetail![index].title!,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              LikeButton(
                                circleColor: CircleColor(
                                    start: primary, end: primary[400]!),
                                bubblesColor: BubblesColor(
                                    dotPrimaryColor: primary,
                                    dotSecondaryColor: primary[400]!),
                                isLiked: providerLiked
                                    .isContainInLikedList(widget.artikelId),
                                onTap: (isLiked) async {
                                  if (isLiked == false) {
                                    // lakukan post add liked article
                                    providerLiked.liked(widget.artikelId);
                                    //muncul kan snack bar berhasil menyimpan
                                    AnimatedSnackBar(
                                      mobilePositionSettings:
                                          const MobilePositionSettings(
                                        topOnAppearance: 50,
                                      ),
                                      builder: ((context) {
                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          decoration: BoxDecoration(
                                            color: success[300],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),

                                          // height: 50,
                                          child: Text(
                                            'Kamu Menyukai Artikel',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(
                                                  color: neutral[10],
                                                ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        );
                                      }),
                                    ).show(navigatorKeys.currentContext!);
                                    return true;
                                  }

                                  if (isLiked == true) {
                                    // lakukan delete liked article
                                    providerLiked.unLiked(widget.artikelId);
                                    //muncul kan snack bar berhasil menghapus
                                    AnimatedSnackBar(
                                      mobilePositionSettings:
                                          const MobilePositionSettings(
                                        topOnAppearance: 50,
                                      ),
                                      builder: ((context) {
                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          decoration: BoxDecoration(
                                            color: neutral[40],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),

                                          // height: 50,
                                          child: Text(
                                            'Menghapus Artikel Di Sukai',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(
                                                  color: neutral[10],
                                                ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        );
                                      }),
                                    ).show(navigatorKeys.currentContext!);

                                    return false;
                                  }

                                  return null;
                                },
                                likeBuilder: (isLiked) {
                                  return Icon(isLiked
                                      // provider.articleDetail![index].isLiked!
                                      ? FluentIcons.heart_32_filled
                                      : FluentIcons.heart_32_regular);
                                },
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0),
                          child: Html(
                            data: provider.articleDetail![index].description!,
                            style: {
                              'br': Style(
                                fontSize: FontSize(0),
                                margin: Margins.symmetric(
                                  horizontal: 0,
                                  vertical: 0,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                              ),
                              'p': Style(textAlign: TextAlign.justify),
                              'ol': Style(
                                  margin: Margins.symmetric(
                                      horizontal: 0, vertical: 0),
                                  padding: const EdgeInsets.only(
                                      left: 18, top: 0, right: 0, bottom: 0)
                                  // padding: EdgeInsets.all(0),
                                  ),
                              'ul': Style(
                                  margin: Margins.symmetric(horizontal: 0),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 18)
                                  // padding: EdgeInsets.all(0),
                                  ),
                              'li': Style(textAlign: TextAlign.justify
                                  // padding: EdgeInsets.all(0),
                                  ),
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 10,
                ),
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
                          // provider.getTemperatureArticleData(
                          //     plantId: widget.plantId);
                        },
                        child: Text(
                          "Try Again?",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: neutral[70]!,
                                  ),
                        ))
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
