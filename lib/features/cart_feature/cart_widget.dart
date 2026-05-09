import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/utils/spaces.dart';
import 'package:food_delivery_app/core/utils/styles.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Product Image
            ClipOval(
              child: Image.network(
                'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400',
                width: 70.w,
                height: 70.h,
                fit: BoxFit.cover,
              ),
            ),

            Spaces.horizontalSpace(20.w),

            /// Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Product Name
                  Text(
                    'Veggie tomato mix',
                    style: Styles.textStyle18,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Spaces.verticalSpace(8.h),

                  /// Product Price
                  Text('#1,900', style: Styles.textStyle17),

                  Spaces.verticalSpace(14.h),

                  /// Quantity Buttons
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),

                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.remove, size: 18.sp, color: Colors.white),

                          SizedBox(width: 10.w),

                          Text(
                            '1',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(width: 10.w),

                          Icon(Icons.add, size: 18.sp, color: Colors.white),
                        ],
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
