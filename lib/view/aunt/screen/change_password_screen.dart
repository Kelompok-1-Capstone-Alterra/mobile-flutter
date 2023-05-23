import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/aunt/widget/custom_materialbutton.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/validator_aunt_provider.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpassController = TextEditingController();

  late bool _isObscure = true;
  late bool _isObscureTwo = true;

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // ...
    }
  }

  @override
  Widget build(BuildContext context) {
    final validatorProvider =
        Provider.of<ValidatorProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Ubah Kata Sandi',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Silahkan masukan kata sandi baru untuk melanjutkan',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    controller: _passwordController,
                    textInputAction: TextInputAction.next,
                    maxLength: 20,
                    label: 'Kata Sandi Baru',
                    hint: 'Masukan kata sandi baru',
                    validator: (value) =>
                        validatorProvider.validatePassword(value),
                    obscureText: _isObscure,
                    suffixIcon: IconButton(
                      icon: Icon(_isObscure
                          ? FluentIcons.eye_off_16_regular
                          : FluentIcons.eye_16_regular),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    controller: _confirmpassController,
                    textInputAction: TextInputAction.done,
                    maxLength: 20,
                    label: 'Konfirmasi Kata Sandi Baru',
                    hint: 'Masukan konfirmasi kata sandi baru',
                    validator: (value) =>
                        validatorProvider.validateComfrimPassword(
                      value,
                      _confirmpassController.text,
                      _passwordController.text,
                    ),
                    obscureText: _isObscureTwo,
                    suffixIcon: IconButton(
                      icon: Icon(_isObscureTwo
                          ? FluentIcons.eye_off_16_regular
                          : FluentIcons.eye_16_regular),
                      onPressed: () {
                        setState(() {
                          _isObscureTwo = !_isObscureTwo;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 48.0,
                  ),
                  CustomMaterialButton(
                    onPressed: () => _submit(context),
                    minWidth:
                        BouncingScrollSimulation.maxSpringTransferVelocity,
                    text: 'Kirim Email',
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
