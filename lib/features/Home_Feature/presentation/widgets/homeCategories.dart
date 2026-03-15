import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/core/utils/colors.dart';
import 'package:food_delivery_app/core/utils/spaces.dart';
import 'package:food_delivery_app/features/Home_Feature/manager/foodCubit.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        itemCount: categories.length,
        separatorBuilder: (_, __) => Spaces.horizontalSpace(24.w),
        itemBuilder: (context, index) {
          final selected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() => _selectedIndex = index);
              context.read<FoodCubit>().getFood(category: categories[index]);
            },
            child: Column(
              children: [
                Text(
                  categories[index],
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                    color: selected
                        ? const Color(0xFF1A1A1A)
                        : const Color(0xFFAAAAAA),
                  ),
                ),
                Spaces.verticalSpace(4.h),
                if (selected)
                  Container(
                    height: 3.h,
                    width: 20.w,
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
