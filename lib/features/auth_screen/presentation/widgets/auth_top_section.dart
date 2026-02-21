import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/assets.dart';
import 'package:food_delivery_app/core/utils/styles.dart';

class AuthTopSection extends StatelessWidget {
  const AuthTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Login', style: Styles.textStyle18),
                ),
                SizedBox(width: screenSize.width * 0.25),
                TextButton(
                  onPressed: () {},
                  child: Text('Sign-Up', style: Styles.textStyle18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
