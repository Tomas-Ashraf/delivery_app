import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/items_details/models/item_model.dart';

class FoodItemInformation extends StatelessWidget {
  FoodItemInformation({super.key, required this.name, required this.price});
  late ItemModel foodModel;
  final String name;
  final String price;
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
            price,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFF5722),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
