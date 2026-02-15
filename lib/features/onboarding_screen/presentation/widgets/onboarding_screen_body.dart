// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/assets.dart';
import 'package:food_delivery_app/core/utils/custom_button.dart';
import 'package:food_delivery_app/core/utils/soft_gradient_painter.dart';
import 'package:food_delivery_app/core/utils/styles.dart';

class OnboardingScreenBody extends StatelessWidget {
  const OnboardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.01,
            left: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(AssetsData.chefLogo),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.39,
            left: MediaQuery.of(context).size.width * 0.1,
            child: SizedBox(
              width: 275,
              // height: 112,
              child: const Text('Food for Everyone', style: Styles.textStyle65),
            ),
          ),
          Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.47,
                right: MediaQuery.of(context).size.width * -0.07,
                child: Transform.rotate(
                  angle: 8.57 * (3.14159 / 180), // Convert degrees to radians
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: MediaQuery.of(context).size.width * 0.71,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(AssetsData.boyCharacter),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.79,
                right: MediaQuery.of(context).size.width * -0.07,
                child: CustomPaint(
                  size: Size(394, 195),
                  painter: SoftGradientPainter(),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.40,
                left: MediaQuery.of(context).size.width * -0.17,
                child: Transform.rotate(
                  angle: -3.5 * (3.14159 / 180), // Convert degrees to radians
                  child: Container(
                    width: MediaQuery.of(context).size.width - 60,
                    height: MediaQuery.of(context).size.height - 480,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(AssetsData.girlCharacter),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.72,
                left: MediaQuery.of(context).size.width * -0.17,
                child: CustomPaint(
                  size: Size(394, 195),
                  painter: SoftGradientPainter(),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 230,
            left: MediaQuery.of(context).size.width - 195,
            child: CustomPaint(
              size: Size(700, 220),
              painter: SoftGradientPainter(),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 140,
            left: (MediaQuery.of(context).size.width - 314) / 2,
            child: CustomButton(
              width: 314,
              height: 70,
              radius: 30,
              text: 'Get Started',
              textStyle: Styles.textStyle17,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
