import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/edit_nama_tanaman_provider.dart';
import 'package:provider/provider.dart';

class EditNamaTanamanScreen extends StatelessWidget {
  EditNamaTanamanScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<EditNamaTanamanProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Nama Tanaman Kamu',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            FluentIcons.chevron_left_16_regular,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 110,
                        backgroundImage: AssetImage(
                          'assets/images/sample_tomat.png',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        maxLength: 18,
                        decoration: const InputDecoration(
                          hintText: 'Tulis nama tanamanmu disini',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: neutral),
                          ),
                        ),
                        validator: (value) => provider.validateName(value),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    } else {}
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: primary,
                    minimumSize: const Size(double.infinity,
                        0), // Mengatur minimumSize dengan double.infinity
                  ),
                  child: Text(
                    'Simpan',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: neutral[10],
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
