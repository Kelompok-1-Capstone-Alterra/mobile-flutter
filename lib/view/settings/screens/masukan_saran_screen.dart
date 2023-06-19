// ignore_for_file: use_build_context_synchronously

import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/utils/widget/show_dialog/show_dialog_text_widget.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/masukan_saran_provider.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/setting_validator_provider.dart';
import 'package:provider/provider.dart';

class MasukanSaranScreen extends StatelessWidget {
  const MasukanSaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MasukanSaranProvider>(context, listen: false);
    final validatorProvider =
        Provider.of<SettingValidatorProvider>(context, listen: false);
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            provider.masukanSaranC.clear();
            Navigator.pop(context);
          },
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
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (provider.formKey.currentState!.validate()) {
                      await provider
                          .sendSuggestion(provider.masukanSaranC.text);
                      await customShowDialogText(
                        context: context,
                        title: 'Masukan & Saran',
                        desc: 'Masukan yang kamu berikan telah kami rekam.',
                      );
                      if (context.mounted) {
                        provider.masukanSaranC.clear();

                        Navigator.pop(context);
                      }
                    }
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      primary,
                    ),
                  ),
                  child: Consumer<MasukanSaranProvider>(
                    builder: (context, masukanSaranProvider, _) {
                      final state = masukanSaranProvider.state;
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
      body: Form(
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
                  CustomTextFormField(
                    controller: provider.masukanSaranC,
                    textInputAction: TextInputAction.done,
                    maxLength: 255,
                    maxLines: 5,
                    hint: 'Masukkan saran anda',
                    validator: (value) =>
                        validatorProvider.validateMasukanSaran(value),
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
