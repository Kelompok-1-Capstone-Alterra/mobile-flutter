import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/card_myplant_model.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_tanaman_screen.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/plant_gridview_provider.dart';
import 'package:provider/provider.dart';

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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Text(
                    'Total Tanaman : ',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Consumer<PlantGridviewProvider>(builder: (_, provider, __) {
                    return Text(provider.data.length.toString(),
                        style: Theme.of(context).textTheme.titleSmall);
                  }),
                ],
              ),
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
                          enabled: false,
                          maxLength: 30,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              FluentIcons.search_16_regular,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Cari Tanamanku',
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: neutral,
                              ),
                            ),
                          ),
                        );
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
      ),
    );
  }
}

class EmptyMyPlantWidget extends StatelessWidget {
  const EmptyMyPlantWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.68,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/empty_tanaman.svg',
              width: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Sepertinya kamu belum memiliki',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: neutral[50],
                  ),
            ),
            Text(
              'tanaman',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: neutral[50],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPlantGridviewWidget extends StatelessWidget {
  const MyPlantGridviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantGridviewProvider>(builder: (context, provider, _) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 6 / 7,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: provider.data.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              CardMyPlantWidget(
                data: provider.data[index],
              ),
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: provider.data[index].isSelected ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutQuint,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: primary[500],
                      // color: Colors.transparent,
                    ),
                    child: AnimatedScale(
                      scale: provider.data[index].isSelected ? 1 : 0,
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.elasticInOut,
                      child: const Center(
                        child: Icon(
                          FluentIcons.checkmark_circle_24_regular,
                          size: 40,
                          color: Colors.white,
                          // color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    overlayColor:
                        MaterialStatePropertyAll(Colors.black.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      if (provider.isDeleteMode == true) {
                        provider.onSelectedCard(
                            selectStatus: provider.data[index].isSelected,
                            indexSelected: index);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailTanamanScreen(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          );
        },
      );
    });
  }
}

class CardMyPlantWidget extends StatelessWidget {
  const CardMyPlantWidget({super.key, required this.data});

  final CardMyPlantModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              data.picture,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Wrap(
                direction: Axis.vertical,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.38,
                    child: AutoSizeText(
                      data.plantName,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 14,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.38,
                    child: AutoSizeText(
                      data.latinName,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: neutral[40],
                            overflow: TextOverflow.ellipsis,
                          ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
