// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const List<IconData> icons = [
    Icons.home,
    Icons.search,
    Icons.shopping_cart,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          final active = currentIndex == index;
          return GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: Container(
              decoration: active
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE8450A).withOpacity(0.35),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    )
                  : null,

              child: Icon(
                icons[index],
                color: active ? kPrimaryColor : Colors.grey,
                size: 28,
              ),
            ),
          );
        }),
      ),
    );
  }
}
