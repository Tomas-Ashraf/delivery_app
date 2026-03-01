import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/foodCard.dart';
import 'package:food_delivery_app/models/foodCardModel.dart';

const _sampleItems = [
  FoodCardModel(
    image: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400',
    title: 'Veggie tomato mix',
    price: '500 EGP',
  ),
  FoodCardModel(
    image: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400',
    title: 'Spicy food sauce',
    price: '350 EGP',
  ),
  FoodCardModel(
    image: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400',
    title: 'Grilled chicken',
    price: '450 EGP',
  ),
  FoodCardModel(
    image: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400',
    title: 'Fresh salad bowl',
    price: '280 EGP',
  ),
];

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20, right: 8, top: 8, bottom: 16),
        itemCount: _sampleItems.length,
        separatorBuilder: (_, __) => const SizedBox(width: 20),
        itemBuilder: (context, index) => FoodCard(item: _sampleItems[index]),
      ),
    );
  }
}
