import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_tanaman_screen.dart';
import 'package:mobile_flutter/view_model/service_provider/get_my_plants_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_plant_details.dart';
import 'package:mobile_flutter/view_model/service_provider/post_add_myplant_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_constant.dart';
import '../../../utils/themes/custom_color.dart';

class TambahNamaTanamanScreen extends StatefulWidget {
  const TambahNamaTanamanScreen({super.key, required this.location});

  final String location;

  @override
  State<TambahNamaTanamanScreen> createState() =>
      _TambahNamaTanamanScreenState();
}

class _TambahNamaTanamanScreenState extends State<TambahNamaTanamanScreen> {
  final TextEditingController _addNameControler = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // print(widget.location);
    _addNameControler.text =
        context.read<GetPlantDetailsProvider>().plantDetails!.name!;
    context.read<PostAddMyPlantProvider>().state = MyState.initial;
    super.initState();
  }

  void navigationToDetailMyPlant() {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (context) => DetailTanamanScreen(
              idTanaman: context
                  .read<GetPlantDetailsProvider>()
                  .plantDetails!
                  .plantId!),
        ),
        (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final providerDetail =
        Provider.of<GetPlantDetailsProvider>(context, listen: false);

    // print(providerDetail.plantDetails!.plantId);
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Nama Tanaman Kamu',
          maxFontSize: 20,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            FluentIcons.chevron_left_16_regular,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: MediaQuery.of(context).size.width * 0.55,
                width: MediaQuery.of(context).size.width * 0.55,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.network(
                  "${AppConstant.imgUrl}${providerDetail.plantDetails!.picture}",
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
                        height: MediaQuery.of(context).size.width * 0.55,
                        width: MediaQuery.of(context).size.width * 0.55,
                        color: neutral[20]!,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                      color: neutral[20],
                      child: const Icon(Icons.image_not_supported_outlined)),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _addNameControler,
                // initialValue: providerDetail.plantDetails!.name,

                maxLength: 18,
                decoration: const InputDecoration(
                  hintText: 'Tulis nama tanamanmu disini',
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              keyboardIsOpened
                  ? Consumer<PostAddMyPlantProvider>(
                      builder: (context, provider, _) {
                      return ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              provider.state != MyState.loading) {
                            try {
                              await provider.addMyPlant(
                                plantId: providerDetail.plantDetails!.plantId!,
                                location: widget.location,
                                namedPlant: _addNameControler.text,
                              );
                              if (context.mounted) {
                                context
                                    .read<GetMyPlantsProvider>()
                                    .getMyPlantsData();
                              }
                            } catch (e) {
                              throw Exception(e);
                            }
                          }
                          // print(
                          //     "${provider.postResponse!.myplantId} ${provider.postResponse!.plantsId}");
                          if (provider.postResponse!.myplantId != null &&
                              provider.state != MyState.loading) {
                            navigationToDetailMyPlant();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          backgroundColor: primary,
                          minimumSize: const Size(double.infinity,
                              0), // Mengatur minimumSize dengan double.infinity
                        ),
                        child: provider.state == MyState.loading
                            ? Container(
                                width: 20,
                                height: 20,
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: neutral[10],
                                ),
                              )
                            : Text(
                                'Simpan',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      color: neutral[10],
                                    ),
                              ),
                      );
                    })
                  : const SizedBox.shrink(),
              keyboardIsOpened
                  ? Consumer<PostAddMyPlantProvider>(
                      builder: (context, providers, _) {
                      return TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              providers.state != MyState.loading) {
                            try {
                              await providers.addMyPlant(
                                plantId: providerDetail.plantDetails!.plantId!,
                                location: widget.location,
                                namedPlant: providerDetail.plantDetails!.name!,
                              );
                              if (context.mounted) {
                                context
                                    .read<GetMyPlantsProvider>()
                                    .getMyPlantsData();
                              }
                            } catch (e) {
                              throw Exception(e);
                            }
                          }
                          // print(
                          //     "${provider.postResponse!.myplantId} ${provider.postResponse!.plantsId}");
                          if (providers.postResponse!.myplantId != null &&
                              providers.state != MyState.loading) {
                            navigationToDetailMyPlant();
                          }
                          // if (providers.state != MyState.loading) {
                          //   try {
                          //     providers.addMyPlant(
                          //       plantId: providerDetail.plantDetails!.plantId!,
                          //       location: widget.location,
                          //       namedPlant: providerDetail.plantDetails!.name!,
                          //     );

                          //     Navigator.of(context).pushAndRemoveUntil(
                          //         CupertinoPageRoute(
                          //           builder: (context) => DetailTanamanScreen(
                          //               idTanaman:
                          //                   providers.postResponse!.myplantId!),
                          //         ),
                          //         (route) => route.isFirst);
                          //   } catch (e) {
                          //     throw Exception(e.toString());
                          //   }
                          // }
                        },
                        child: Text(
                          "Gunakan nama bawaan",
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: providers.state == MyState.loading
                                        ? neutral[50]
                                        : primary[300],
                                  ),
                        ),
                      );
                    })
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
