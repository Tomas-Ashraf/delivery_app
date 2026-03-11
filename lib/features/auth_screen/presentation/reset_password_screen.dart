// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/custom_text_form_field.dart';
import 'package:food_delivery_app/features/auth_screen/data/models/user_model.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/manager/auth_cubit/auth_cubit.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final userModel = UserModel();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is PasscodeResetFailure) {
        } else if (state is PasscodeResetSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Password reset email was sent.',
                style: Styles.textStyle15.copyWith(color: Colors.white),
              ),
              backgroundColor: kPrimaryColor,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is PasscodeResetLoading) {
          return SizedBox(
            height: screenSize.height,
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: kAuthScreenBackgroundColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 14),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenSize.height * 0.05),
                      Text('Forgot Passcode', style: Styles.textStyle18),
                      SizedBox(height: screenSize.height * 0.03),
                      Text('Email address', style: Styles.textStyle15),
                      SizedBox(
                        width: double.infinity,
                        height: 59,
                        child: CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          hint: Text(
                            'Enter your email address',
                            style: Styles.textStyle17.copyWith(
                              color: Color(0xFF000000),
                            ),
                          ),
                          validator: (value) {
                            return authCubit.emailValidator(value: value);
                          },
                          onChanged: (value) {
                            userModel.email = value.toString();
                          },
                        ),
                      ),
                      Spacer(),
                      CustomButton(
                        width: double.infinity,
                        height: 70,
                        radius: 30,
                        text: 'Reset Passcode',
                        textStyle: Styles.textStyle17.copyWith(
                          color: Colors.white,
                        ),
                        backgroundColor: kPrimaryColor,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(
                              context,
                            ).resetPassword(email: userModel.email);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
