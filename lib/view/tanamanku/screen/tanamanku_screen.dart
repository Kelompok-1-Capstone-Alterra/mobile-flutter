import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/plant_gridview_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/empty_myplant_widget.dart';
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
          Consumer<PlantGridviewProvider>(builder: (_, providers, __) {
        if (providers.selectedIndexCard.isEmpty) {
          return Container();
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
                            providers.deleteAllSelected();
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
          Consumer<PlantGridviewProvider>(builder: (_, provide, __) {
            if (provide.data.isEmpty) {
              return Container();
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
                    context.read<PlantGridviewProvider>().cancelAllSelected();
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
                  context.read<PlantGridviewProvider>().deleteModeOnClick();
                },
                icon: const Icon(
                  FluentIcons.delete_16_regular,
                ),
              ),
            );
          })
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Consumer<PlantGridviewProvider>(builder: (_, provider, __) {
              if (provider.isDeleteMode == false) {
                return Wrap(
                  children: [
                    Text(
                      'Total Tanaman : ',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(provider.data.length.toString(),
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
                Consumer<PlantGridviewProvider>(
                  builder: (_, provide, __) {
                    if (provide.data.isEmpty) {
                      return const EmptyMyPlantWidget();
                    } else if (provide.isDeleteMode == true) {
                      return Container();
                    } else {
                      return TextField(
                        // textAlign: TextAlign.justify,
                        textAlignVertical: TextAlignVertical.center,

                        onSubmitted: (value) {
                          // context.read<TambahkanTanamanProvider>().search();
                        },

                        textInputAction: TextInputAction.search,
                        maxLength: 30,
                        // controller:
                        //     context.read<TambahkanTanamanProvider>().searchField,

                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            splashRadius: 5,
                            splashColor: Colors.black.withOpacity(0.01),
                            highlightColor: Colors.black.withOpacity(0.05),
                            onPressed: () {
                              // context.read<TambahkanTanamanProvider>().clearSearch();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                          hintText: 'Cari Tanaman',
                          prefixIcon: const Icon(
                            FluentIcons.search_16_regular,
                          ),
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
                      //  TextField(
                      //   maxLength: 30,

                      //   decoration: InputDecoration(

                      //     hintText: 'Cari Tanamanku',
                      //     prefixIcon: const Icon(
                      //       FluentIcons.search_16_regular,
                      //     ),
                      //     focusColor:
                      //         Theme.of(context).inputDecorationTheme.focusColor,
                      //     focusedBorder: Theme.of(context)
                      //         .inputDecorationTheme
                      //         .focusedBorder,
                      //     border: Theme.of(context).inputDecorationTheme.border,
                      //     disabledBorder: Theme.of(context)
                      //         .inputDecorationTheme
                      //         .disabledBorder,
                      //   ),

                      //   // InputDecoration(
                      //   //   focusColor: primary,
                      //   //   focusedBorder: OutlineInputBorder(
                      //   //     borderRadius: BorderRadius.circular(10),
                      //   //     borderSide: const BorderSide(
                      //   //       color: primary,
                      //   //     ),
                      //   //   ),
                      //   //   prefixIcon: const Icon(
                      //   //     FluentIcons.search_16_regular,
                      //   //   ),
                      //   //   border: OutlineInputBorder(
                      //   //     borderRadius: BorderRadius.circular(10),
                      //   //   ),
                      //   //   hintText: 'Cari Tanamanku',
                      //   //   disabledBorder: OutlineInputBorder(
                      //   //     borderRadius: BorderRadius.circular(10),
                      //   //     borderSide: const BorderSide(
                      //   //       color: Colors.black,
                      //   //     ),
                      //   //   ),
                      //   // ),
                      // );
                    }
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                const MyPlantGridviewWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
