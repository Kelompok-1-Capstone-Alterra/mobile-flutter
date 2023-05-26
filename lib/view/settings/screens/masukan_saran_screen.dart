import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/utils/widget/show_dialog/show_dialog_text_widget.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/masukan_saran_provider.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/setting_validator_viewmodel.dart';
import 'package:provider/provider.dart';

class MasukanSaranScreen extends StatelessWidget {
  const MasukanSaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MasukanSaranProvider>(context, listen: false);
    final validatorProvider =
        Provider.of<SettingValidatorProvider>(context, listen: false);
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 36),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (provider.formKey.currentState!.validate()) {
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
    );
  }
}
