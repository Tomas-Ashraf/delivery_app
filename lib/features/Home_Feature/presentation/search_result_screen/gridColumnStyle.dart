import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/Home_Feature/models/foodCardModel.dart';

import '../widgets/foodCard.dart';

class ColumnDesign extends StatelessWidget {
  final List<FoodCardModel> items;
  final double topOffset;
  const ColumnDesign({required this.items, required this.topOffset});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: topOffset),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: FoodCard(item: item),
          ),
        ),
      ],
    );
  }
}
