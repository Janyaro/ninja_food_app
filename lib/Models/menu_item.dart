class MenuItem {
  final String restaurantId;
  final String name;
  final String desc;
  final double price;
  final String imageUrl;
  final String category;
  final bool isAvailable;

  const MenuItem({
    required this.restaurantId,
    required this.name,
    required this.desc,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.isAvailable,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        restaurantId: json['restaurantId'] as String,
        name: json['name'] as String,
        desc: json['desc'] as String,
        price: (json['price'] as num).toDouble(),
        imageUrl: json['imageUrl'] as String,
        category: json['category'] as String,
        isAvailable: json['isAvailable'] as bool,
      );

  Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
        "name": name,
        "desc": desc,
        "price": price,
        "imageUrl": imageUrl,
        "category": category,
        "isAvailable": isAvailable,
      };
}
