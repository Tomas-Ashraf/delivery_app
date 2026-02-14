import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.radius,
    required this.text,
    required this.textStyle,
    required this.onTap,
  });
  final double width;
  final double height;
  final int radius;
  final String text;
  final TextStyle textStyle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(radius.toDouble()),
        ),
        child: Center(child: Text(text, style: textStyle)),
      ),
    );
  }
}
