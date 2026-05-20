import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final double price;
  final List<String> images;
  String? deliveryInfo;
  String? returnPolicy;
  bool? isAvailable;
  bool? isFavorite;
  final String category;
  int quantity;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.images,
    this.deliveryInfo,
    this.returnPolicy,
    this.isAvailable,
    this.isFavorite = false,
    this.quantity = 1,
    this.category = 'All',
  });

  // From Json
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Unknown Product',
      price: json['price'].toDouble() ?? 0.0,
      images: List<String>.from(json['images'] ?? []),
      deliveryInfo: json['deliveryInfo'] ?? 'No delivery information available',
      returnPolicy: json['returnPolicy'] ?? 'No return policy available',
      isAvailable: json['isAvailable'] ?? false,
      isFavorite: json['isFavorite'] ?? false,
      quantity: json['quantity'] ?? 1,
      category: json['category'] ?? 'All',
    );
  }

  // from Firestore document
  factory ProductModel.fromFirestore(
    QueryDocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();

    return ProductModel(
      id: doc.id,
      name: data['name'] ?? 'Unknown Product',
      price: data['price'].toDouble() ?? 0.0,
      images: List<String>.from(data['images'] ?? []),
      deliveryInfo: data['deliveryInfo'] ?? 'No delivery information available',
      returnPolicy: data['returnPolicy'] ?? 'No return policy available',
      isAvailable: data['isAvailable'] ?? false,
      isFavorite: data['isFavorite'] ?? false,
      quantity: data['quantity'] ?? 1,
      category: data['category'] ?? 'All',
    );
  }

  // Copy with for updating the product details
  ProductModel copyWith({
    String? id,
    String? name,
    double? price,
    List<String>? images,
    String? deliveryInfo,
    String? returnPolicy,
    bool? isAvailable,
    bool? isFavorite,
    String? category,
    int? quantity,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      images: images ?? this.images,
      deliveryInfo: deliveryInfo ?? this.deliveryInfo,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      isAvailable: isAvailable ?? this.isAvailable,
      isFavorite: isFavorite ?? this.isFavorite,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
    );
  }

  // To Json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'images': images,
      'deliveryInfo': deliveryInfo,
      'returnPolicy': returnPolicy,
      'isAvailable': isAvailable,
      'isFavorite': isFavorite,
      'quantity': quantity,
      'category': category,
    };
  }
}
