import 'package:form_validator/form_validator.dart';

/// Form validation utilities
class FormValidators {
  /// Validate email address
  static String? validateEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Email is required';
    }
    return ValidationBuilder().email().build()(value);
  }

  /// Validate password
  static String? validatePassword(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Password is required';
    }
    if ((value?.length ?? 0) < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  /// Validate confirm password
  static String? validateConfirmPassword(String? value, String? password) {
    if (value?.isEmpty ?? true) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  /// Validate full name
  static String? validateFullName(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Full name is required';
    }
    if ((value?.length ?? 0) < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  /// Validate phone number
  static String? validatePhoneNumber(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Phone number is required';
    }
    if ((value?.replaceAll(RegExp(r'[^0-9]'), '').length ?? 0) < 10) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  /// Validate product name
  static String? validateProductName(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Product name is required';
    }
    if ((value?.length ?? 0) < 3) {
      return 'Product name must be at least 3 characters';
    }
    return null;
  }

  /// Validate price
  static String? validatePrice(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Price is required';
    }
    final price = double.tryParse(value ?? '');
    if (price == null || price <= 0) {
      return 'Please enter a valid price';
    }
    return null;
  }

  /// Validate quantity
  static String? validateQuantity(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Quantity is required';
    }
    final quantity = int.tryParse(value ?? '');
    if (quantity == null || quantity <= 0) {
      return 'Please enter a valid quantity';
    }
    return null;
  }

  /// Validate description
  static String? validateDescription(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Description is required';
    }
    if ((value?.length ?? 0) < 10) {
      return 'Description must be at least 10 characters';
    }
    return null;
  }
}
