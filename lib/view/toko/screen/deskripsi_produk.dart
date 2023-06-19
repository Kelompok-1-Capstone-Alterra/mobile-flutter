import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/toko/widget/toko_widget/reusable_button_chat.dart';
import 'package:mobile_flutter/view/toko/screen/detail_produk.dart';
import 'package:mobile_flutter/view/toko/widget/toko_widget/reusable_price.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:mobile_flutter/models/toko/get_product_by_id.dart';
import 'package:mobile_flutter/services/toko/service_get_product.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/url_image.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/deskripsi_provider.dart';

class Deskripsi extends StatefulWidget {
  const Deskripsi({
    required this.productId,
    Key? key,
  }) : super(key: key);

  final int productId;

  @override
  State<Deskripsi> createState() => _DeskripsiState();
}

class _DeskripsiState extends State<Deskripsi> {
  @override
  void initState() {
    super.initState();
    final currentProductProvider =
        Provider.of<CurrentProductProvider>(context, listen: false);
    fetchProductById(widget.productId, currentProductProvider);
  }

  Future<void> fetchProductById(
    int productId,
    CurrentProductProvider currentProductProvider,
  ) async {
    ProductService productService = ProductService();
    currentProductProvider.setIsLoading(true);
    GetProductById? product = await productService.fetchProductById(productId);

    if (product.product != null) {
      currentProductProvider.setCurrentProduct(product);
      currentProductProvider.setIsLoading(false);
    } else {
      currentProductProvider.setIsLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: neutral[10],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            FluentIcons.ios_arrow_ltr_24_filled,
            color: neutral[90],
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Deskripsi",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Image.asset(
              'assets/images/toko_image/share.png',
              color: neutral[100],
            )
          ],
        ),
      ),
      body: Consumer<CurrentProductProvider>(
        builder: (context, provider, _) {
          return provider.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      primary[300]!,
                    ),
                  ),
                )
              : provider.currentProduct != null
                  ? Stack(
                      children: [
                        ListView(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 2.0,
                                  ),
                                  child: SizedBox(
                                    width: size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: provider
                                                            .currentProduct
                                                            ?.product
                                                            ?.productDescription !=
                                                        null
                                                    ? Html(
                                                        data: provider
                                                            .currentProduct!
                                                            .product!
                                                            .productDescription!,
                                                      )
                                                    : Container(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 10.0,
                                  ),
                                  child: SizedBox(
                                    width: size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Produk Terkait",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.width * 0.70,
                                  width: size.width,
                                  child: provider.currentProduct
                                                  ?.relatedProducts !=
                                              null &&
                                          provider.currentProduct!
                                              .relatedProducts!.isNotEmpty
                                      ? ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: provider.currentProduct!
                                              .relatedProducts!.length,
                                          itemBuilder: (context, index) {
                                            RelatedProduct current = provider
                                                .currentProduct!
                                                .relatedProducts![index];
                                            return GestureDetector(
                                              onTap: () {
                                                pushNewScreen(
                                                  context,
                                                  screen: Details(
                                                    productId: current.id!,
                                                  ),
                                                  withNavBar: false,
                                                  pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                );
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 0),
                                                child: Card(
                                                  elevation: 20,
                                                  shadowColor: Colors.black26,
                                                  surfaceTintColor:
                                                      Colors.transparent,
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  color: Colors.white,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          height:
                                                              size.width * 0.35,
                                                          width:
                                                              size.width * 0.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image: NetworkImage(
                                                                  '${UrlImage.imgurl}${current.productPictures![0]}'),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Positioned.fill(
                                                                child: Image
                                                                    .network(
                                                                  '${UrlImage.imgurl}${current.productPictures![0]}',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorBuilder:
                                                                      (context,
                                                                          error,
                                                                          stackTrace) {
                                                                    return Container(
                                                                        width:
                                                                            130,
                                                                        height:
                                                                            105,
                                                                        color: neutral[
                                                                            20],
                                                                        child: const Icon(
                                                                            Icons.image_not_supported_outlined));
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 10,
                                                              horizontal: 10,
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  child:
                                                                      AutoSizeText(
                                                                    current
                                                                        .productName!,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    minFontSize:
                                                                        14,
                                                                    maxLines: 2,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .titleSmall,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.38,
                                                                  child:
                                                                      ReuseablePrice(
                                                                    price: current
                                                                        .productPrice!
                                                                        .toDouble(),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          3),
                                                                  child:
                                                                      SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.38,
                                                                    child:
                                                                        AutoSizeText(
                                                                      "${current.productSeen}RB dilihat",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall,
                                                                      maxLines:
                                                                          1,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      : Container(
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/toko_image/empty_product.svg',
                                                width: size.width * 0.5,
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                'Tidak ada produk terkait yang tersedia',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                                const SizedBox(height: 65),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ReuseableButtonChat(
                              text: "Chat Penjual",
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    )
                  : const Center(
                      child: Text("Mohon maaf belum ada deskripsi"),
                    );
        },
      ),
    );
  }
}
