part of 'searchCubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<FoodCardModel> items;
  SearchLoaded(this.items);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
