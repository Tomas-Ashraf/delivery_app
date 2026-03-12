import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/core/utils/app_router.dart';
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/widgets/auth_top_section.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/widgets/signin_form_section.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/widgets/signup_form_section.dart';
import 'package:go_router/go_router.dart';

class AuthScreenBody extends StatefulWidget {
  const AuthScreenBody({super.key});

  @override
  State<AuthScreenBody> createState() => _AuthScreenBodyState();
}

class _AuthScreenBodyState extends State<AuthScreenBody> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UserSignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
                style: Styles.textStyle15.copyWith(color: Colors.white),
              ),
              backgroundColor: kPrimaryColor,
            ),
          );
        } else if (state is UserSignUpSuccess) {
          authCubit.currentIndex = 0;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'The user is added',
                style: Styles.textStyle15.copyWith(color: Colors.white),
              ),
              backgroundColor: kPrimaryColor,
            ),
          );
          GoRouter.of(context).pushReplacement(AppRouter.kHomeScreen);
        } else if (state is UserSignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Login successful',
                style: Styles.textStyle15.copyWith(color: Colors.white),
              ),
              backgroundColor: kPrimaryColor,
            ),
          );
          GoRouter.of(context).pushReplacement(AppRouter.kHomeScreen);
        } else if (state is UserSignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
                style: Styles.textStyle15.copyWith(color: Colors.white),
              ),
              backgroundColor: kPrimaryColor,
            ),
          );
        }
      },
      builder: (BuildContext context, AuthState state) {
        if (state is UserSignUpLoading || state is UserSignInSuccess) {
          return SizedBox(
            height: screenSize.height,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (authCubit.currentIndex == 0) {
          return Column(
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
