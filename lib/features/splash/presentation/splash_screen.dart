// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/splash/presentation/widgets/splash_screen_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenBody();
  }
}
