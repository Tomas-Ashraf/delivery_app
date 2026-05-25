import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';

class PaymentScreenBody extends StatelessWidget {
  const PaymentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff5f5f8),
        title: Text('Checkout', style: Styles.textStyle18),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 50),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Delivery', style: Styles.textStyle34),
                    ),
                    SizedBox(height: 45),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Address details',
                        style: Styles.textStyle17.copyWith(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                    
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    width: 314,
                    height: 70,
                    radius: 30,
                    text: 'Proceed to payment',
                    textStyle: Styles.textStyle17.copyWith(color: Colors.white),
                    onTap: () {},
                    backgroundColor: const Color(0xFFE8490F),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
