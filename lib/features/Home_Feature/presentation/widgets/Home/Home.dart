import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/spaces.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/Items.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/home_categories.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/home_header.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/home_search.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/home_title.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/see_more.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),

        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeHeader(),

              Spaces.verticalSpace(20.h),

              HomeTitle(),

              Spaces.verticalSpace(16.h),

              HomeSearch(),

              Spaces.verticalSpace(20.h),

              HomeCategories(),

              Spaces.verticalSpace(12.h),

              SeeMore(),

              Spaces.verticalSpace(12.h),

              ItemList(),

              Spaces.verticalSpace(30.h),
            ],
          ),
        ),
      ),
    );
  }
}
