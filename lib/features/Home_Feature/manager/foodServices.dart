import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app/core/product_control/models/main_product_model.dart';

class FoodServices {
  final _firestore = FirebaseFirestore.instance;

  static const String collection = 'items';

  Future<List<ProductModel>> getFood({String category = 'All'}) async {
    try {
      Query<Map<String, dynamic>> query = _firestore.collection(collection);
      if (category != 'All') {
        query = query.where('category', isEqualTo: category);
      }
      final QuerySnapshot<Map<String, dynamic>> snapshot = await query.get();
      return snapshot.docs
          .map((doc) => ProductModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Error fetching food: $e');
      return [];
    }
  }

  Future<List<ProductModel>> searchFood({required String query}) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection(collection)
          .get();

      final q = query.toLowerCase();
      return snapshot.docs
          .map((doc) => ProductModel.fromFirestore(doc))
          .where(
            (item) =>
                item.name.toLowerCase().contains(q) ||
                item.category.toLowerCase().contains(q),
          )
          .toList();
    } catch (e) {
      print('Error searching food: $e');
      return [];
    }
  }
}
