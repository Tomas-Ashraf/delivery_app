import 'package:cloud_firestore/cloud_firestore.dart';

class FoodCardModel {
  final String id;
  final String image;
  final String title;
  final String price;
  final String category;

  const FoodCardModel({
    required this.image,
    required this.title,
    required this.price,
    required this.id,
    required this.category,
  });

  //creat food model

  factory FoodCardModel.fromMap(Map<String, dynamic> map, String id) {
    return FoodCardModel(
      id: id,
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      price: (map['price'] != null) ? map['price'].toString() : '0.0',
      category: map['category'] ?? 'All',
    );
  }

  // method to get data from firebase
  factory FoodCardModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FoodCardModel.fromMap(data, doc.id);
  }
}
