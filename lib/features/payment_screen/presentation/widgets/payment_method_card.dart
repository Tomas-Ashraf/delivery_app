import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/payment_screen/manager/cubit/payment_cubit.dart';
import 'package:food_delivery_app/features/payment_screen/presentation/widgets/payment_option_widget.dart';

class PaymentMethodCard extends StatefulWidget {
  const PaymentMethodCard({super.key});

  @override
  State<PaymentMethodCard> createState() => _PaymentMethodCardState();
}

class _PaymentMethodCardState extends State<PaymentMethodCard> {
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

            showDivider: true,
            onTap: () => BlocProvider.of<PaymentCubit>(
              context,
            ).changePaymentMethod('Card'),
            icon: Icons.credit_card_rounded,
            iconColor: Color(0xFFE8622A),
          ),
          PaymentOption(
            label: 'Bank account',
            value: 1,
            showDivider: false,
            onTap: () => BlocProvider.of<PaymentCubit>(
              context,
            ).changePaymentMethod('Bank account'),
            icon: Icons.account_balance_rounded,
            iconColor: Color(0xFFE8449A),
          ),
        ],
      ),
    );
  }
}
