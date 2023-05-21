import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/ubah_kata_sandi_provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UbahKataSandiScreen extends StatelessWidget {
  const UbahKataSandiScreen({super.key});
  final bool isFocused = false;
  final bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UbahKataSandiProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            FluentIcons.ios_arrow_ltr_24_filled,
          ),
        ),
        title: Text(
          'Ubah Kata Sandi',
          style: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 18),
        child: Form(
          key: provider.formKey,
          child: Consumer<UbahKataSandiProvider>(
            builder: (context, ubahKataSandi, _) => Column(
              children: [
                Center(
                  child: Text(
                    "Membuat kata sandi membantu Anda\n untuk menjaga keamanan akun",
                    style: ThemeData().textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: provider.ubahKataSandiC,
                  obscureText: ubahKataSandi.sandiObscureText,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    final isValid = provider.formKey.currentState!.validate();
                    ubahKataSandi.setValidity(isValid && value.isNotEmpty);
                  },
                  validator: (sandi) {
                    if (sandi!.length < 8 || sandi.length > 30) {
                      return 'Min. 8 Karakter dan Maks. 30 Karakter';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    floatingLabelStyle: TextStyle(
                      color: ubahKataSandi.isValid ||
                              provider.ubahKataSandiC.text.isEmpty ||
                              provider.ubahKataSandiC.text.length >= 8
                          ? primary
                          : error[400],
                    ),
                    labelText: 'Kata Sandi',
                    hintText: 'Masukkan kata sandi',
                    hintStyle: ThemeData().textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: neutral[40],
                        ),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: primary, width: 2),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => ubahKataSandi.sandiObscureTextStatus(),
                      icon: Icon(
                        ubahKataSandi.sandiObscureText
                            ? FluentIcons.eye_off_16_filled
                            : FluentIcons.eye_16_filled,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: provider.konfirmasiKataSandiC,
                  obscureText: ubahKataSandi.konfirmasiObscureText,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    final isValid = provider.formKey.currentState!.validate();
                    ubahKataSandi.setValidity(isValid && value.isNotEmpty);
                  },
                  validator: (konfirmasi) {
                    if (konfirmasi!.length < 8 || konfirmasi.length > 30) {
                      return 'Min. 8 Karakter dan Maks. 30 Karakter';
                    }
                    if (konfirmasi != provider.ubahKataSandiC.text) {
                      return 'Kata sandi tidak sesuai';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Konfirmasi',
                    floatingLabelStyle: TextStyle(
                      color: ubahKataSandi.isValid ||
                              provider.konfirmasiKataSandiC.text ==
                                  provider.ubahKataSandiC.text
                          ? primary
                          : error[400],
                    ),
                    hintText: 'Konfirmasi kata sandi',
                    hintStyle: ThemeData().textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: neutral[40],
                        ),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: primary, width: 2),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () =>
                          ubahKataSandi.konfirmasiObscureTextStatus(),
                      icon: Icon(
                        ubahKataSandi.konfirmasiObscureText
                            ? FluentIcons.eye_off_16_filled
                            : FluentIcons.eye_16_filled,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
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
                      'Ubah Kata Sandi',
                      style: ThemeData().textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: neutral[10]),
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
