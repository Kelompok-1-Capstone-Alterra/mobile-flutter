import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextEditingController controller;
  final IconButton? suffixIcon;
  final int? maxLength;
  final TextInputAction textInputAction;
  final Function(String?)? onChanged;
  final String? helperText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Widget? icon;
  final bool? isError;

  const CustomTextFormField({
    super.key,
    required this.textInputAction,
    this.label,
    required this.hint,
    required this.validator,
    this.obscureText = false,
    required this.controller,
    this.suffixIcon,
    this.maxLength,
    this.onChanged,
    this.helperText,
    this.keyboardType,
    this.maxLines,
    this.icon,
    this.isError = false,
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
      controller: widget.controller,
      obscureText: widget.obscureText!,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      textInputAction: widget.textInputAction,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      style: const TextStyle(
        color: neutral,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: _isError || widget.isError!
                  ? error
                  : _isFocused
                      ? primary
                      : neutral,
            ),
        helperText: widget.helperText,
        helperStyle: Theme.of(context).textTheme.bodySmall,
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: neutral[40],
            ),
        disabledBorder: Theme.of(context).inputDecorationTheme.disabledBorder,
        border: Theme.of(context).inputDecorationTheme.border,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _isError || widget.isError!
                ? error
                : _isFocused
                    ? primary
                    : neutral,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _isError || widget.isError! ? error : primary,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorStyle: const TextStyle(
          color: error,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: widget.suffixIcon,
        suffixIconColor: _isError || widget.isError! ? error : neutral,
        icon: widget.icon,
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
