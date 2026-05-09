import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_delivery_app/constants.dart' as AppColors;
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/features/cart_feature/cart_widget.dart';

class CartFeature extends StatefulWidget {
  const CartFeature({super.key});

  @override
  State<CartFeature> createState() => _CartFeatureState();
}

class _CartFeatureState extends State<CartFeature> {
  // Sample list of items in the cart for testing process
  List<int> items = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          backgroundColor: AppColors.kPrimaryColor,

          height: 60,
          width: double.infinity,
          radius: 28,
          text: ' Complete Order',
          onTap: () {},
          textStyle: Styles.textStyle65.copyWith(fontSize: 20),
        ),
      ),
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200],

        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),

        centerTitle: true,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 20),

        child: ListView.builder(
          itemCount: items.length,

          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

              child: Slidable(
                key: ValueKey(items[index]),

                // RIGHT SIDE ACTIONS
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),

                  extentRatio: 0.45,

                  children: [
                    // FAVORITE BUTTON
                    CustomSlidableAction(
                      onPressed: (context) {},

                      backgroundColor: Colors.transparent,

                      child: Container(
                        height: 55,
                        width: 55,

                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),

                    // DELETE BUTTON
                    CustomSlidableAction(
                      onPressed: (context) {
                        setState(() {
                          items.removeAt(index);
                        });
                      },

                      backgroundColor: Colors.transparent,

                      child: Container(
                        height: 55,
                        width: 55,

                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),

                // LEFT SIDE ACTIONS
                startActionPane: ActionPane(
                  motion: const DrawerMotion(),

                  children: [
                    CustomSlidableAction(
                      onPressed: (context) {},

                      backgroundColor: Colors.transparent,

                      child: Container(
                        height: 55,
                        width: 55,

                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),

                child: const CartWidget(),
              ),
            );
          },
        ),
      ),
    );
  }
}
