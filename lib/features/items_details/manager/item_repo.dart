import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app/core/product_control/models/main_product_model.dart';
import 'package:food_delivery_app/core/utils/firebase_service.dart';

class GetItemRepo {
  FirebaseFirestore firestore = FireBaseService.firestoreInstance;

  GetItemRepo(this.firestore);

  Future<List<ProductModel>> getItemDetails() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('items').get();

      print("Docs count: ${snapshot.docs.length}");
      print("Data: ${snapshot.docs.map((e) => e.data())}");

      List<ProductModel> products = snapshot.docs
          .map(
            (doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>),
          )
          .toList();
      return products;
    } catch (e) {
      throw Exception('Failed to fetch item details');
    }
  }
}
