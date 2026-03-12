import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/Home_Feature/manager/foodServices.dart';
import 'package:food_delivery_app/features/Home_Feature/models/foodCardModel.dart'; // ✅

part 'searchState.dart';

class SearchCubit extends Cubit<SearchState> {
  final FoodServices service = FoodServices();

  SearchCubit() : super(SearchInitial());

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    try {
      final items = await service.searchFood(query: query);
      emit(SearchLoaded(items));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
