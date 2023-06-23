import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/app_constant.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/edit_nama_tanaman_provider.dart';
import 'package:provider/provider.dart';

class EditNamaTanamanScreen extends StatefulWidget {
  final int idTanaman;
  final String defaultValue;
  final String picture;

  const EditNamaTanamanScreen({
    super.key,
    this.idTanaman = 0,
    this.defaultValue = '',
    this.picture = '',
  });

  @override
  State<EditNamaTanamanScreen> createState() => _EditNamaTanamanScreenState();
}

class _EditNamaTanamanScreenState extends State<EditNamaTanamanScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<EditNamaTanamanProvider>().namaController.text =
        widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<EditNamaTanamanProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 220,
                      height: 220,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.network(
                        '${AppConstant.imgUrl}$widget.picture',
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: neutral[20]),
                          child: const Icon(Icons.image_not_supported_outlined),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: provider.namaController,
                      maxLength: 18,
                      decoration: const InputDecoration(
                        hintText: 'Tulis nama tanamanmu disini',
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(),
                      ),
                      validator: (value) => provider.validateName(value),
                    ),
                  ],
                ),
              ),
              Consumer<EditNamaTanamanProvider>(
                  builder: (context, provider, _) {
                return ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await provider.changeMyPlantName(
                          context, widget.idTanaman);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: primary,
                    minimumSize: const Size(double.infinity,
                        0), // Mengatur minimumSize dengan double.infinity
                  ),
                  child: provider.state == MyState.loading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: neutral[10],
                          ),
                        )
                      : Text(
                          'Simpan',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: neutral[10],
                                  ),
                        ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
