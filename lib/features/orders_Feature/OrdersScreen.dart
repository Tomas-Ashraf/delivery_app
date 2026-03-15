import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/widgets/reusedAppBar.dart';
import 'package:food_delivery_app/features/orders_Feature/presentation/emptyOrdersCase.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Orders'),
      body: emptyOrdersState(context),
    );
  }
}
