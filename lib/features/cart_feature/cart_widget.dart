import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/product_control/cart_cubit.dart';
import 'package:food_delivery_app/core/product_control/models/main_product_model.dart';
import 'package:food_delivery_app/core/utils/colors.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key, required this.item});

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    // check if the item is in the cart to get the updated quantity and price
    final cartItem = context.watch<CartCubit>().state.cartItems.firstWhere(
      (e) => e.id == item.id,
      orElse: () => item,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // product image
            ClipOval(
              child: Image.network(
                cartItem.images.first,
                width: 80.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 20.w),

            // product details and quantity controls
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.name,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    '\$ ${cartItem.price}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),

                  SizedBox(height: 14.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<CartCubit>().updateQuantity(
                                  cartItem.id,
                                  -1,
                                );
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),

                            Text(
                              '${cartItem.quantity}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                context.read<CartCubit>().updateQuantity(
                                  cartItem.id,
                                  1,
                                );
                              },
                              icon: const Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Total: ${cartItem.price * cartItem.quantity} \$',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
