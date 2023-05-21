import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/toko_provider/base_model.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/toko/screen/detail_produk.dart';
import 'package:mobile_flutter/utils/widget/toko_widget/reusable_price.dart';
import 'package:provider/provider.dart';
import 'package:mobile_flutter/models/toko_provider/search_menu_provider.dart';
import 'package:mobile_flutter/models/toko_provider/toko_data.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ListAllProduk extends StatefulWidget {
  final List<BaseModel> allProducts;

  ListAllProduk({required this.allProducts});
  @override
  _ListAllProdukState createState() => _ListAllProdukState();
}

class _ListAllProdukState extends State<ListAllProduk> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: Consumer<ProductProvider>(builder: (context, productProvider, _) {
        List<BaseModel> allProducts = productProvider.allProducts;

        return SafeArea(
          child: Scaffold(
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
                    "Semua Produk",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<ProductProvider>(
                    builder: (context, productProvider, _) {
                      return TextField(
                        controller: searchController,
                        onChanged: (search) {
                          productProvider.filterProducts(search);
                          if (search.isEmpty) {
                            productProvider.setAllProducts(getAllProducts());
                          }
                        },
                        style: Theme.of(context).textTheme.bodyLarge,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          filled: true,
                          fillColor: neutral[10],
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            onPressed: () {
                              searchController.clear();
                            },
                            icon: const Icon(Icons.close),
                          ),
                          hintStyle: Theme.of(context).textTheme.bodyLarge,
                          hintText: "Cari Produk disini...",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: neutral[100]!),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: allProducts.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/toko_image/empty.png',
                                width: 200,
                                height: 200,
                                color: neutral[100],
                              ),
                              const Text('Produk belum tersedia dietalase.'),
                            ],
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          width: size.width,
                          height: size.height * 0.47,
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: allProducts.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 6 / 8,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemBuilder: (context, index) {
                              BaseModel current = allProducts[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Details(
                                        data: current,
                                        isCameFromProduk: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Card(
                                    margin: const EdgeInsets.all(0),
                                    elevation: 10,
                                    shadowColor: Colors.black26,
                                    surfaceTintColor: Colors.transparent,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    current.imageUrl),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 10,
                                                horizontal: 10,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.38,
                                                    child: AutoSizeText(
                                                      current.name,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      minFontSize: 14,
                                                      maxLines: 2,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.38,
                                                      child: ReuseablePrice(
                                                        price: current.price,
                                                      )),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.38,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 5.0),
                                                      child: AutoSizeText(
                                                        "${current.review.toString()}RB dilihat",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                        maxLines: 1,
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
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}