import 'package:mkulima_exchange/models/models.dart';

/// Mock data service providing dummy data for development
class MockDataService {
  /// Get all products (marketplace)
  static List<Product> getAllProducts() {
    return [
      Product(
        id: '1',
        farmerId: 'farmer1',
        farmerName: 'John Mwangi',
        farmerImage: 'https://via.placeholder.com/100?text=Farmer1',
        productName: 'Fresh Tomatoes',
        category: 'Vegetables',
        price: 80.0,
        quantityAvailable: 500,
        description:
            'Fresh, ripe tomatoes picked from our farm. Rich in vitamin C and perfect for salads and cooking. Delivered fresh within 24 hours.',
        imageUrl: 'https://via.placeholder.com/400?text=Tomatoes',
        rating: 4.8,
        reviewCount: 245,
        location: 'Nairobi, Kenya',
        createdAt: DateTime(2024, 1, 15),
      ),
      Product(
        id: '2',
        farmerId: 'farmer2',
        farmerName: 'Grace Kipchoge',
        farmerImage: 'https://via.placeholder.com/100?text=Farmer2',
        productName: 'Organic Kale',
        category: 'Vegetables',
        price: 150.0,
        quantityAvailable: 300,
        description:
            'Organically grown kale with no pesticides. Perfect for smoothies and salads. High in iron and calcium.',
        imageUrl: 'https://via.placeholder.com/400?text=Kale',
        rating: 4.9,
        reviewCount: 189,
        location: 'Kisumu, Kenya',
        createdAt: DateTime(2024, 1, 20),
      ),
      Product(
        id: '3',
        farmerId: 'farmer1',
        farmerName: 'John Mwangi',
        farmerImage: 'https://via.placeholder.com/100?text=Farmer1',
        productName: 'Ripe Mangoes',
        category: 'Fruits',
        price: 120.0,
        quantityAvailable: 200,
        description:
            'Sweet and juicy mangoes at peak ripeness. Hand-selected for quality. Perfect for fresh juice or eating.',
        imageUrl: 'https://via.placeholder.com/400?text=Mangoes',
        rating: 4.7,
        reviewCount: 312,
        location: 'Nairobi, Kenya',
        createdAt: DateTime(2024, 1, 18),
      ),
      Product(
        id: '4',
        farmerId: 'farmer3',
        farmerName: 'Samuel Ochieng',
        farmerImage: 'https://via.placeholder.com/100?text=Farmer3',
        productName: 'Fresh Strawberries',
        category: 'Fruits',
        price: 250.0,
        quantityAvailable: 150,
        description:
            'Sweet strawberries with great flavor. Packed with antioxidants. Order today for same-day delivery.',
        imageUrl: 'https://via.placeholder.com/400?text=Strawberries',
        rating: 4.6,
        reviewCount: 156,
        location: 'Mombasa, Kenya',
        createdAt: DateTime(2024, 1, 22),
      ),
      Product(
        id: '5',
        farmerId: 'farmer2',
        farmerName: 'Grace Kipchoge',
        farmerImage: 'https://via.placeholder.com/100?text=Farmer2',
        productName: 'Brown Maize',
        category: 'Grains',
        price: 45.0,
        quantityAvailable: 1000,
        description:
            'Locally grown brown maize. Excellent for porridge and traditional meals. Bulk orders welcome.',
        imageUrl: 'https://via.placeholder.com/400?text=Maize',
        rating: 4.5,
        reviewCount: 98,
        location: 'Kisumu, Kenya',
        createdAt: DateTime(2024, 1, 10),
      ),
      Product(
        id: '6',
        farmerId: 'farmer4',
        farmerName: 'Mary Kariuki',
        farmerImage: 'https://via.placeholder.com/100?text=Farmer4',
        productName: 'Fresh Milk (1L)',
        category: 'Dairy',
        price: 50.0,
        quantityAvailable: 400,
        description:
            'Fresh, pasteurized cow milk. Delivered in the morning. Rich in calcium and nutrients.',
        imageUrl: 'https://via.placeholder.com/400?text=Milk',
        rating: 4.9,
        reviewCount: 567,
        location: 'Nakuru, Kenya',
        createdAt: DateTime(2024, 1, 19),
      ),
      Product(
        id: '7',
        farmerId: 'farmer5',
        farmerName: 'David Kiplagat',
        farmerImage: 'https://via.placeholder.com/100?text=Farmer5',
        productName: 'Free-range Eggs (Dozen)',
        category: 'Poultry',
        price: 120.0,
        quantityAvailable: 250,
        description:
            'Fresh eggs from free-range chickens. No antibiotics or hormones. Perfect for baking and cooking.',
        imageUrl: 'https://via.placeholder.com/400?text=Eggs',
        rating: 4.8,
        reviewCount: 432,
        location: 'Eldoret, Kenya',
        createdAt: DateTime(2024, 1, 21),
      ),
      Product(
        id: '8',
        farmerId: 'farmer3',
        farmerName: 'Samuel Ochieng',
        farmerImage: 'https://via.placeholder.com/100?text=Farmer3',
        productName: 'Fresh Bananas',
        category: 'Fruits',
        price: 70.0,
        quantityAvailable: 600,
        description:
            'Ripe and ready to eat bananas. Great source of potassium. Available year-round.',
        imageUrl: 'https://via.placeholder.com/400?text=Bananas',
        rating: 4.7,
        reviewCount: 289,
        location: 'Mombasa, Kenya',
        createdAt: DateTime(2024, 1, 16),
      ),
    ];
  }

  /// Get product by ID
  static Product? getProductById(String productId) {
    final products = getAllProducts();
    try {
      return products.firstWhere((p) => p.id == productId);
    } catch (e) {
      return null;
    }
  }

  /// Get products by category
  static List<Product> getProductsByCategory(String category) {
    return getAllProducts().where((p) => p.category == category).toList();
  }

  /// Get products by farmer ID
  static List<Product> getProductsByFarmerId(String farmerId) {
    return getAllProducts().where((p) => p.farmerId == farmerId).toList();
  }

  /// Get all farmers
  static List<Farmer> getAllFarmers() {
    return [
      Farmer(
        id: 'farmer1',
        fullName: 'John Mwangi',
        email: 'john@mkulimaexchange.com',
        phoneNumber: '+254712345678',
        profileImageUrl: 'https://via.placeholder.com/100?text=Farmer1',
        address: 'Nairobi, Kenya',
        rating: 4.8,
        totalProducts: 45,
        totalOrders: 234,
        farmName: 'Mwangi Fresh Farms',
        farmDescription: 'Producing fresh vegetables and fruits for over 10 years',
        createdAt: DateTime(2023, 6, 1),
      ),
      Farmer(
        id: 'farmer2',
        fullName: 'Grace Kipchoge',
        email: 'grace@mkulimaexchange.com',
        phoneNumber: '+254787654321',
        profileImageUrl: 'https://via.placeholder.com/100?text=Farmer2',
        address: 'Kisumu, Kenya',
        rating: 4.9,
        totalProducts: 32,
        totalOrders: 189,
        farmName: 'Kipchoge Organic Farm',
        farmDescription: 'Dedicated to organic farming practices',
        createdAt: DateTime(2023, 8, 15),
      ),
      Farmer(
        id: 'farmer3',
        fullName: 'Samuel Ochieng',
        email: 'samuel@mkulimaexchange.com',
        phoneNumber: '+254723456789',
        profileImageUrl: 'https://via.placeholder.com/100?text=Farmer3',
        address: 'Mombasa, Kenya',
        rating: 4.7,
        totalProducts: 28,
        totalOrders: 156,
        farmName: 'Ochieng Tropical Farm',
        farmDescription: 'Specializing in tropical fruits',
        createdAt: DateTime(2023, 7, 20),
      ),
      Farmer(
        id: 'farmer4',
        fullName: 'Mary Kariuki',
        email: 'mary@mkulimaexchange.com',
        phoneNumber: '+254734567890',
        profileImageUrl: 'https://via.placeholder.com/100?text=Farmer4',
        address: 'Nakuru, Kenya',
        rating: 4.9,
        totalProducts: 15,
        totalOrders: 567,
        farmName: 'Kariuki Dairy Farm',
        farmDescription: 'Premium dairy products',
        createdAt: DateTime(2023, 5, 10),
      ),
      Farmer(
        id: 'farmer5',
        fullName: 'David Kiplagat',
        email: 'david@mkulimaexchange.com',
        phoneNumber: '+254745678901',
        profileImageUrl: 'https://via.placeholder.com/100?text=Farmer5',
        address: 'Eldoret, Kenya',
        rating: 4.8,
        totalProducts: 20,
        totalOrders: 432,
        farmName: 'Kiplagat Poultry Farm',
        farmDescription: 'Free-range eggs and poultry products',
        createdAt: DateTime(2023, 9, 5),
      ),
    ];
  }

  /// Get farmer by ID
  static Farmer? getFarmerById(String farmerId) {
    final farmers = getAllFarmers();
    try {
      return farmers.firstWhere((f) => f.id == farmerId);
    } catch (e) {
      return null;
    }
  }

  /// Get nearby farmers (mock - based on location)
  static List<Farmer> getNearbyFarmers() {
    // In a real app, this would use geolocation
    return getAllFarmers().take(3).toList();
  }

  /// Get current user (mock data)
  static User getCurrentUser() {
    return User(
      id: 'user123',
      fullName: 'Jane Doe',
      email: 'jane@example.com',
      phoneNumber: '+254798765432',
      profileImageUrl: 'https://via.placeholder.com/100?text=User',
      accountType: 'consumer',
      address: 'Nairobi, Kenya',
      rating: 0.0,
      createdAt: DateTime(2024, 1, 1),
      isVerified: true,
    );
  }

  /// Get featured products
  static List<Product> getFeaturedProducts() {
    final allProducts = getAllProducts();
    return allProducts.take(4).toList();
  }

  /// Get sample order
  static Order getSampleOrder() {
    return Order(
      id: 'order123',
      consumerId: 'user123',
      farmerId: 'farmer1',
      items: [
        OrderItem(
          productId: '1',
          productName: 'Fresh Tomatoes',
          productImage: 'https://via.placeholder.com/100?text=Tomatoes',
          unitPrice: 80.0,
          quantity: 2,
        ),
        OrderItem(
          productId: '3',
          productName: 'Ripe Mangoes',
          productImage: 'https://via.placeholder.com/100?text=Mangoes',
          unitPrice: 120.0,
          quantity: 1,
        ),
      ],
      totalAmount: 280.0,
      status: 'inTransit',
      deliveryAddress: 'Nairobi, Kenya',
      orderDate: DateTime(2024, 1, 22),
      estimatedDelivery: DateTime(2024, 1, 23),
      notes: 'Please handle with care',
    );
  }

  /// Get sample orders list
  static List<Order> getSampleOrders() {
    return [
      Order(
        id: 'order123',
        consumerId: 'user123',
        farmerId: 'farmer1',
        items: [
          OrderItem(
            productId: '1',
            productName: 'Fresh Tomatoes',
            productImage: 'https://via.placeholder.com/100?text=Tomatoes',
            unitPrice: 80.0,
            quantity: 2,
          ),
        ],
        totalAmount: 160.0,
        status: 'delivered',
        deliveryAddress: 'Nairobi, Kenya',
        orderDate: DateTime(2024, 1, 15),
        deliveredDate: DateTime(2024, 1, 16),
      ),
      Order(
        id: 'order124',
        consumerId: 'user123',
        farmerId: 'farmer2',
        items: [
          OrderItem(
            productId: '2',
            productName: 'Organic Kale',
            productImage: 'https://via.placeholder.com/100?text=Kale',
            unitPrice: 150.0,
            quantity: 1,
          ),
        ],
        totalAmount: 150.0,
        status: 'inTransit',
        deliveryAddress: 'Nairobi, Kenya',
        orderDate: DateTime(2024, 1, 20),
        estimatedDelivery: DateTime(2024, 1, 23),
      ),
      Order(
        id: 'order125',
        consumerId: 'user123',
        farmerId: 'farmer3',
        items: [
          OrderItem(
            productId: '4',
            productName: 'Fresh Strawberries',
            productImage: 'https://via.placeholder.com/100?text=Strawberries',
            unitPrice: 250.0,
            quantity: 1,
          ),
        ],
        totalAmount: 250.0,
        status: 'pending',
        deliveryAddress: 'Nairobi, Kenya',
        orderDate: DateTime(2024, 1, 22),
        estimatedDelivery: DateTime(2024, 1, 24),
      ),
    ];
  }
}
