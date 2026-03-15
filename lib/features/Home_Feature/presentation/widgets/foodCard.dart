import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/spaces.dart';
import 'package:food_delivery_app/features/Home_Feature/models/foodCardModel.dart';

class FoodCard extends StatelessWidget {
  final FoodCardModel item;
  const FoodCard({super.key, required this.item});

  static double cardWidth = 160.w;
  static double cardHeight = 270.h;
  static double imageSize = 120.sp;
  static double imageTop = 25.sp;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 70.sp,
            left: 0.sp,
            right: 0.sp,
            height: 200.h,
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 70, 12, 16),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A1A1A),
                      height: 1.3.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spaces.verticalSpace(8.sp),
                  Text(
                    item.price,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFFA4A0C),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: imageTop,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: imageSize,
                height: imageSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 20,
                      offset: const Offset(4, 8),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.network(
                    item.image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFFEEEEEE),
                      child: Icon(
                        Icons.fastfood,
                        color: Colors.grey,
                        size: 40.sp,
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
