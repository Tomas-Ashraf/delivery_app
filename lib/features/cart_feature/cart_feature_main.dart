import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_delivery_app/constants.dart' as AppColors;
import 'package:food_delivery_app/core/product_control/cart_cubit.dart';
import 'package:food_delivery_app/core/product_control/cart_states.dart';
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/features/cart_feature/cart_widget.dart';

class CartFeature extends StatefulWidget {
  const CartFeature({super.key});

  @override
  State<CartFeature> createState() => _CartFeatureState();
}

class _CartFeatureState extends State<CartFeature> {
  @override
  Widget build(BuildContext context) {
    final total = context.watch<CartCubit>().totalOrderPrice;

    return Scaffold(
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

      // Checkout Button & Total Price
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              backgroundColor: AppColors.kPrimaryColor,

              height: 50,
              width: MediaQuery.of(context).size.width * 0.4,
              radius: 28,

              text: 'Checkout : ',

              onTap: () {},

              textStyle: Styles.textStyle65.copyWith(fontSize: 20),
            ),

            Text(
              textAlign: TextAlign.center,
              'Total: \$${total.toStringAsFixed(2)}',
              style: Styles.textStyle65.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 20),

        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            // in case of loading the cart items from local storage or syncing with server
            if (state.status == CartSyncStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            // in case of empty cart
            if (state.cartItems.isEmpty) {
              return const Center(
                child: Text(
                  'Your cart is empty',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              );
            }

            // in case of having items in the cart
            return ListView.builder(
              itemCount: state.cartItems.length,

              itemBuilder: (context, index) {
                final item = state.cartItems[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),

                  child: Slidable(
                    key: ValueKey(item.id),

                    // showing the delete and favorite actions when sliding from right to left
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),

                      extentRatio: 0.45,

                      children: [
                        // in case of adding the item to favorites
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

                        // in case of deleting the item from the cart
                        CustomSlidableAction(
                          onPressed: (context) {
                            context.read<CartCubit>().removeFromCart(item.id);
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

                    // showing the share action when sliding from left to right
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

                    // the cart item widget
                    child: CartWidget(item: item),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
