// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.keyboardType,
    required this.obscureText,
    this.suffixIcon,
    this.hint,
    this.validator,
  });
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? hint;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        hint: widget.hint,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF000000)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF000000).withOpacity(0.4)),
        ),
      ),
      validator: widget.validator,
    );
  }
}
