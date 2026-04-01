// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart' as AppColors;

class SeeMore extends StatelessWidget {
  const SeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {},
            child: const Text(
              'see more',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.kPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
