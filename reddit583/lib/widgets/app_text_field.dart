import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.icon,
    this.validator,
    this.isPassword = false,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final String label;
  final IconData? icon;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int maxLines;
  final ValueChanged<String>? onSubmitted;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _hidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword && _hidden,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      onFieldSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: widget.icon == null ? null : Icon(widget.icon),
        suffixIcon: widget.isPassword
            ? IconButton(
                tooltip: _hidden ? 'Show password' : 'Hide password',
                icon: Icon(_hidden
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
                onPressed: () => setState(() => _hidden = !_hidden),
              )
            : null,
      ),
    );
  }
}
