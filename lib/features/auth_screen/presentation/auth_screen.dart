import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/widgets/auth_screen_body.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAuthScreenBackgroundColor,
      body: AuthScreenBody(),
    );
  }
}
