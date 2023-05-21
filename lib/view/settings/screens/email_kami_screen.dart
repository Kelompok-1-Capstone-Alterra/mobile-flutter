import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view_model/email_kami_provider.dart';
import 'package:provider/provider.dart';

class EmailKamiScreen extends StatelessWidget {
  const EmailKamiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmailKamiProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.5),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              FluentIcons.ios_arrow_ltr_24_filled,
            ),
          ),
        ),
        title: Text(
          'Agriplan',
          style: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: provider.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Pastikan Anda melengkapi data\ndibawah ini, agar segera menerima\nbalasan terkait keluhan Anda',
                        style: ThemeData().textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: provider.nomorHpC,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Bagian ini tidak boleh kosong";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          helperText: 'Nomor anda terlindungi',
                          helperStyle:
                              ThemeData().textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: neutral[100],
                                  ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'No. Handphone',
                          hintText: 'Masukkan nomor',
                          hintStyle: ThemeData().textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: neutral[40],
                              ),
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: primary, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      TextFormField(
                        controller: provider.emailC,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Bagian ini tidak boleh kosong";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          helperText:
                              'Email ini akan digunakan untuk mengirim balasan untukmu',
                          helperStyle:
                              ThemeData().textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: neutral[100],
                                  ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Email',
                          hintText: 'Masukkan Email',
                          hintStyle: ThemeData().textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: neutral[40],
                              ),
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: primary, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      TextFormField(
                        controller: provider.catatanC,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Bagian ini tidak boleh kosong";
                          }
                          return null;
                        },
                        maxLines: 2,
                        decoration: InputDecoration(
                          helperText: 'Jangan ragu untuk menulis keluhan anda',
                          helperStyle:
                              ThemeData().textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: neutral[100],
                                  ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Catatan',
                          hintText: 'Masukkan Catatan',
                          hintStyle: ThemeData().textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: neutral[40],
                              ),
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: primary, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.26,
                    bottom: 36,
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
