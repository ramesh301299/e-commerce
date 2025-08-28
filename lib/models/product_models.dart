class Product {
  final int id;
  final String brand;
  final String name;
  final String price;
  final String imageLink;
  final String description;
  final double? rating;

  Product({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
    required this.imageLink,
    required this.description,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        brand: json['brand'] ?? '',
        name: json['name'] ?? '',
        price: json['price'] ?? '0',
        imageLink: json['image_link'] ?? '',
        description: json['description'] ?? '',
        rating: (json['rating'] != null)
            ? double.parse(json['rating'].toString())
            : 0.0,
      );
}
