import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view_model/masukan_saran_provider.dart';
import 'package:provider/provider.dart';

class MasukanSaranScreen extends StatelessWidget {
  MasukanSaranScreen({super.key});

  final TextEditingController masukanSaranC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MasukanSaranProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            FluentIcons.ios_arrow_ltr_24_filled,
          ),
        ),
        title: Text(
          'Masukan & Saran',
          style: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: ListView(
          shrinkWrap: true,

          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: provider.formKey,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/masukan_saran.png',
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Silahkan masukan dan saran kamu\ndisini',
                    style: ThemeData().textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Pemilihan kategori tidak boleh kosong";
                      }
                      return null;
                    },
                    hint: Text(
                      'Pilih Kategori',
                      style: ThemeData().textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: neutral, width: 2),
                      ),
                    ),
                    isExpanded: true,
                    icon: const Icon(FluentIcons.chevron_down_16_filled),
                    borderRadius: BorderRadius.circular(4),
                    style: ThemeData().textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                    items: const [
                      DropdownMenuItem(
                        value: 'Tanaman',
                        child: Text('Tanaman'),
                      ),
                      DropdownMenuItem(
                        value: 'Lokasi Penanaman',
                        child: Text('Lokasi Penanaman'),
                      ),
                    ],
                    onChanged: (_) {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextFormField(
                      maxLines: 4,
                      controller: masukanSaranC,
                      validator: (value) {
                        if (value!.length < 4) {
                          return "Min. 4 karakter";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: neutral[10],
                        hintText: 'Masukkan saran anda',
                        hintStyle: ThemeData().textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: neutral[50],
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        if (provider.formKey.currentState!.validate()) {}
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          primary,
                        ),
                      ),
                      child: Text(
                        'Kirim',
                        style: ThemeData().textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: neutral[10],
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
