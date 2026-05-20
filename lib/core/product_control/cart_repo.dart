import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/core/product_control/models/main_product_model.dart';
import 'package:food_delivery_app/core/utils/firebase_service.dart';

class CartRepo {
  FirebaseFirestore firestore = FireBaseService.firestoreInstance;

  CartRepo(this.firestore);

  final String userId = FirebaseAuth.instance.currentUser!.uid;

  final String collection = 'cart';

  // add to cart method
  Future<void> addToCart(ProductModel item) async {
    await firestore
        .collection(collection)
        .doc(userId)
        .collection('items')
        .doc(item.id)
        .set(item.toJson(), SetOptions(merge: true));
  }

  // remove from cart method
  Future<void> removeFromCart(String productId) async {
    await firestore
        .collection(collection)
        .doc(userId)
        .collection('items')
        .doc(productId)
        .delete();
  }

  // update cart item method
  Future<void> updateCartItem(ProductModel item) async {
    await firestore
        .collection(collection)
        .doc(userId)
        .collection('items')
        .doc(item.id)
        .update({'quantity': item.quantity});
  }

  // stream cart items method
  Stream<List<ProductModel>> streamCartItems() {
    return firestore
        .collection(collection)
        .doc(userId)
        .collection('items')
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return ProductModel.fromFirestore(doc);
          }).toList();
        });
  }
}
