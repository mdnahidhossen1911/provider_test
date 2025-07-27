import 'package:flutter/material.dart';

/// A reusable text field widget for forms in the app.
///
/// [controller] - Controls the text being edited.
/// [labelText] - The label to display inside the field.
/// [prefixIcon] - The icon to display at the start of the field.
/// [obscureText] - Whether to obscure the text (e.g., for passwords).
/// [validator] - Validation logic for the field.
/// [focusNode] - Focus node for managing focus.
/// [onFieldSubmitted] - Callback when the user submits the field.
/// [suffixIcon] - Optional icon at the end of the field.
/// [keyboardType] - The type of keyboard to use for editing the text.
/// [autovalidateMode] - Validation mode for the field.
class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;

  const AppTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.keyboardType,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      keyboardType: keyboardType,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
