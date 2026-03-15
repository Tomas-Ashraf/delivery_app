import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app/features/Home_Feature/models/foodCardModel.dart';

class FoodServices {
  final _firestore = FirebaseFirestore.instance;

  static const String collection = 'products';

  Future<List<FoodCardModel>> getFood({String category = 'All'}) async {
    try {
      Query query = _firestore.collection(collection);
      if (category != 'All') {
        query = query.where('category', isEqualTo: category);
      }
      final snapshot = await query.get();
      return snapshot.docs
          .map((doc) => FoodCardModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Error fetching food: $e');
      return [];
    }
  }

  Future<List<FoodCardModel>> searchFood({required String query}) async {
    try {
      final snapshot = await _firestore.collection(collection).get();

      final q = query.toLowerCase();
      return snapshot.docs
          .map((doc) => FoodCardModel.fromFirestore(doc))
          .where(
            (item) =>
                item.title.toLowerCase().contains(q) ||
                item.category.toLowerCase().contains(q),
          )
          .toList();
    } catch (e) {
      print('Error searching food: $e');
      return [];
    }
  }
}
