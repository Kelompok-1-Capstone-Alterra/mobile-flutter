import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_flutter/utils/app_constant.dart';
import 'package:mobile_flutter/utils/converter/convert_date.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/edit_progres_mingguan_provider.dart';
import 'package:provider/provider.dart';

class EditProgressMingguanScreen extends StatefulWidget {
  final int idTanaman;
  final int idProgress;
  const EditProgressMingguanScreen(
      {super.key, this.idTanaman = 0, this.idProgress = 0});

  @override
  State<EditProgressMingguanScreen> createState() =>
      _EditProgressMingguanScreenState();
}

class _EditProgressMingguanScreenState
    extends State<EditProgressMingguanScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<EditProgresMingguanProvider>()
          .getProgresDetail(widget.idTanaman, widget.idProgress);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<EditProgresMingguanProvider>(context, listen: false);
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    List<XFile> imagesFromPhone = [];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Edit Progres Mingguan',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            provider.refresh();
          },
          icon: const Icon(
            FluentIcons.chevron_left_16_regular,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: keyboardIsOpened
          ? const SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.02,
                left: 20,
                right: 20,
              ),
              child: Consumer<EditProgresMingguanProvider>(
                builder: (context, provider, _) {
                  if (provider.state == MyState.initial) {
                    return const SizedBox.shrink();
                  } else if (provider.state == MyState.loading) {
                    return const SizedBox.shrink();
                  } else if (provider.state == MyState.loaded) {
                    return ElevatedButton(
                      onPressed: provider.isButtonDisabled
                          ? null
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                await provider.editWeeklyProgres(
                                  context,
                                  widget.idTanaman,
                                  widget.idProgress,
                                );

                                // if (context.mounted) {
                                //   provider.refresh();
                                //   Provider.of<TanamankuProvider>(context,
                                //           listen: false)
                                //       .setSelectedIndex(context, 1);
                                //   Navigator.pop(context);
                                // }
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor: primary,
                        minimumSize: const Size(double.infinity, 0),
                        elevation: 0,
                      ),
                      child: provider.stateTombol == MyState.loading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: neutral[10],
                              ),
                            )
                          : Text(
                              'Simpan progres',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: neutral[10],
                                  ),
                            ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
      body: Consumer<EditProgresMingguanProvider>(
        builder: (context, provider, _) {
          if (provider.state == MyState.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.state == MyState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.state == MyState.loaded) {
            final String fromMonth =
                formatDateMMM(provider.getProgresDetailData.progress!.from!);

            final String toMonth =
                formatDateMMM(provider.getProgresDetailData.progress!.to!);

            String fromFormat = '';

            if (fromMonth == toMonth) {
              fromFormat =
                  formatDatedd(provider.getProgresDetailData.progress!.from!);
            } else {
              fromFormat = formatDateddMMM(
                  provider.getProgresDetailData.progress!.from!);
            }

            final String toFormat = formatDateddMMMyyyy(
                provider.getProgresDetailData.progress!.to!);
            return Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: Form(
                key: _formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    AutoSizeText(
                      "$fromFormat - $toFormat",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: neutral[50],
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Kesehatan Tanaman Kamu',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      'Bagaimana kesehatan tanaman kamu saat ini?',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<EditProgresMingguanProvider>(
                      builder: (context, provider, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (final item in provider.qualityItems)
                              GestureDetector(
                                onTap: () {
                                  final index =
                                      provider.qualityItems.indexOf(item);
                                  provider.toggleItemSelection(index);
                                  provider.checkAllItemsUnselected();
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: item['isSelected'] &&
                                                  item['label'] ==
                                                      'Sangat Buruk'
                                              ? error[400]
                                              : item['isSelected'] &&
                                                      item['label'] == 'Buruk'
                                                  ? error
                                                  : item['isSelected'] &&
                                                          item['label'] ==
                                                              'Sehat'
                                                      ? primary
                                                      : item['isSelected'] &&
                                                              item['label'] ==
                                                                  'Sangat Sehat'
                                                          ? primary[400]
                                                          : neutral[40],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          FluentIcons.plant_grass_20_regular,
                                          color: neutral[10],
                                        ),
                                      ),
                                    ),
                                    Text(
                                      item['label'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: primary[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Catatan Progres',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color: neutral,
                                ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: provider.descriptionController,
                            maxLines: 4,
                            maxLength: 100,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: neutral[10],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText:
                                  'Masukkan deskripsi progres tanaman kamu',
                              hintStyle:
                                  ThemeData().textTheme.bodyMedium!.copyWith(
                                        color: neutral[50],
                                        fontWeight: FontWeight.w400,
                                      ),
                            ),
                            validator: (value) => provider.validateDesc(value),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        color: primary[200],
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () async {
                              imagesFromPhone =
                                  await ImagePicker().pickMultiImage();

                              if (imagesFromPhone.isNotEmpty) {
                                await provider.addListImage(imagesFromPhone);
                              }
                            },
                            child: Text(
                              'Tambahkan foto tanamanmu',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '|',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: neutral),
                              ),
                              TextButton(
                                onPressed: () async {
                                  final pickedFileCamera = await ImagePicker()
                                      .pickImage(source: ImageSource.camera);
                                  if (pickedFileCamera != null) {
                                    await provider
                                        .addCameraImage(pickedFileCamera);
                                  }
                                },
                                child: const Icon(
                                  FluentIcons.camera_20_filled,
                                  color: neutral,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<EditProgresMingguanProvider>(
                      builder: (context, provider, _) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: provider.imageList.length,
                          itemBuilder: (context, index) {
                            final image = provider.imageList[index];
                            return provider.imageList.isEmpty
                                ? const SizedBox.shrink()
                                : Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          '${AppConstant.imgUrl}${image['image_path']}',
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 100,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Container(
                                            width: 100,
                                            height: 100,
                                            color: neutral[20],
                                            child: const Icon(Icons
                                                .image_not_supported_outlined),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 20,
                                        child: GestureDetector(
                                          onTap: () {
                                            provider.removeImage(
                                                index, image['image_path']);
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors
                                                  .black12, // Ganti dengan warna latar belakang yang diinginkan
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(2.0),
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: [
                  Icon(
                    Icons.error,
                    size: 40,
                    color: neutral[40]!,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Terjadi kesalahan.",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: neutral[50]!,
                        ),
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Kembali",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: error,
                                    ),
                          )),
                      TextButton(
                          onPressed: () {
                            provider.getProgresDetail(
                                widget.idTanaman, widget.idProgress);
                          },
                          child: Text(
                            "Coba Lagi?",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: neutral[70]!,
                                    ),
                          )),
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
