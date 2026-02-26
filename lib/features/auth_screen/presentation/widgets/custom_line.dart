import 'package:flutter/material.dart';

class CustomLine extends StatefulWidget {
  const CustomLine({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  });
  final double width;
  final double height;
  final Color color;
  @override
  State<CustomLine> createState() => _CustomLineState();
}

class _CustomLineState extends State<CustomLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(color: widget.color),
    );
  }
}
