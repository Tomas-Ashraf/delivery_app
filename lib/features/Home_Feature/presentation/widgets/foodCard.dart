// ignore_for_file: deprecated_member_use, unnecessary_underscores

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/product_control/cart_cubit.dart';
import 'package:food_delivery_app/core/product_control/models/main_product_model.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/utils/spaces.dart';

class FoodCard extends StatelessWidget {
  final ProductModel item;

  const FoodCard({super.key, required this.item});

  static double cardWidth = 150.w;
  static double cardHeight = 260.h;
  static double imageSize = 120.sp;
  static double imageTop = -10.sp;

  @override
  Widget build(BuildContext context) {
    // check if the item is already in the cart
    final isInCart = context.watch<CartCubit>().state.cartItems.any(
      (cartItem) => cartItem.id == item.id,
    );

    return SizedBox(
      width: cardWidth,
      height: cardHeight,

      child: Stack(
        clipBehavior: Clip.none,

        children: [
          //  food card
          Positioned(
            top: 60.sp,
            left: 0,
            right: 0,

            child: Container(
              height: 160.h,

              padding: EdgeInsets.fromLTRB(12.w, 70.h, 12.w, 20.h),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(20.r),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  //  product name
                  SizedBox(
                    height: 40.h,

                    child: Text(
                      item.name,

                      textAlign: TextAlign.center,

                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),
                  ),

                  Spaces.verticalSpace(8.h),

                  // product price
                  Text(
                    '${item.price} \$',

                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // food image
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
                    item.images.first,

                    fit: BoxFit.cover,

                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFEEEEEE),

                        child: Icon(
                          Icons.fastfood,
                          color: Colors.grey,
                          size: 40.sp,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          // add to cart button
          Positioned(
            bottom: -15.h,
            right: 0.w,

            child: Material(
              color: Colors.transparent,

              child: InkWell(
                borderRadius: BorderRadius.circular(50.r),

                onTap: () {
                  print('BUTTON TAPPED');

                  if (!isInCart) {
                    // ADD PRODUCT
                    context.read<CartCubit>().addToCart(item);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('${item.name} added to cart'),

                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else {
                    // REMOVE PRODUCT
                    context.read<CartCubit>().removeFromCart(item.id);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.kPrimaryColor,
                        content: Text('${item.name} removed from cart'),

                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },

                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),

                  padding: EdgeInsets.all(12.sp),

                  decoration: BoxDecoration(
                    color: isInCart
                        ? const Color(0xFF34C759)
                        : AppColors.kPrimaryColor,

                    shape: BoxShape.circle,

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.20),

                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),

                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },

                    child: Icon(
                      isInCart ? Icons.check : Icons.add_shopping_cart,

                      key: ValueKey(isInCart),

                      color: Colors.white,
                      size: 14.sp,
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
