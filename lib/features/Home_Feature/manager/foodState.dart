import 'package:food_delivery_app/features/Home_Feature/models/foodCardModel.dart';

abstract class FoodState {}

class FoodInitial extends FoodState {}

class FoodLoading extends FoodState {}

class FoodLoaded extends FoodState {
  final List<FoodCardModel> items;
  FoodLoaded(this.items);
}

class FoodError extends FoodState {
  final String message;
  FoodError(this.message);
}