import 'package:food_delivery_app/core/product_control/models/main_product_model.dart';

abstract class FoodState {}

class FoodInitial extends FoodState {}

class FoodLoading extends FoodState {}

class FoodLoaded extends FoodState {
  final List<ProductModel> items;
  FoodLoaded(this.items);
}

class FoodError extends FoodState {
  final String message;
  FoodError(this.message);
}
