/// User model representing both farmers and consumers
class User {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String? profileImageUrl;
  final String accountType; // 'farmer' or 'consumer'
  final String? address;
  final double? rating;
  final DateTime createdAt;
  final bool isVerified;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    this.profileImageUrl,
    required this.accountType,
    this.address,
    this.rating = 0.0,
    required this.createdAt,
    this.isVerified = false,
  });

  /// Create a copy with modified fields
  User copyWith({
    String? id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? profileImageUrl,
    String? accountType,
    String? address,
    double? rating,
    DateTime? createdAt,
    bool? isVerified,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      accountType: accountType ?? this.accountType,
      address: address ?? this.address,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImageUrl': profileImageUrl,
      'accountType': accountType,
      'address': address,
      'rating': rating,
      'createdAt': createdAt.toIso8601String(),
      'isVerified': isVerified,
    };
  }

  /// Create from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      accountType: json['accountType'] as String,
      address: json['address'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isVerified: json['isVerified'] as bool? ?? false,
    );
  }
}

/// Farmer model (extends User functionality)
class Farmer {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String? profileImageUrl;
  final String address;
  final double rating;
  final int totalProducts;
  final int totalOrders;
  final String? farmName;
  final String? farmDescription;
  final DateTime createdAt;

  Farmer({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    this.profileImageUrl,
    required this.address,
    this.rating = 0.0,
    this.totalProducts = 0,
    this.totalOrders = 0,
    this.farmName,
    this.farmDescription,
    required this.createdAt,
  });

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImageUrl': profileImageUrl,
      'address': address,
      'rating': rating,
      'totalProducts': totalProducts,
      'totalOrders': totalOrders,
      'farmName': farmName,
      'farmDescription': farmDescription,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  /// Create from JSON
  factory Farmer.fromJson(Map<String, dynamic> json) {
    return Farmer(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      address: json['address'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      totalProducts: json['totalProducts'] as int? ?? 0,
      totalOrders: json['totalOrders'] as int? ?? 0,
      farmName: json['farmName'] as String?,
      farmDescription: json['farmDescription'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}
