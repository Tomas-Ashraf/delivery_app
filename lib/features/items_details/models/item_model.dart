class ItemModel {
  final String id;
  final String name;
  final String price;
  final List<String> images;
  final String deliveryInfo;
  final String returnPolicy;
  final bool isAvailable;

  final bool isFavorite;

  ItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.images,
    required this.deliveryInfo,
    required this.returnPolicy,
    required this.isAvailable,
    this.isFavorite = false,
  });

  // from json item model
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'] ?? 'Unknown Item',
      price: json['price'].toString(),
      images: List<String>.from(json['images'] ?? []),
      deliveryInfo: json['deliveryInfo'] ?? 'No delivery information available',
      returnPolicy: json['returnPolicy'] ?? 'No return policy available',
      isAvailable: json['isAvailable'] ?? false,
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
