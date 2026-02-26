import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Home Screen',
            style: Styles.textStyle65.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
