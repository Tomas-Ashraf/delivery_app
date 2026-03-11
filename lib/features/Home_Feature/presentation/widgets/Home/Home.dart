import 'package:flutter/material.dart';
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
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HomeHeader(),
            SizedBox(height: 20),
            HomeTitle(),
            SizedBox(height: 16),
            HomeSearch(),
            SizedBox(height: 20),
            HomeCategories(),
            SizedBox(height: 12),
            SeeMore(),
            SizedBox(height: 12),
            ItemList(),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) => setState(() => _currentIndex = index),
      // ),
    );
  }
}
