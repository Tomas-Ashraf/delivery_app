import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/features/payment_screen/presentation/widgets/payment_screen_body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f8),
      appBar: AppBar(
        backgroundColor: Color(0xfff5f5f8),
        title: Text('Checkout', style: Styles.textStyle18),
        centerTitle: true,
        elevation: 0,
      ),
      body: PaymentScreenBody(),
    );
  }
}
