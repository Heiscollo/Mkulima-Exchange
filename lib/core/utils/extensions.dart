import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// String extensions
extension StringExtension on String {
  /// Capitalize first letter of string
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Check if string is a valid email
  bool isValidEmail() {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }
}

/// DateTime extensions
extension DateTimeExtension on DateTime {
  /// Format date as "MMM dd, yyyy"
  String toFormattedDate() {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  /// Format date as "dd/MM/yyyy"
  String toShortDate() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  /// Format datetime as "MMM dd, yyyy - HH:mm"
  String toFormattedDateTime() {
    return DateFormat('MMM dd, yyyy - HH:mm').format(this);
  }

  /// Check if date is today
  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Get time ago string (e.g., "2 hours ago")
  String timeAgo() {
    final duration = DateTime.now().difference(this);

    if (duration.inDays > 0) {
      return '${duration.inDays}d ago';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}h ago';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}

/// Number extensions
extension NumberExtension on num {
  /// Format number as currency (KES)
  String toCurrency({String symbol = 'KES '}) {
    return '$symbol${toStringAsFixed(2)}';
  }

  /// Format number with thousand separators
  String toFormatted() {
    return NumberFormat('#,##0').format(this);
  }

  /// Format with 2 decimal places
  String toDecimal() {
    return toStringAsFixed(2);
  }
}

/// BuildContext extensions
extension BuildContextExtension on BuildContext {
  /// Get screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Get screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Get device padding (for notch/cutout)
  EdgeInsets get devicePadding => MediaQuery.of(this).padding;

  /// Check if device is in landscape
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  /// Check if device is in portrait
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  /// Check if device is tablet
  bool get isTablet => screenWidth > 600;

  /// Get theme data
  ThemeData get theme => Theme.of(this);

  /// Get text theme
  TextTheme get textTheme => theme.textTheme;

  /// Get color scheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Show snackbar
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 2),
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        backgroundColor: backgroundColor,
      ),
    );
  }

  /// Show error snackbar
  void showErrorSnackBar(String message) {
    showSnackBar(
      message,
      backgroundColor: theme.colorScheme.error,
    );
  }

  /// Show success snackbar
  void showSuccessSnackBar(String message) {
    showSnackBar(
      message,
      backgroundColor: Colors.green,
    );
  }
}

/// List extensions
extension ListExtension<T> on List<T> {
  /// Check if list is empty or null
  bool get isEmptyOrNull => isEmpty;

  /// Check if list is not empty
  bool get isNotEmptyOrNull => isNotEmpty;

  /// Get first element or null
  T? firstOrNull() {
    if (isEmpty) return null;
    return first;
  }

  /// Get last element or null
  T? lastOrNull() {
    if (isEmpty) return null;
    return last;
  }
}

/// Widget extensions
extension WidgetExtension on Widget {
  /// Add padding to widget
  Widget withPadding(EdgeInsets padding) {
    return Padding(padding: padding, child: this);
  }

  /// Add center alignment
  Widget center() => Center(child: this);

  /// Add horizontal padding
  Widget horizontalPadding(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  /// Add vertical padding
  Widget verticalPadding(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }

  /// Add all sides padding
  Widget allPadding(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }
}
