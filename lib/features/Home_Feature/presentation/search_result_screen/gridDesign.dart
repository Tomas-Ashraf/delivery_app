import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/Home_Feature/models/foodCardModel.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/search_result_screen/gridColumnStyle.dart';

class GridDesign extends StatelessWidget {
  final List<FoodCardModel> items;
  const GridDesign({required this.items});

  @override
  Widget build(BuildContext context) {
    // Split items into two lists for left and right columns
    final leftItems = [for (int i = 0; i < items.length; i += 2) items[i]];
    final rightItems = [for (int i = 1; i < items.length; i += 2) items[i]];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left column with no top offset
          Expanded(child: ColumnDesign(items: leftItems, topOffset: 0)),
          const SizedBox(width: 12),
          // Right column with a top offset of 60
          Expanded(child: ColumnDesign(items: rightItems, topOffset: 60)),
        ],
      ),
    );
  }
}
