// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/app_router.dart';
import 'package:food_delivery_app/core/utils/assets.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        _controller.dispose();
        GoRouter.of(context).pushReplacement(AppRouter.kOnBoardingScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Lottie.asset(
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.fill,
                  AssetsData.burgerAnimation,
                  controller: _controller,
                  onLoaded: (LottieComposition composition) {
                    _controller
                      ..duration = composition.duration
                      ..forward();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
