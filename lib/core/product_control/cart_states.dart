import 'package:food_delivery_app/core/product_control/models/main_product_model.dart';

enum CartSyncStatus { synced, syncing, failed, loading, error }

class CartState {
  final List<ProductModel> cartItems;
  final CartSyncStatus status;
  final String? errorMessage;

  CartState({required this.cartItems, required this.status, this.errorMessage});

  // initial state
  factory CartState.initial() {
    return CartState(cartItems: [], status: CartSyncStatus.synced);
  }

  // helper copyWith
  CartState copyWith({
    List<ProductModel>? cartItems,
    CartSyncStatus? status,
    String? errorMessage,
  }) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
