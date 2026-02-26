import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({
    super.key,
    required this.text,
    required this.backgroundColor,
  });
  final Widget text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: text, backgroundColor: backgroundColor));
    return const SizedBox.shrink();
  }
}
