import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/payment_screen/presentation/widgets/payment_option_widget.dart';

class PaymentMethodCard extends StatefulWidget {
  const PaymentMethodCard({super.key});

  @override
  State<PaymentMethodCard> createState() => _PaymentMethodCardState();
}

class _PaymentMethodCardState extends State<PaymentMethodCard> {
  int _selectedPaymentMethod = 0;

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
          PaymentOption(
            label: 'Card',
            value: 0,
            groupValue: _selectedPaymentMethod,
            showDivider: true,
            onChanged: (val) => setState(() => _selectedPaymentMethod = val!),
            icon: Icons.credit_card_rounded,
            iconColor: Color(0xFFE8622A),
          ),
          PaymentOption(
            label: 'Bank account',
            value: 1,
            groupValue: _selectedPaymentMethod,
            showDivider: false,
            onChanged: (val) => setState(() => _selectedPaymentMethod = val!),
            icon: Icons.account_balance_rounded,
            iconColor: Color(0xFFE8449A),
          ),
        ],
      ),
    );
  }
}
