import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/widgets/auth_top_section.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/widgets/signin_form_section.dart';

class AuthScreenBody extends StatelessWidget {
  const AuthScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [AuthTopSection(), SigninFormSection()]);
  }
}
