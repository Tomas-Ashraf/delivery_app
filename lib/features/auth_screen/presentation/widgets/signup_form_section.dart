// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/core/widgets/custom_text_form_field.dart';
import 'package:food_delivery_app/features/auth_screen/data/models/user_model.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/manager/auth_cubit/auth_cubit.dart';

class SignupFormSection extends StatefulWidget {
  const SignupFormSection({super.key});

  @override
  State<SignupFormSection> createState() => _SignupFormSectionState();
}

class _SignupFormSectionState extends State<SignupFormSection> {
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
              Text('Your Name', style: Styles.textStyle15),
              SizedBox(
                width: double.infinity,
                height: 59,
                child: CustomTextFormField(
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  hint: Text(
                    'Enter your Name',
                    style: Styles.textStyle17.copyWith(
                      color: Color(0xFF000000),
                    ),
                  ),
                  validator: (value) {
                    return authCubit.nameValidator(value: value);
                  },
                  onChanged: (value) {
                    userModel.userName = value.toString();
                  },
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
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
                      BlocProvider.of<AuthCubit>(
                        context,
                      ).togglePasswordVisibility();
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
                  validator: (value) =>
                      authCubit.passwordSignupValidator(value),
                  onChanged: (value) {
                    userModel.password = value.toString();
                  },
                ),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Spacer(),
              CustomButton(
                width: double.infinity,
                height: 70,
                radius: 30,
                text: 'Sign-Up',
                textStyle: Styles.textStyle17.copyWith(color: Colors.white),
                backgroundColor: kPrimaryColor,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    authCubit.signUp(
                      name: userModel.userName,
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
