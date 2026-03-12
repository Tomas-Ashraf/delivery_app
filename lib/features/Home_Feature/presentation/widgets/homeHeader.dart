import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 30.sp,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }
}
