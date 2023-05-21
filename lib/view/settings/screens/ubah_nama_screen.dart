import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/ubah_nama_provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UbahNamaScreen extends StatelessWidget {
  const UbahNamaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UbahNamaProvider>(context, listen: false);
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
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 18,
            left: 16,
            right: 16,
          ),
          child: Form(
            key: provider.formKey,
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
                Consumer<UbahNamaProvider>(
                  builder: (context, ubahNamaProvider, _) => TextFormField(
                    controller: ubahNamaProvider.ubahNamaC,
                    maxLength: 30,
                    onChanged: (value) {
                      final isValid = provider.formKey.currentState!.validate();
                      ubahNamaProvider.setValidity(isValid && value.isNotEmpty);
                    },
                    validator: (nama) {
                      if (nama!.length < 2) {
                        return 'Min. 2 Karakter dan Maks. 30 Karakter';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      floatingLabelStyle: TextStyle(
                        color: ubahNamaProvider.isValid ||
                                provider.ubahNamaC.text.length > 2 ||
                                provider.ubahNamaC.text.isEmpty
                            ? primary
                            : error[400],
                      ),
                      labelText: 'Nama Lengkap',
                      hintText: 'Masukkan namamu',
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
                        onPressed: () => provider.ubahNamaC.clear(),
                        icon: const Icon(
                          Icons.highlight_remove_outlined,
                          weight: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Consumer<UbahNamaProvider>(
                  builder: (context, ubahNamaProvider, _) => SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        if (provider.formKey.currentState!.validate()) {}
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(primary),
                      ),
                      child: Text(
                        'Ubah Nama Lengkap',
                        style: ThemeData().textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: neutral[10]),
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
