import 'package:food_delivery_app/core/product_control/models/main_product_model.dart';

// This class is a singleton that manages the cart items in memory
//It provides methods to add, remove, set, and clear cart items
//The cart items are stored in a list of ProductModel objects
//which represent the products added to the cart along with their quantities

class CartManager {
  CartManager._internal();

  static final CartManager _instance = CartManager._internal();

  factory CartManager() => _instance;

  final List<ProductModel> cartItems = [];

  // add to cart
  void addToCart(ProductModel product) {
    final index = cartItems.indexWhere((e) => e.id == product.id);

    if (index != -1) {
      final item = cartItems[index];

      cartItems[index] = item.copyWith(quantity: item.quantity + 1);
    } else {
      cartItems.add(product.copyWith(quantity: 1));
    }
  }

  // remove from cart
  void removeFromCart(String productId) {
    cartItems.removeWhere((e) => e.id == productId);
  }

  // set cart items
  void setCartItems(List<ProductModel> items) {
    cartItems
      ..clear()
      ..addAll(items.map((e) => e.copyWith()));
  }

  // clear cart
  void clearCart() {
    cartItems.clear();
  }
}
