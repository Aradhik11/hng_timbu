class Product {
  final String name;
  final String description;
  final String photo;
  final double currentPrice;
  final double availableQuantity;

  Product(
      {required this.name,
      required this.description,
      required this.photo,
      required this.currentPrice,
      required this.availableQuantity});

  factory Product.fromJson(Map<String, dynamic> json) {
    String photo = 'https://via.placeholder.com/150';
    if (json['photos'] != null && json['photos'].isNotEmpty) {
      photo = 'https://api.timbu.cloud/images/' + json['photos'][0]['url'];
    }
    double currentPrice = 0.0;
    if (json['current_price'] != null && json['current_price'].isNotEmpty) {
      currentPrice = json['current_price'][0]['NGN'][0].toDouble();
    }

    return Product(
        name: json['name'],
        description: json['description'] ?? 'No description  available',
        photo: photo,
        currentPrice: currentPrice,
        availableQuantity: json['available_quantity']);
  }
}
