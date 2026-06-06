import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/features/receipt_screen.dart/data/receipt_model.dart';
import 'package:food_delivery_app/features/receipt_screen.dart/presentation/widgets/receipt_screen_body.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key, required this.receipt});
  final ReceiptModel receipt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f8),
      appBar: AppBar(
        title: Text('Your Receipt', style: Styles.textStyle22),
        centerTitle: true,
      ),
      body: ReceiptScreenBody(receipt: receipt),
    );
  }
}
