import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/service_provider/get_my_plants_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_panen_mati_provider.dart';
import 'package:provider/provider.dart';

class AddProgresMatiScreen extends StatefulWidget {
  final int idTanaman;
  const AddProgresMatiScreen({super.key, this.idTanaman = 0});

  @override
  State<AddProgresMatiScreen> createState() => _AddProgresMatiScreenState();
}

class _AddProgresMatiScreenState extends State<AddProgresMatiScreen> {
  final _formKey = GlobalKey<FormState>();
  List<XFile> imagesFromPhone = [];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddPanenMatiProvider>(context, listen: false);
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Alasan Tanaman Mati',
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
              child: Consumer<AddPanenMatiProvider>(
                builder: (context, provider, _) {
                  return ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await provider.addDeadProgress(
                            context, widget.idTanaman);
                        if (context.mounted &&
                            provider.state == MyState.loaded) {
                          provider.refresh();
                          context.read<GetMyPlantsProvider>().getMyPlantsData();
                          Navigator.pop(context);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: primary,
                      minimumSize: const Size(double.infinity, 0),
                      elevation: 0,
                    ),
                    child: provider.state == MyState.loading
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
                },
              ),
            ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                DateFormat('dd MMM yyyy').format(DateTime.now()).toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Tanaman Kamu Mati',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                'Apa penyebab tanaman kamu mati?',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 20,
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  hoverColor: primary[200],
                  highlightColor: primary[200],
                  focusColor: Colors.transparent,
                  splashColor: primary[200],
                ),
                child: Consumer<AddPanenMatiProvider>(
                  builder: (context, provider, _) {
                    return DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: primary,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      hint: Text(
                        'Penyebab',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: neutral[50]),
                      ),
                      items: provider.penyebab
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: neutral),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Penyebab harus diisi.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        provider.selectedValue = value;
                      },
                      onSaved: (value) {
                        provider.setSelectedValue(value);
                      },
                      buttonStyleData: const ButtonStyleData(
                        height: 60,
                        padding: EdgeInsets.only(right: 10),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          FluentIcons.chevron_down_16_regular,
                          color: Colors.black45,
                        ),
                        iconSize: 25,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  },
                ),
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
                      'Alasan Tanaman Mati',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
                        hintText: 'Masukkan deskripsi progres tanaman kamu',
                        hintStyle: ThemeData().textTheme.bodyMedium!.copyWith(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                        imagesFromPhone = await ImagePicker().pickMultiImage();

                        if (imagesFromPhone.isNotEmpty) {
                          provider.addListImage(imagesFromPhone);
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
                              provider.addImage(pickedFileCamera);
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
                height: 30,
              ),
              Consumer<AddPanenMatiProvider>(
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
                    itemCount: provider.image.length,
                    itemBuilder: (context, index) {
                      final image = provider.image[index];
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              width: 100,
                              height: 100,
                              File(image.path),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 20,
                            child: GestureDetector(
                              onTap: () {
                                provider.removeImage(index);
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
      ),
    );
  }
}
