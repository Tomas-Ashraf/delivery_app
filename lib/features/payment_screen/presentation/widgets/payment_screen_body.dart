import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/product_control/models/main_product_model.dart';
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/features/account_screen/presentation/widgets/user_details_card.dart';
import 'package:food_delivery_app/features/auth_screen/data/models/user_model.dart';
import 'package:food_delivery_app/features/payment_screen/manager/cubit/payment_cubit.dart';
import 'package:food_delivery_app/features/payment_screen/presentation/widgets/delivery_method_card.dart';
import 'package:food_delivery_app/features/payment_screen/presentation/widgets/payment_method_card.dart';

class PaymentScreenBody extends StatelessWidget {
  const PaymentScreenBody({
    super.key,
    required this.itemsList,
    required this.totalPrice,
  });
  final List<ProductModel> itemsList;
  final String totalPrice;
  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel(
      userName: '',
      address: '',
      email: '',
      password: '',
      phoneNumber: '',
    );
    return BlocProvider(
      create: (context) => PaymentCubit()..getUserData(),
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {
          if (state is AccountGetDataLoading) {
            Scaffold(
              backgroundColor: Color(0xfff5f5f8),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [CircularProgressIndicator()],
                ),
              ),
            );
          } else if (state is AccountGetDataSuccess) {
            userModel = state.userModel;
          } else if (state is AccountGetDataFailure) {
            Scaffold(
              backgroundColor: Color(0xfff5f5f8),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Error: ${state.errorMessage}'),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          } else {
            const SizedBox.shrink();
          }
        },
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 50),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
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
                              style: Styles.textStyle17.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          PersonalDetailsCard(userModel: userModel),
                          SizedBox(height: 42),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Delivery method.',
                              style: Styles.textStyle17.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          DeliveryMethodCard(),
                          SizedBox(height: 42),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Payment method.',
                              style: Styles.textStyle17.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          PaymentMethodCard(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Price',
                              style: Styles.textStyle17.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            Text(totalPrice, style: Styles.textStyle22),
                          ],
                        ),
                        SizedBox(height: 48),
                        CustomButton(
                          width: 314,
                          height: 70,
                          radius: 30,
                          text: 'Proceed to payment',
                          textStyle: Styles.textStyle17.copyWith(
                            color: Colors.white,
                          ),
                          onTap: () {},
                          backgroundColor: const Color(0xFFE8490F),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
