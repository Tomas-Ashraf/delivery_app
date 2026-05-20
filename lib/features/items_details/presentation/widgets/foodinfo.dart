import 'package:flutter/material.dart';

class FoodItemInformation extends StatelessWidget {
  const FoodItemInformation({
    super.key,
    required this.name,
    required this.price,
  });

  final String name;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 11),
          Text(
            ' $price \$',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFF5722),
            ),
          ),
        ],
      ),
    );
  }
}
