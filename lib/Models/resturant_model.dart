class Restaurant {
  final String name;
  final String logoUrl;
  final String bannerUrl;
  final int etaMins;
  final double rating;       // 0.0 – 5.0
  final double deliveryFee;  // >= 0
  final bool isOpen;

  const Restaurant({
    required this.name,
    required this.logoUrl,
    required this.bannerUrl,
    required this.etaMins,
    required this.rating,
    required this.deliveryFee,
    required this.isOpen,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        name: json['name'] as String,
        logoUrl: json['logoUrl'] as String,
        bannerUrl: json['bannerUrl'] as String,
        etaMins: (json['etaMins'] as num).toInt(),
        rating: (json['rating'] as num).toDouble(),
        deliveryFee: (json['deliveryFee'] as num).toDouble(),
        isOpen: json['isOpen'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'logoUrl': logoUrl,
        'bannerUrl': bannerUrl,
        'etaMins': etaMins,
        'rating': rating,
        'deliveryFee': deliveryFee,
        'isOpen': isOpen,
      };
}
