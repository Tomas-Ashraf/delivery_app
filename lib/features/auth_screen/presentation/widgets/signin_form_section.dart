// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/core/utils/custom_button.dart';
import 'package:food_delivery_app/core/utils/styles.dart';

class SigninFormSection extends StatefulWidget {
  const SigninFormSection({super.key});

  @override
  State<SigninFormSection> createState() => _SigninFormSectionState();
}

class _SigninFormSectionState extends State<SigninFormSection> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Positioned(
      top: screenSize.height * 0.46,
      left: 50,
      right: 50,
      bottom: 30,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text('Email address', style: Styles.textStyle15),
            SizedBox(
              width: double.infinity,
              height: 59,
              child: TextFormField(
                decoration: InputDecoration(
                  hint: Text(
                    'Enter your email address',
                    style: Styles.textStyle17.copyWith(
                      color: Color(0xFF000000),
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF000000).withOpacity(0.4),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF000000)),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Text('Password', style: Styles.textStyle15),
            SizedBox(
              width: double.infinity,
              height: 59,
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hint: Text(
                    'Enter your password',
                    style: Styles.textStyle17.copyWith(
                      color: Color(0xFF000000),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF000000)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF000000).withOpacity(0.4),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
            Text('Forgot passcode?', style: Styles.textStyle17),
            Spacer(),

            CustomButton(
              width: double.infinity,
              height: 70,
              radius: 30,
              text: 'Login',
              textStyle: Styles.textStyle17.copyWith(color: Colors.white),
              backgroundColor: kPrimaryColor,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
