// ignore_for_file: deprecated_member_use, unnecessary_underscores

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/spaces.dart';
import 'package:food_delivery_app/models/food_card_model.dart';

class FoodCard extends StatelessWidget {
  final FoodCardModel item;
  const FoodCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          //white card Starts here
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            height: 200,
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 80, 12, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spaces.verticalSpace(10),

                  Text(
                    textAlign: TextAlign.center,
                    item.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spaces.verticalSpace(10),
                  Positioned(
                    bottom: 20,
                    right: 0,
                    left: 0,
                    child: Text(
                      item.price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFA4A0C),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //circular dish image
          Positioned(
            top: 25,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(
                        255,
                        6,
                        6,
                        6,
                      ).withOpacity(0.12),
                      blurRadius: 20,
                      offset: const Offset(8, 8),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.network(
                    item.image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFFEEEEEE),
                      child: const Icon(
                        Icons.fastfood,
                        color: Colors.grey,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
