import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/utils/widget/show_dialog/show_dialog_text_widget.dart';
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
                      CustomTextFormField(
                        controller: provider.nomorHpC,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        label: 'No. Handphone',
                        hint: 'Masukkan nomor',
                        helperText: 'Nomor anda terlindungi',
                        suffixIcon: IconButton(
                          onPressed: () {
                            provider.formKey.currentState!.reset();
                          },
                          icon: const Icon(
                            Icons.highlight_remove_outlined,
                            weight: 2,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bagian ini tidak boleh kosong';
                          } else if (value.length < 10) {
                            return 'Minimal 10 angka';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        controller: provider.emailC,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        label: 'Email',
                        hint: 'Masukkan email',
                        helperText:
                            'Email ini akan digunakan untuk mengirim balasan untukmu',
                        suffixIcon: IconButton(
                          onPressed: () {
                            provider.formKey.currentState!.reset();
                          },
                          icon: const Icon(
                            Icons.highlight_remove_outlined,
                            weight: 2,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bagian ini tidak boleh kosong';
                          }
                          const emailRegex =
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                          if (!RegExp(emailRegex).hasMatch(value)) {
                            return 'Format email salah';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        hint: 'Masukkan catatanmu',
                        maxLines: 5,
                        controller: provider.nomorHpC,
                        maxLength: 255,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        label: 'Catatan',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.highlight_remove_outlined),
                          onPressed: () {
                            provider.formKey.currentState!.reset();
                          },
                        ),
                        helperText: 'Jangan ragu untuk menulis keluhan anda',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bagian ini tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.29,
                    bottom: 36,
                  ),
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (provider.formKey.currentState!.validate()) {
                        await customShowDialogText(
                          context: context,
                          title: 'Pusat Bantuan',
                          desc: 'Pertanyaan yang kamu ajukan telah kami rekam.',
                        );

                        if (context.mounted) {
                          provider.nomorHpC.clear();
                          provider.emailC.clear();
                          provider.catatanC.clear();
                          Navigator.pop(context);
                        }
                      }
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
