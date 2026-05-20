import 'package:food_delivery_app/core/product_control/models/main_product_model.dart';

abstract class ItemState {}

class ItemInitialState extends ItemState {}

class ItemLoadingState extends ItemState {}

class ItemSuccessState extends ItemState {
  final ProductModel product;
  ItemSuccessState(this.product);
}

class ItemFailureState extends ItemState {
  final String error;
  ItemFailureState(this.error);
}
