import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/items_details/manager/item_repo.dart';
import 'package:food_delivery_app/features/items_details/manager/item_states.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit(this.getItemRepo) : super(ItemInitialState());

  final GetItemRepo getItemRepo;

  //in case loading data from firbase

  Future<void> fetchItemData() async {
    emit(ItemLoadingState());
    try {
      final items = await getItemRepo.getItemDetails();
      if (items.isNotEmpty) {
        emit(ItemSuccessState(items.first));
      } else {
        emit(ItemFailureState('No item details found'));
      }
    } catch (e) {
      emit(ItemFailureState(e.toString()));
      throw Exception(e.toString());
    }
  }
}
