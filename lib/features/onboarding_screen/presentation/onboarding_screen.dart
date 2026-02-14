import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/onboarding_screen/presentation/widgets/onboarding_screen_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFff4b3a),
      body: OnboardingScreenBody(),
    );
  }
}
