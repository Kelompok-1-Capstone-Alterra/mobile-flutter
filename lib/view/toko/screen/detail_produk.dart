import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/models/toko_provider/base_model.dart';
import 'package:mobile_flutter/utils/widget/toko_widget/reusable_price.dart';
import 'package:mobile_flutter/utils/widget/toko_widget/reusable_button_chat.dart';
import 'package:mobile_flutter/view/toko/screen/deskripsi_produk.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

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
    return SafeArea(
      child: Scaffold(
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
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Icon(
                Icons.screen_share_outlined,
                color: neutral[90],
              ),
            ],
          ),
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Top Image
                SizedBox(
                  width: size.width,
                  height: size.height * 0.5,
                  child: Stack(
                    children: [
                      Hero(
                        tag: widget.isCameFromProduk
                            ? current.imageUrl
                            : current.id,
                        child: Container(
                          width: size.width,
                          height: size.height * 0.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(current.imageUrl),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.016,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              current.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.016,
                        ),
                        Row(
                          children: [
                            ReuseablePrice(
                              price: current.price,
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.016,
                        ),
                        Divider(
                          color: neutral[40],
                          height: 1,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: size.height * 0.016,
                        ),
                        InkWell(
                          onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  return Deskripsi(
                                    data: current,
                                    isCameFromProduk: true,
                                  );
                                }),
                              )),
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
                        SizedBox(
                          height: size.height * 0.020,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Deskripsi",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.016,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                current.simpleDeskripsi,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.03),
                  child: ReuseableButtonChat(
                    text: "Chat Penjual",
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: null,
      ),
    );
  }
}
