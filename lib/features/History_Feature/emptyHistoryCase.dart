import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/app_router.dart';
import 'package:food_delivery_app/features/History_Feature/inCaseNoOrders.dart';

Widget emptyHistoryState(BuildContext context) {
  return EmptyStateWidget(
    icon: Icons.shopping_cart_outlined,
    iconColor: Colors.grey[400],
    title: 'No orders yet',
    message: 'Hit the orange button down\nbelow to Create an order',
    buttonText: 'Start odering',
    buttonColor: const Color(0xFFFF5722),
    onButtonPressed: () => _handleStartOrdering(context),
  );
}

void _handleStartOrdering(BuildContext context) {
  Navigator.pushNamed(context, AppRouter.kOrdersScreen);
}
