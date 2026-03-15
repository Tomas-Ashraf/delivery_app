import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/spaces.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/Items.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/homeCategories.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/homeHeader.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/homeSearch.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/homeTitle.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/seeMore.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
            ],
          ),
        ),
      ),
    );
  }
}
