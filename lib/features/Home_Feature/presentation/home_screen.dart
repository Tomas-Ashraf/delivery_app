import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/Favorite_Feature/favorite_screen.dart';
import 'package:food_delivery_app/features/History_Screen/history_screen.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/Home/Home.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:food_delivery_app/features/account_screen/presentation/account_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<Widget> screens = [
  const HomeWidget(),
  const FavoriteScreen(),
  const HistoryScreen(),
  const AccountScreen(),
];
int currentIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //  appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: screens[currentIndex],

        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
