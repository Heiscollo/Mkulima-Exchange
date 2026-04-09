import 'product_model.dart';

/// Order model
class Order {
  final String id;
  final String consumerId;
  final String farmerId;
  final List<OrderItem> items;
  final double totalAmount;
  final String status; // 'pending', 'processing', 'inTransit', 'delivered', 'cancelled'
  final String deliveryAddress;
  final DateTime orderDate;
  final DateTime? estimatedDelivery;
  final DateTime? deliveredDate;
  final String? notes;

  Order({
    required this.id,
    required this.consumerId,
    required this.farmerId,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.deliveryAddress,
    required this.orderDate,
    this.estimatedDelivery,
    this.deliveredDate,
    this.notes,
  });

  /// Create a copy with modified fields
  Order copyWith({
    String? id,
    String? consumerId,
    String? farmerId,
    List<OrderItem>? items,
    double? totalAmount,
    String? status,
    String? deliveryAddress,
    DateTime? orderDate,
    DateTime? estimatedDelivery,
    DateTime? deliveredDate,
    String? notes,
  }) {
    return Order(
      id: id ?? this.id,
      consumerId: consumerId ?? this.consumerId,
      farmerId: farmerId ?? this.farmerId,
      items: items ?? this.items,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      orderDate: orderDate ?? this.orderDate,
      estimatedDelivery: estimatedDelivery ?? this.estimatedDelivery,
      deliveredDate: deliveredDate ?? this.deliveredDate,
      notes: notes ?? this.notes,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'consumerId': consumerId,
      'farmerId': farmerId,
      'items': items.map((item) => item.toJson()).toList(),
      'totalAmount': totalAmount,
      'status': status,
      'deliveryAddress': deliveryAddress,
      'orderDate': orderDate.toIso8601String(),
      'estimatedDelivery': estimatedDelivery?.toIso8601String(),
      'deliveredDate': deliveredDate?.toIso8601String(),
      'notes': notes,
    };
  }

  /// Create from JSON
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,
      consumerId: json['consumerId'] as String,
      farmerId: json['farmerId'] as String,
      items: (json['items'] as List)
          .map((item) => OrderItem.fromJson(item as Map<String, dynamic>))
          .toList(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      status: json['status'] as String,
      deliveryAddress: json['deliveryAddress'] as String,
      orderDate: DateTime.parse(json['orderDate'] as String),
      estimatedDelivery: json['estimatedDelivery'] != null
          ? DateTime.parse(json['estimatedDelivery'] as String)
          : null,
      deliveredDate: json['deliveredDate'] != null
          ? DateTime.parse(json['deliveredDate'] as String)
          : null,
      notes: json['notes'] as String?,
    );
  }
}

/// Order item model (product in an order)
class OrderItem {
  final String productId;
  final String productName;
  final String productImage;
  final double unitPrice;
  final int quantity;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.unitPrice,
    required this.quantity,
  });

  /// Calculate total price for this order item
  double get totalPrice => unitPrice * quantity;

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'unitPrice': unitPrice,
      'quantity': quantity,
    };
  }

  /// Create from JSON
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      productImage: json['productImage'] as String,
      unitPrice: (json['unitPrice'] as num).toDouble(),
      quantity: json['quantity'] as int,
    );
  }
}
