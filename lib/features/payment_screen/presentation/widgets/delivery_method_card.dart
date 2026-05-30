// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/payment_screen/presentation/widgets/delivery_option_widget.dart';

class DeliveryMethodCard extends StatefulWidget {
  const DeliveryMethodCard({super.key});

  @override
  State<DeliveryMethodCard> createState() => _DeliveryMethodCardState();
}

class _DeliveryMethodCardState extends State<DeliveryMethodCard> {
  int _selectedDeliveryMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          DeliveryOption(
            label: 'Door delivery',
            value: 0,
            groupValue: _selectedDeliveryMethod,
            showDivider: true,
            onChanged: (val) => setState(() => _selectedDeliveryMethod = val!),
          ),
          DeliveryOption(
            label: 'Pick up',
            value: 1,
            groupValue: _selectedDeliveryMethod,
            showDivider: false,
            onChanged: (val) => setState(() => _selectedDeliveryMethod = val!),
          ),
        ],
      ),
    );
  }
}
