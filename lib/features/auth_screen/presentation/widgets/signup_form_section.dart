// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/core/utils/widgets/custom_button.dart';
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/manager/auth_cubit/auth_cubit.dart';

class SignupFormSection extends StatefulWidget {
  const SignupFormSection({super.key});

  @override
  State<SignupFormSection> createState() => _SignupFormSectionState();
}

class _SignupFormSectionState extends State<SignupFormSection> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
                    return BlocProvider.of<AuthCubit>(
                      context,
                    ).emailValidator(value: value);
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
                    icon: BlocProvider.of<AuthCubit>(context).isObscure
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  hint: Text(
                    'Enter your password',
                    style: Styles.textStyle17.copyWith(
                      color: Color(0xFF000000),
                    ),
                  ),
                  validator: (value) => BlocProvider.of<AuthCubit>(
                    context,
                  ).passwordSignupValidator(value),
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
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
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
