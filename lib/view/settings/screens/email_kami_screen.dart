// ignore_for_file: use_build_context_synchronously

import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/utils/widget/show_dialog/show_dialog_text_widget.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/email_kami_provider.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/setting_validator_provider.dart';
import 'package:provider/provider.dart';

class EmailKamiScreen extends StatelessWidget {
  const EmailKamiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmailKamiProvider>(context, listen: false);
    final validatorProvider =
        Provider.of<SettingValidatorProvider>(context, listen: false);
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.5),
          child: GestureDetector(
            onTap: () {
              provider.nomorHpC.clear();
              provider.emailC.clear();
              provider.catatanC.clear();
              Navigator.pop(context);
            },
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: keyboardIsOpened
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 48,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    if (provider.formKey.currentState!.validate()) {
                      await provider.sendComplaintEmails(
                        provider.nomorHpC.text,
                        provider.emailC.text,
                        provider.catatanC.text,
                      );
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
                  child: Consumer<EmailKamiProvider>(
                    builder: (context, provider, _) {
                      final state = provider.state;
                      if (state == MyState.initial) {
                        return Text(
                          'Kirim',
                          style: ThemeData().textTheme.labelLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: neutral[10],
                              ),
                        );
                      } else if (state == MyState.loading) {
                        return Container(
                          height: 25,
                          width: 25,
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Colors.white,
                          ),
                        );
                      } else {
                        return Text(
                          'Kirim',
                          style: ThemeData().textTheme.labelLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: neutral[10],
                              ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
      body: Stack(
        children: [
          Form(
            key: provider.formKey,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pastikan Anda melengkapi data\ndibawah ini, agar segera menerima balasan terkait keluhan Anda',
                        style: ThemeData().textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextFormField(
                        controller: provider.nomorHpC,
                        maxLength: 15,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        label: 'No. Handphone',
                        hint: 'Masukkan nomor',
                        helperText: 'Nomor anda terlindungi',
                        suffixIcon: IconButton(
                          onPressed: () {
                            provider.nomorHpC.clear();
                          },
                          icon: const Icon(
                            Icons.highlight_remove_outlined,
                            weight: 2,
                          ),
                        ),
                        validator: (value) =>
                            validatorProvider.validatePhone(value),
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
                            provider.emailC.clear();
                          },
                          icon: const Icon(
                            Icons.highlight_remove_outlined,
                            weight: 2,
                          ),
                        ),
                        validator: (value) =>
                            validatorProvider.validateEmail(value),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        hint: 'Masukkan catatanmu',
                        maxLines: 5,
                        controller: provider.catatanC,
                        maxLength: 255,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        label: 'Catatan',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.highlight_remove_outlined),
                          onPressed: () {
                            provider.catatanC.clear();
                          },
                        ),
                        helperText: 'Jangan ragu untuk menulis keluhan anda',
                        validator: (value) =>
                            validatorProvider.validateCatatan(value),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
