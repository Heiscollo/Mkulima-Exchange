import 'package:flutter/material.dart';

/// Application-wide constants and configuration
class AppConstants {
  // App Info
  static const String appName = 'Mkulima Exchange';
  static const String appTagline = 'Connecting Farmers to Markets';
  static const String appVersion = '1.0.0';

  // Timing
  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration animationDuration = Duration(milliseconds: 300);

  // API & Firebase Configuration
  static const String firebaseProjectId = 'mkulima-exchange';
  static const String firebaseWebApiKey = 'YOUR_WEB_API_KEY';

  // Validation Patterns
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String phonePattern = r'^(?:[+]?(\d{1,3}))?[- (]?(\\d{3})[- )]?(\d{3})[- ]?(\d{4})$';
  static const String passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';

  // Validation Messages
  static const String errorEmailInvalid = 'Please enter a valid email address';
  static const String errorPasswordShort = 'Password must be at least 8 characters';
  static const String errorPasswordWeak =
      'Password must contain uppercase, lowercase, number, and special character';
  static const String errorPasswordMismatch = 'Passwords do not match';
  static const String errorPhoneInvalid = 'Please enter a valid phone number';
  static const String errorNameEmpty = 'Full name cannot be empty';
  static const String errorRequired = 'This field is required';
  static const String errorGeneral = 'An error occurred. Please try again.';

  // Success Messages
  static const String successRegistration = 'Registration successful!';
  static const String successLogin = 'Login successful!';
  static const String successAddedToCart = 'Product added to cart';
  static const String successOrderPlaced = 'Order placed successfully';
  static const String successProfileUpdated = 'Profile updated successfully';

  // Product Categories
  static const List<String> productCategories = [
    'Vegetables',
    'Fruits',
    'Grains',
    'Dairy',
    'Poultry',
  ];

  // Delivery Status
  static const List<String> deliveryStatus = [
    'Pending',
    'Processing',
    'In Transit',
    'Delivered',
    'Cancelled',
  ];

  // Image Sizes
  static const double productImageHeight = 200;
  static const double productCardHeight = 280;
  static const double cartItemImageSize = 80;
}

/// Route names for navigation
class AppRoutes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';
  static const String marketplace = '/marketplace';
  static const String productDetails = '/marketplace/details/:id';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String orders = '/orders';
  static const String orderDetails = '/orders/:id';
  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';
  static const String farmerDashboard = '/farmer/dashboard';
  static const String addProduct = '/farmer/add-product';
  static const String manageProducts = '/farmer/manage-products';
  static const String editProduct = '/farmer/edit-product/:id';
  static const String farmerOrders = '/farmer/orders';
}

/// Keyboard types for different input fields
class KeyboardConfig {
  static const emailKeyboard = TextInputType.emailAddress;
  static const phoneKeyboard = TextInputType.phone;
  static const priceKeyboard = TextInputType.numberWithOptions(decimal: true);
  static const quantityKeyboard = TextInputType.number;
}

// Placeholder text constants
class PlaceholderText {
  static const String enterEmail = 'Enter your email address';
  static const String enterPassword = 'Enter your password';
  static const String enterFullName = 'Enter your full name';
  static const String enterPhoneNumber = 'Enter your phone number';
  static const String enterProductName = 'Enter product name';
  static const String enterPrice = 'Enter price per kg';
  static const String enterQuantity = 'Enter quantity available';
}

enum AccountType { farmer, consumer }

enum OrderStatus { pending, processing, inTransit, delivered, cancelled }

enum ProductCategory { vegetables, fruits, grains, dairy, poultry }
