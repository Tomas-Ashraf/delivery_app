import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/features/receipt_screen.dart/data/receipt_model.dart';

class ReceiptScreenBody extends StatelessWidget {
  const ReceiptScreenBody({super.key, required this.receipt});
  final ReceiptModel receipt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: AlignmentGeometry.topLeft,
            child: Text('Name: ', style: Styles.textStyle18),
          ),
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              receipt.clientName,
              style: Styles.textStyle18.copyWith(color: Colors.grey),
            ),
          ),

          Align(
            alignment: AlignmentGeometry.topLeft,

            child: Text('Phone Number: ', style: Styles.textStyle18),
          ),
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              receipt.phoneNumber,
              style: Styles.textStyle18.copyWith(color: Colors.grey),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.topLeft,

            child: Text('Address: ', style: Styles.textStyle18),
          ),
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              receipt.address,
              style: Styles.textStyle18.copyWith(color: Colors.grey),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.topLeft,

            child: Text('Delivery Method: ', style: Styles.textStyle18),
          ),
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              receipt.deliveryMethod,
              style: Styles.textStyle18.copyWith(color: Colors.grey),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.topLeft,

            child: Text('Payment Method: ', style: Styles.textStyle18),
          ),
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              receipt.paymentMethod,
              style: Styles.textStyle18.copyWith(color: Colors.grey),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.topLeft,
            child: Text('Your Items: ', style: Styles.textStyle18),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: receipt.items.length,
              itemBuilder: (context, index) => Align(
                alignment: AlignmentGeometry.center,
                child: Text(
                  receipt.items[index].name,
                  style: Styles.textStyle18.copyWith(color: Colors.grey),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.topLeft,
            child: Text('Total Price: ', style: Styles.textStyle18),
          ),
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              receipt.totalPrice,
              style: Styles.textStyle18.copyWith(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
