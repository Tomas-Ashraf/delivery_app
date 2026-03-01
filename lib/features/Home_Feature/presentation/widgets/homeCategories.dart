import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/core/utils/colors.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

int selectedCategory = 0;

class _HomeCategoriesState extends State<HomeCategories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 24),
        itemBuilder: (context, index) {
          final selected = selectedCategory == index;
          return GestureDetector(
            onTap: () => setState(() => selectedCategory = index),
            child: Column(
              children: [
                Text(
                  categories[index],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                    color: selected
                        ? const Color(0xFF1A1A1A)
                        : const Color(0xFFAAAAAA),
                  ),
                ),
                const SizedBox(height: 4),
                if (selected)
                  Container(
                    height: 3,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
