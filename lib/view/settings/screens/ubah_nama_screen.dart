import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/utils/widget/show_dialog/show_dialog_text_widget.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/setting_validator_viewmodel.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/ubah_nama_provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UbahNamaScreen extends StatelessWidget {
  const UbahNamaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UbahNamaProvider>(context, listen: false);
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
          'Ubah Nama',
          style: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          left: 16,
          right: 16,
        ),
        child: Form(
          key: provider.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Gunakan nama asli Anda untuk\n memudahkan verifikasi ",
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
                  controller: provider.ubahNamaC,
                  textInputAction: TextInputAction.done,
                  maxLength: 30,
                  label: 'Nama',
                  hint: 'Masukkan namamu',
                  suffixIcon: IconButton(
                    onPressed: () {
                      provider.ubahNamaC.clear();
                    },
                    icon: const Icon(
                      Icons.highlight_remove_outlined,
                      weight: 2,
                    ),
                  ),
                  validator: (value) => validatorProvider.validateName(value),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (provider.formKey.currentState!.validate()) {
                        await customShowDialogText(
                          context: context,
                          title: 'Ubah Nama',
                          desc: 'Kamu berhasil mengubah namamu',
                        );

                        if (context.mounted) {
                          provider.ubahNamaC.clear();
                          Navigator.pop(context);
                        }
                      }
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(primary),
                    ),
                    child: Text(
                      'Ubah Nama',
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
