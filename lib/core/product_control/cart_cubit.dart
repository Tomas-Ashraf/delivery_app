import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/product_control/cart_manager.dart';
import 'package:food_delivery_app/core/product_control/cart_repo.dart';
import 'package:food_delivery_app/core/product_control/cart_states.dart';
import 'package:food_delivery_app/core/product_control/models/main_product_model.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  final cartManager = CartManager();

  StreamSubscription? cartSubscription;

  CartCubit(this.cartRepo) : super(CartState.initial()) {
    listenToCart();
  }

  // real time listener to cart changes in Firestore
  void listenToCart() {
    cartSubscription = cartRepo.streamCartItems().listen((items) {
      cartManager.setCartItems(items);

      emit(
        state.copyWith(
          cartItems: List.from(items),
          status: CartSyncStatus.synced,
        ),
      );
    });
  }

  // add to cart
  Future<void> addToCart(ProductModel product) async {
    final index = cartManager.cartItems.indexWhere((e) => e.id == product.id);

    // check if aleardy in cart, if so update quantity, else add new item with quantity 1
    if (index != -1) {
      final item = cartManager.cartItems[index];

      final updatedItem = item.copyWith(quantity: item.quantity + 1);

      await cartRepo.updateCartItem(updatedItem);
    } else {
      await cartRepo.addToCart(product.copyWith(quantity: 1));
    }
  }

  // remove from cart
  Future<void> removeFromCart(String productId) async {
    await cartRepo.removeFromCart(productId);
  }

  // update quantity
  Future<void> updateQuantity(String productId, int change) async {
    final index = cartManager.cartItems.indexWhere((e) => e.id == productId);

    //if index is -1, item is not in cart, so we do nothing
    if (index == -1) return;

    final item = cartManager.cartItems[index];

    final newQuantity = item.quantity + change;

    // remove item if quantity goes to 0 or below, otherwise update with new quantity
    if (newQuantity <= 0) {
      await removeFromCart(productId);
    } else {
      final updatedItem = item.copyWith(quantity: newQuantity);

      await cartRepo.updateCartItem(updatedItem);
    }
  }

  // total price calculation
  double get totalOrderPrice {
    return state.cartItems.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  // clear cart
  Future<void> clearCart() async {
    for (var item in state.cartItems) {
      await cartRepo.removeFromCart(item.id);
    }
  }

  @override
  Future<void> close() {
    cartSubscription?.cancel();
    return super.close();
  }
}
