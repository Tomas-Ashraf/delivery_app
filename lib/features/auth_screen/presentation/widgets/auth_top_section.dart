import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/core/utils/assets.dart';
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/widgets/custom_line.dart';

class AuthTopSection extends StatelessWidget {
  const AuthTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.40,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenSize.height * 0.08),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            width: 150,
            height: 162.38,
            child: Image.asset(AssetsData.chefB),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<AuthCubit>(context).showSigninView();
                        },
                        child: Text('Login', style: Styles.textStyle18),
                      ),
                      CustomLine(
                        width: screenSize.width * 0.29,
                        height: screenSize.height * 0.003,
                        color:
                            BlocProvider.of<AuthCubit>(context).currentIndex ==
                                1
                            ? Colors.transparent
                            : kPrimaryColor,
                      ),
                    ],
                  ),
                  SizedBox(width: screenSize.width * 0.18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<AuthCubit>(context).showSignupView();
                        },
                        child: Text('Sign-Up', style: Styles.textStyle18),
                      ),
                      CustomLine(
                        width: screenSize.width * 0.29,
                        height: screenSize.height * 0.003,
                        color:
                            BlocProvider.of<AuthCubit>(context).currentIndex ==
                                0
                            ? Colors.transparent
                            : kPrimaryColor,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
