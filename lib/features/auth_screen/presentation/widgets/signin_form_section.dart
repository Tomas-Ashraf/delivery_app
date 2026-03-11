// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/core/utils/app_router.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/core/widgets/custom_text_form_field.dart';
import 'package:food_delivery_app/features/auth_screen/data/models/user_model.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:go_router/go_router.dart';

class SigninFormSection extends StatefulWidget {
  const SigninFormSection({super.key});

  @override
  State<SigninFormSection> createState() => _SigninFormSectionState();
}

class _SigninFormSectionState extends State<SigninFormSection> {
  final _formKey = GlobalKey<FormState>();
  final userModel = UserModel();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 14),
      child: SizedBox(
        width: double.infinity,
        height: screenSize.height * 0.52,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              SizedBox(height: screenSize.height * 0.02),
              Text('Password', style: Styles.textStyle15),
              SizedBox(
                width: double.infinity,
                height: 59,
                child: CustomTextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: BlocProvider.of<AuthCubit>(context).isObscure,
                  suffixIcon: IconButton(
                    onPressed: () {
                      authCubit.togglePasswordVisibility();
                    },
                    icon: authCubit.isObscure
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  hint: Text(
                    'Enter your password',
                    style: Styles.textStyle17.copyWith(
                      color: Color(0xFF000000),
                    ),
                  ),
                  validator: (value) {
                    return authCubit.passwordValidator(value);
                  },
                  onChanged: (value) {
                    userModel.password = value.toString();
                  },
                ),
              ),
              SizedBox(height: screenSize.height * 0.03),
              TextButton(
                child: Text('Forgot passcode?', style: Styles.textStyle17),
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kResetScreen);
                },
              ),
              Spacer(),
              CustomButton(
                width: double.infinity,
                height: 70,
                radius: 30,
                text: 'Login',
                textStyle: Styles.textStyle17.copyWith(color: Colors.white),
                backgroundColor: kPrimaryColor,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    authCubit.signIn(
                      email: userModel.email,
                      password: userModel.password,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
