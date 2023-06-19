import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/view/dashboard/widget/product_card_widget.dart';
import 'package:mobile_flutter/view_model/service_provider/get_all_products_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../toko/screen/detail_produk.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required double horizontal,
  }) : _horizontal = horizontal;

  final double _horizontal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: const EdgeInsets.symmetric(vertical: 2),
      height: 210,
      child: Consumer<GetAllProductsProvider>(builder: (context, provider, _) {
        if (provider.state == MyState.loading) {
          return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding:
                  EdgeInsets.symmetric(horizontal: _horizontal, vertical: 10),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => Stack(
                    children: [
                      const ProductCardWidgetloading(),
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
                    width: 10,
                  ),
              itemCount: 4);
        } else if (provider.state == MyState.loaded) {
          if (provider.productsShuffled.isEmpty) {
            // kalau data nya kosong
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Center(
                      child: Text(
                        "Produk belum tersedia",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }

          return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding:
                  EdgeInsets.symmetric(horizontal: _horizontal, vertical: 10),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => Stack(
                    children: [
                      ProductCardWidget(
                        image: provider
                            .productsShuffled[index].productPictures![0],
                        price: provider.productsShuffled[index].productPrice!,
                        title: provider.productsShuffled[index].productName!,
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              pushNewScreen(context,
                                  screen: Details(
                                      productId:
                                          provider.productsShuffled[index].id!),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
              itemCount: provider.productsShuffled.length >= 20
                  ? 20
                  : provider.productsShuffled.length);
        } else {
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Center(
                  child: Text(
                    "error",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
