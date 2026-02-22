import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/widgets/auth_top_section.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/widgets/signin_form_section.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/widgets/signup_form_section.dart';

class AuthScreenBody extends StatefulWidget {
  const AuthScreenBody({super.key});

  @override
  State<AuthScreenBody> createState() => _AuthScreenBodyState();
}

class _AuthScreenBodyState extends State<AuthScreenBody> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (BuildContext context, AuthState state) {
        if (BlocProvider.of<AuthCubit>(context).currentIndex == 0) {
          return  Column(
              children: [
                AuthTopSection(),
                SizedBox(height: screenSize.height * 0.03),
                SigninFormSection(),
              ],
            );
          
        } else {
          return Column(
            children: [
              AuthTopSection(),
              SizedBox(height: screenSize.height * 0.03),
              SignupFormSection(),
            ],
          );
        }
      },
    );
  }
}
