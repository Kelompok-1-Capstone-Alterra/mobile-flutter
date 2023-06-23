import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/converter/remove_html_tags.dart';
import 'package:provider/provider.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/toko/screen/deskripsi_produk.dart';
import 'package:mobile_flutter/view/toko/widget/toko_widget/reusable_price.dart';
import 'package:mobile_flutter/view/toko/widget/toko_widget/reusable_button_chat.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mobile_flutter/models/toko/get_product_by_id.dart';
import 'package:mobile_flutter/services/toko/service_get_product.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/carousel_provider.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/deskripsi_provider.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/url_image.dart';

class Details extends StatefulWidget {
  const Details({
    required this.productId,
    Key? key,
  }) : super(key: key);

  final int productId;

  @override
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<Details> {
  CarouselController carouselController = CarouselController();

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          icon: Icon(
            FluentIcons.ios_arrow_ltr_24_filled,
            color: Colors.grey[900],
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Produk",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Image.asset(
              'assets/images/toko_image/share.png',
              color: neutral[100],
            ),
          ],
        ),
      ),
      body: Consumer<CurrentProductProvider>(
        builder: (context, currentProductProvider, _) {
          final currentProduct = currentProductProvider.currentProduct;
          final isLoading = currentProductProvider.isLoading;

          return isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(primary[300]!),
                  ),
                )
              : currentProduct != null
                  ? Stack(
                      children: [
                        ListView(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Consumer<CarouselProvider>(
                                  builder: (context, carouselProvider, _) {
                                    final currentIndex =
                                        carouselProvider.currentSlide + 1;
                                    final totalImages = currentProduct
                                        .product!.productPictures!.length;
                                    return Stack(
                                      children: [
                                        CarouselSlider.builder(
                                          carouselController:
                                              carouselController,
                                          options: CarouselOptions(
                                            height: 300,
                                            autoPlay: false,
                                            enlargeCenterPage: true,
                                            aspectRatio: 2,
                                            viewportFraction: 1,
                                            onPageChanged: (index, reason) {
                                              carouselProvider
                                                  .setCurrentSlide(index);
                                            },
                                          ),
                                          itemCount: currentProduct
                                              .product!.productPictures!.length,
                                          itemBuilder: (BuildContext context,
                                              int index, int realIndex) {
                                            return
                                                // Container(
                                                //   width: double.infinity,
                                                //   height: MediaQuery.of(context)
                                                //       .size
                                                //       .width,
                                                //   decoration: BoxDecoration(
                                                //     image: DecorationImage(
                                                //       image: NetworkImage(
                                                //         '${UrlImage.imgurl}${currentProduct.product!.productPictures![index]}',
                                                //       ),
                                                //       fit: BoxFit.cover,
                                                //     ),
                                                //   ),

                                                // );
                                                Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${UrlImage.imgurl}${currentProduct.product!.productPictures![index]}'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Positioned.fill(
                                                    child: Image.network(
                                                      '${UrlImage.imgurl}${currentProduct.product!.productPictures![index]}',
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return Container(
                                                            width: 130,
                                                            height: 105,
                                                            color: neutral[20],
                                                            child: const Icon(Icons
                                                                .image_not_supported_outlined));
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          right: 10,
                                          child: Text(
                                            '$currentIndex/$totalImages',
                                            style: TextStyle(
                                              color: neutral[10],
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 2.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: size.height * 0.016),
                                      SizedBox(
                                        child: AutoSizeText(
                                          currentProduct.product!.productName!,
                                          overflow: TextOverflow.ellipsis,
                                          minFontSize: 20,
                                          maxLines: 2,
                                        ),
                                      ),
                                      SizedBox(height: size.height * 0.016),
                                      Row(
                                        children: [
                                          ReuseablePrice(
                                            price: currentProduct
                                                .product!.productPrice!
                                                .toDouble(),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: size.height * 0.016),
                                      Divider(
                                        color: neutral[40],
                                        height: 1,
                                        thickness: 1,
                                      ),
                                      SizedBox(height: size.height * 0.016),
                                      InkWell(
                                        onTap: () {
                                          pushNewScreen(
                                            context,
                                            screen: Deskripsi(
                                              productId: widget.productId,
                                            ),
                                            withNavBar: true,
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Selengkapnya",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            Icon(
                                              FluentIcons
                                                  .ios_chevron_right_20_regular,
                                              color: neutral[90],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: size.height * 0.020),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Deskripsi",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 7),
                                            child: Text(
                                              parseHtmlString(currentProduct
                                                  .product!
                                                  .productDescription!),
                                              maxLines: 5,
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )),
                                        ],
                                      ),
                                      const SizedBox(height: 65),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: MediaQuery.of(context).padding.bottom + 16,
                          child: Center(
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
