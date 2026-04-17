import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text(
        'Delicious \nFood for you',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w800,
          color: Color(0xFF1A1A1A),
          fontFamily: 'SF-Pro-Rounded',
          height: 1.3,
        ),
      ),
    );
  }
}
