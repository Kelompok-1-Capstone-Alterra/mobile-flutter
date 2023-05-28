import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/models/toko_model.dart';
import 'package:mobile_flutter/view/toko/widget/toko_widget/reusable_price.dart';
import 'package:mobile_flutter/view/toko/widget/toko_widget/reusable_button_chat.dart';
import 'package:mobile_flutter/view/toko/screen/deskripsi_produk.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class Details extends StatefulWidget {
  const Details({
    required this.data,
    super.key,
    required this.isCameFromProduk,
  });

  final BaseModel data;
  final bool isCameFromProduk;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    BaseModel current = widget.data;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
              "Barang",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Image.asset(
              'assets/images/toko_image/share.png',
              color: neutral[100],
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          height: 300,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                        ),
                        itemCount: 1,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          return Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(current.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      const Positioned(
                        bottom: 10,
                        right: 10,
                        child: Text(
                          '1/1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.016),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              current.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.016),
                        Row(
                          children: [
                            ReuseablePrice(
                              price: current.price,
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
                            FocusManager.instance.primaryFocus?.unfocus();
                            pushNewScreen(
                              context,
                              screen: Deskripsi(
                                data: current,
                                isCameFromProduk: true,
                              ),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Selengkapnya",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Icon(
                                FluentIcons.ios_chevron_right_20_regular,
                                color: neutral[90],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.020),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Deskripsi",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Html(
                                data: current.simpleDeskripsi,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 65),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
      ),
    );
  }
}
