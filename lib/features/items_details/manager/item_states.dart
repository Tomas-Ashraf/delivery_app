import 'package:food_delivery_app/features/items_details/models/item_model.dart';

abstract class ItemState {}

class ItemInitialState extends ItemState {}

class ItemLoadingState extends ItemState {}

class ItemSuccessState extends ItemState {
  final ItemModel itemModel;
  ItemSuccessState(this.itemModel);
}

class ItemFailureState extends ItemState {
  final String error;
  ItemFailureState(this.error);
}
