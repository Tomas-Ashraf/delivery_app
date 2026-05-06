import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app/features/items_details/models/item_model.dart';

class GetItemRepo {
  final FirebaseFirestore firestore;

  GetItemRepo(this.firestore);

  Future<List<ItemModel>> getItemDetails() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('items').get();


print("Docs count: ${snapshot.docs.length}");
print("Data: ${snapshot.docs.map((e) => e.data())}");

      List<ItemModel> items = snapshot.docs
          .map((doc) => ItemModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      return items;
    } catch (e) {
      throw Exception('Failed to fetch item details');
    }
  }
}
