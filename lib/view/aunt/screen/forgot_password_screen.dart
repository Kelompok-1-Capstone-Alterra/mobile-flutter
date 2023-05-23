import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/aunt/screen/change_password_screen.dart';
import 'package:mobile_flutter/view/aunt/widget/custom_materialbutton.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/validator_aunt_provider.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ChangePasswordScreen(),
        ),
      );
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
                    'Jangan Khawatir!',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Silahkan masukan email yang terdaftar untuk mengubah kata sandi',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.done,
                    label: 'Email',
                    hint: 'Masukan emailmu',
                    validator: (value) =>
                        validatorProvider.validateEmail(value),
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
