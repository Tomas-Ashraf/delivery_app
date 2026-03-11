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
    required this.backgroundColor,
  });
  final double width;
  final double height;
  final int radius;
  final String text;
  final TextStyle textStyle;
  final Function() onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius.toDouble()),
        ),
        child: Center(child: Text(text, style: textStyle)),
      ),
    );
  }
}
