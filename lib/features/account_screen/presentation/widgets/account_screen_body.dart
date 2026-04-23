import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/features/account_screen/presentation/widgets/menu_item.dart';
import 'package:food_delivery_app/features/account_screen/presentation/widgets/user_details_card.dart';

class AccountScreenBody extends StatelessWidget {
  const AccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f8),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: size.height * 0.04,
                  horizontal: size.width * 0.02,
                ),
                child: Text('My profile', style: Styles.textStyle34),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Personal details', style: Styles.textStyle18),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'change',
                      style: Styles.textStyle15.copyWith(
                        color: Color(0xFFFA4A0C),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              PersonalDetailsCard(),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 27),
                        MenuItem(title: 'Orders'),
                        const SizedBox(height: 12),
                        MenuItem(title: 'Pending reviews'),
                        const SizedBox(height: 12),
                        MenuItem(title: 'Faq'),
                        const SizedBox(height: 12),
                        MenuItem(title: 'Help'),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: CustomButton(
                  width: double.infinity,
                  height: 56,
                  text: 'Update',
                  textStyle: Styles.textStyle17.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  backgroundColor: const Color(0xFFE8490F),
                  onTap: () {},
                  radius: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
