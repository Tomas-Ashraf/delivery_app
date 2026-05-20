import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/product_control/cart_cubit.dart';
import 'package:food_delivery_app/features/cart_feature/cart_feature_main.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, size: 30.sp, color: Color(0xFF1A1A1A)),
          Badge(
            backgroundColor: const Color(0xFFFA4A0C),
            child: IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              iconSize: 30.sp,
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: context.read<CartCubit>(),
                      child: const CartFeature(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
