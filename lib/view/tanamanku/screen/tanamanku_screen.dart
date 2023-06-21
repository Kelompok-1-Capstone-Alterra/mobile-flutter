import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/service_provider/get_my_plants_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/myplant_gridview_widget.dart';

class TanamankuScreen extends StatelessWidget {
  const TanamankuScreen({super.key});

  final isEmpty = false;
  //tambah line satu
  final double horizontal = 20;
  final double vertical = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          Consumer<GetMyPlantsProvider>(builder: (_, providers, __) {
        //-------- atur floating acction button hapus dibawah appear

        if (providers.selectedIndexCard.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              surfaceTintColor: Colors.transparent,
              elevation: 10,
              shadowColor: Colors.black26,
              margin: const EdgeInsets.all(0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width * 0.91,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${providers.selectedIndexCard.length} tanaman terpilih",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Wrap(
                      children: [
                        TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(
                                  error.withOpacity(0.1))),
                          onPressed: () {
                            providers.cancelAllSelected();
                          },
                          child: Text(
                            "Batal",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: error),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: error,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          onPressed: () {
                            deleteComfirmDialog(context);
                            // providers.deleteAllSelected();
                          },
                          child: Text(
                            "Hapus",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
      }),
      appBar: AppBar(
        title: Text(
          'Tanamanku',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          // ---------atur icon sampah jadi tulisan batalkan

          Consumer<GetMyPlantsProvider>(builder: (_, provide, __) {
            if (provide.myPlants.isEmpty) {
              return const SizedBox.shrink();
            }

            if (provide.isDeleteMode == true) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(
                      error.withOpacity(0.1),
                    ),
                  ),
                  onPressed: () {
                    context.read<GetMyPlantsProvider>().cancelAllSelected();
                  },
                  child: Text(
                    "Batalkan",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: error,
                        ),
                  ),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () {
                  context.read<GetMyPlantsProvider>().deleteModeOnClick();
                },
                icon: const Icon(
                  FluentIcons.delete_16_regular,
                ),
              ),
            );
          })
        ],
      ),

      //
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            //
            // ngatur tulisan counter tanamanku atau
            // jadi tulisan pilih tanaman yang mau di hapus

            Consumer<GetMyPlantsProvider>(builder: (_, provider, __) {
              if (provider.isDeleteMode == false) {
                return Wrap(
                  children: [
                    Text(
                      'Total Tanaman : ',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(provider.myPlants.length.toString(),
                        style: Theme.of(context).textTheme.titleSmall),
                  ],
                );
              } else {
                return Text(
                  'Pilih tanaman yang ingin anda hapus !',
                  style: Theme.of(context).textTheme.titleSmall,
                );
              }
            }),
            const SizedBox(
              height: 14,
            ),
            Column(
              children: [
                //
                //-------------- ini ngatur text field pencarian muncul atau kaga
                Consumer<GetMyPlantsProvider>(
                  builder: (_, providerMyPlants, __) {
                    // if (providerMyPlants.myPlants.isEmpty) {
                    //   return const EmptyMyPlantWidget();
                    // }

                    //kalau tanaman nya kosong
                    if (providerMyPlants.isDeleteMode == true ||
                        providerMyPlants.myPlants.isEmpty) {
                      return Container();
                    } else {
                      return TextField(
                        controller: context
                            .read<GetMyPlantsProvider>()
                            .searchFieldController,
                        // textAlign: TextAlign.justify,
                        textAlignVertical: TextAlignVertical.center,

                        onSubmitted: (value) {
                          context.read<GetMyPlantsProvider>().search();
                        },
                        textInputAction: TextInputAction.search,
                        maxLength: 30,

                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 18),
                          suffixIcon: IconButton(
                            splashRadius: 5,
                            splashColor: Colors.black.withOpacity(0.01),
                            highlightColor: Colors.black.withOpacity(0.05),
                            onPressed: () {
                              context
                                  .read<GetMyPlantsProvider>()
                                  .clearSearchField();
                            },
                            icon: Icon(
                              Icons.close,
                              color: neutral[70],
                              size: 20,
                            ),
                          ),
                          hintText: 'Cari Tanaman',
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 15, right: 10),
                            child: Icon(
                              FluentIcons.search_16_regular,
                              size: 30,
                            ),
                          ),
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: neutral[40]),
                          focusColor:
                              Theme.of(context).inputDecorationTheme.focusColor,
                          focusedBorder: Theme.of(context)
                              .inputDecorationTheme
                              .focusedBorder,
                          border: Theme.of(context).inputDecorationTheme.border,
                          disabledBorder: Theme.of(context)
                              .inputDecorationTheme
                              .disabledBorder,
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 14,
                ),

                //
                // --------------ini widget gridview tanamanya
                const MyPlantGridviewWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> deleteComfirmDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Apa kamu yakin\nmenghapus tanaman\nini ?',
          style: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
        ),
        content: Text(
          'Jika kamu yakin menghapus tanaman ini. Data yang tersimpan akan ikut terhapus ',
          style: ThemeData().textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(neutral.withOpacity(0.1)),
            ),
            child: Text(
              'Batal',
              style: ThemeData().textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: neutral[40],
                  ),
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<GetMyPlantsProvider>().deleteAllSelected();
              Navigator.pop(context);
            },
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(primary.withOpacity(0.1)),
            ),
            child: Text(
              'Ya, Hapus',
              style: ThemeData().textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: primary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
