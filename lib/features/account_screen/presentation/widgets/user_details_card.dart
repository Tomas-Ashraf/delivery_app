import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/features/auth_screen/data/models/user_model.dart';

class PersonalDetailsCard extends StatelessWidget {
  final UserModel userModel;
  const PersonalDetailsCard({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 26, 16, 26),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 64,
                    height: 64,
                    color: const Color(0xFFF2C4C4),
                    child: Image(
                      image: AssetImage('assets/images/Toy.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userModel.userName.toString(),
                        style: Styles.textStyle18,
                      ),
                      SizedBox(height: 6),
                      Text(userModel.email, style: Styles.textStyle15),

                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Divider(color: Color(0xFFE0E0E0), thickness: 2),
                      ),
                      Text(
                        userModel.phoneNumber.toString(),
                        style: Styles.textStyle15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Divider(color: Color(0xFFE0E0E0), thickness: 2),
                      ),

                      Text(
                        userModel.address.toString(),
                        style: Styles.textStyle15.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
