/// Product model for farm produce
class Product {
  final String id;
  final String farmerId;
  final String farmerName;
  final String farmerImage;
  final String productName;
  final String category;
  final double price; // Price per kg or unit
  final int quantityAvailable;
  final String description;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String location;
  final DateTime createdAt;
  final bool isAvailable;

  Product({
    required this.id,
    required this.farmerId,
    required this.farmerName,
    required this.farmerImage,
    required this.productName,
    required this.category,
    required this.price,
    required this.quantityAvailable,
    required this.description,
    required this.imageUrl,
    this.rating = 0.0,
    this.reviewCount = 0,
    required this.location,
    required this.createdAt,
    this.isAvailable = true,
  });

  /// Create a copy with modified fields
  Product copyWith({
    String? id,
    String? farmerId,
    String? farmerName,
    String? farmerImage,
    String? productName,
    String? category,
    double? price,
    int? quantityAvailable,
    String? description,
    String? imageUrl,
    double? rating,
    int? reviewCount,
    String? location,
    DateTime? createdAt,
    bool? isAvailable,
  }) {
    return Product(
      id: id ?? this.id,
      farmerId: farmerId ?? this.farmerId,
      farmerName: farmerName ?? this.farmerName,
      farmerImage: farmerImage ?? this.farmerImage,
      productName: productName ?? this.productName,
      category: category ?? this.category,
      price: price ?? this.price,
      quantityAvailable: quantityAvailable ?? this.quantityAvailable,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'farmerId': farmerId,
      'farmerName': farmerName,
      'farmerImage': farmerImage,
      'productName': productName,
      'category': category,
      'price': price,
      'quantityAvailable': quantityAvailable,
      'description': description,
      'imageUrl': imageUrl,
      'rating': rating,
      'reviewCount': reviewCount,
      'location': location,
      'createdAt': createdAt.toIso8601String(),
      'isAvailable': isAvailable,
    };
  }

  /// Create from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      farmerId: json['farmerId'] as String,
      farmerName: json['farmerName'] as String,
      farmerImage: json['farmerImage'] as String,
      productName: json['productName'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      quantityAvailable: json['quantityAvailable'] as int,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] as int? ?? 0,
      location: json['location'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isAvailable: json['isAvailable'] as bool? ?? true,
    );
  }
}

/// Cart item model
class CartItem {
  final String productId;
  final Product product;
  int quantity;

  CartItem({
    required this.productId,
    required this.product,
    this.quantity = 1,
  });

  /// Calculate total price for this cart item
  double get totalPrice => product.price * quantity;

  /// Create a copy with modified fields
  CartItem copyWith({
    String? productId,
    Product? product,
    int? quantity,
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  /// Create from JSON
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'] as String,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int? ?? 1,
    );
  }
}
