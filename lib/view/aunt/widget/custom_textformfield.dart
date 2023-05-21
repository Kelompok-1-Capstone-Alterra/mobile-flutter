import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final int? maxLength;
  final TextInputAction textInputAction;

  const CustomTextFormField({
    super.key,
    required this.textInputAction,
    required this.label,
    required this.hint,
    required this.validator,
    this.obscureText = false,
    this.controller,
    this.suffixIcon,
    this.maxLength,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late final FocusNode _focusNode;
  late bool _isFocused = false;
  late bool _isError = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText!,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      focusNode: _focusNode,
      style: const TextStyle(
        color: neutral,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: _isError
                  ? error
                  : _isFocused
                      ? primary
                      : neutral,
            ),
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: neutral[40],
            ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: neutral[40]!,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _isError ? error : primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        errorStyle: const TextStyle(
          color: error,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: widget.suffixIcon,
      ),
      validator: widget.validator != null
          ? (value) {
              setState(() {
                _isError = widget.validator!(value) != null;
              });
              return widget.validator!(value);
            }
          : null,
    );
  }
}