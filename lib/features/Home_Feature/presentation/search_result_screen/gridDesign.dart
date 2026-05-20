import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/product_control/models/main_product_model.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/search_result_screen/gridColumnStyle.dart';

class GridDesign extends StatelessWidget {
  final List<ProductModel> items;
  const GridDesign({required this.items});

  @override
  Widget build(BuildContext context) {
    // Split items into two lists for left and right columns
    final leftItems = [
      for (int i = 0; i < items.length; i += 2) items[i],
    ].cast<ProductModel>();
    final rightItems = [
      for (int i = 1; i < items.length; i += 2) items[i],
    ].cast<ProductModel>();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ColumnDesign(items: leftItems, topOffset: 0)),
          const SizedBox(width: 12),
          Expanded(child: ColumnDesign(items: rightItems, topOffset: 60)),
        ],
      ),
    );
  }
}
