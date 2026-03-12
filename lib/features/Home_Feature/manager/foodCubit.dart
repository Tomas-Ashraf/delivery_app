import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/Home_Feature/manager/foodServices.dart';
import 'package:food_delivery_app/features/Home_Feature/manager/foodState.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());
  final FoodServices services = FoodServices();

  // get data

  Future<void> getFood({String category = 'All'}) async {
    emit(FoodLoading());
    try {
      final items = await services.getFood(category: category);
      emit(FoodLoaded(items));
    } catch (e) {
      emit(FoodError('Failed to fetch food items: $e'));
    }
  }
}
