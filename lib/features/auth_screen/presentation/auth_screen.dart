import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/widgets/auth_screen_body.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..showSigninView(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: kAuthScreenBackgroundColor,
        body: SingleChildScrollView(child: AuthScreenBody()),
      ),
    );
  }
}
