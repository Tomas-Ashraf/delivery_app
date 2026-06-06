import 'package:food_delivery_app/core/product_control/models/main_product_model.dart';

class ReceiptModel {
  final String clientName;
  final String phoneNumber;
  final String address;
  final String deliveryMethod;
  final String paymentMethod;
  final String totalPrice;
  final List<ProductModel> items;

  ReceiptModel({
    required this.clientName,
    required this.phoneNumber,
    required this.address,
    required this.deliveryMethod,
    required this.paymentMethod,
    required this.totalPrice,
    required this.items,
  });
}
