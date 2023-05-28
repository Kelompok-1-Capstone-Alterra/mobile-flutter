import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/utils/widget/show_dialog/show_dialog_text_widget.dart';

import 'package:mobile_flutter/view_model/setting_viewmodel/setting_validator_provider.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/ubah_kata_sandi_provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UbahKataSandiScreen extends StatelessWidget {
  const UbahKataSandiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UbahKataSandiProvider>(context, listen: false);
    final validatorProvider =
        Provider.of<SettingValidatorProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            provider.ubahKataSandiC.clear();
            provider.konfirmasiKataSandiC.clear();
            Navigator.pop(context);
          },
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
            builder: (context, ubahKataSandi, _) => SingleChildScrollView(
              child: Column(
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
                  CustomTextFormField(
                    controller: ubahKataSandi.ubahKataSandiC,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    maxLength: 20,
                    label: 'Kata Sandi',
                    hint: 'Masukkan kata sandi',
                    validator: (value) =>
                        validatorProvider.validatePassword(value),
                    obscureText: ubahKataSandi.sandiObscureText,
                    suffixIcon: IconButton(
                      onPressed: () => ubahKataSandi.sandiObscureTextStatus(),
                      icon: Icon(
                        ubahKataSandi.sandiObscureText
                            ? FluentIcons.eye_off_16_filled
                            : FluentIcons.eye_16_filled,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    controller: ubahKataSandi.konfirmasiKataSandiC,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    maxLength: 20,
                    label: 'Konfirmasi kata sandi',
                    hint: 'Masukkan konfirmasi kata sandi',
                    validator: (value) =>
                        validatorProvider.validateConfirmPassword(
                            value, provider.ubahKataSandiC.text),
                    obscureText: ubahKataSandi.konfirmasiObscureText,
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
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (provider.formKey.currentState!.validate()) {
                          await customShowDialogText(
                              context: context,
                              title: 'Ubah Kata Sandi',
                              desc: 'Kamu berhasil mengubah kata sandi akunmu');

                          if (context.mounted) {
                            provider.ubahKataSandiC.clear();
                            provider.konfirmasiKataSandiC.clear();
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
      ),
    );
  }
}
