# Contributing to Mkulima Exchange

Thank you for your interest in contributing to Mkulima Exchange! This document provides guidelines and instructions for contributing.

## Code of Conduct

- Be respectful and constructive in all interactions
- Follow Flutter and Dart best practices
- Write clean, readable, and well-commented code
- Test your changes thoroughly before submitting

## Getting Started

1. Fork the repository
2. Clone your fork locally
3. Create a new branch for your feature: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Run tests to ensure everything works
6. Commit your changes: `git commit -m "Add your feature description"`
7. Push to your fork and submit a pull request

## Development Setup

```bash
# Get dependencies
flutter pub get

# Run code formatter
dart format lib/

# Run analyzer
flutter analyze

# Run tests
flutter test
```

## Code Style Guidelines

### Naming Conventions
- Classes: `PascalCase` (e.g., `LoginScreen`, `UserModel`)
- Constants: `camelCase` (e.g., `appTitle`, `primaryColor`)
- Functions/Methods: `camelCase` (e.g., `getUser()`, `handleSubmit()`)
- Variables: `camelCase` (e.g., `userName`, `isLoading`)
- File names: `snake_case` (e.g., `login_screen.dart`, `user_model.dart`)

### Code Organization

```dart
import 'package:flutter/material.dart';  // Dart/Flutter imports first
import 'package:go_router/go_router.dart'; // Package imports

import 'package:mkulima_exchange/core/theme/app_theme.dart'; // Relative imports

// Constants
const String appName = 'Mkulima Exchange';

// Main widget/class
class YourWidget extends StatefulWidget {
  // Constructor
  const YourWidget({Key? key}) : super(key: key);

  @override
  State<YourWidget> createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  // Variables
  late String variable;

  @override
  void initState() {
    super.initState();
    // Initialize
  }

  @override
  void dispose() {
    // Clean up
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // UI
    );
  }

  // Private methods
  void _privateMethod() {}

  // Public methods
  void publicMethod() {}
}
```

## Commit Message Guidelines

- Start with a verb: "Add", "Fix", "Update", "Remove", "Refactor"
- Keep it concise and descriptive
- Reference issues when applicable: "Fix #123 - Description"

Examples:
```
Add login screen UI
Fix navigation bug in marketplace
Update product card styling
Refactor cart calculation logic
```

## Pull Request Process

1. Update `README.md` with details of changes if applicable
2. Ensure all tests pass and analyzer shows no errors
3. Describe your changes clearly in the PR description
4. Link any related issues
5. Request review from maintainers

## Feature Development Process

### Adding a New Screen

1. Create feature folder: `lib/features/feature_name/`
2. Create screen file: `lib/features/feature_name/feature_name_screen.dart`
3. Create router: Update `router.dart` with new route
4. Add navigation: Update relevant screens to navigate to new feature
5. Create mock data if needed: Update `mock_data_service.dart`
6. Test thoroughly

### Adding a New Widget

1. Add to `lib/widgets/custom_widgets.dart`
2. Document with comments
3. Include example usage in comments
4. Test in multiple contexts

### Adding New Models

1. Create in `lib/models/new_model.dart`
2. Include `fromJson()` and `toJson()` for serialization
3. Include `copyWith()` method for immutability
4. Export in `lib/models/models.dart`

## Testing

Write tests for:
- Model serialization/deserialization
- Widget behavior
- Navigation flows
- Business logic

```bash
flutter test
```

## Performance Considerations

- Use `const` constructors where possible
- Optimize image loading with `cached_network_image`
- Implement pagination for large lists
- Use `FutureBuilder` for async operations only when needed
- Profile with Flutter DevTools

## Accessibility

- Ensure sufficient color contrast
- Add semantic labels to interactive elements
- Support text scaling
- Provide meaningful alt text for images
- Test with accessibility tools

## Documentation

- Comment public APIs
- Include examples for complex widgets
- Document state management patterns
- Add architectural decisions in comments

Example:
```dart
/// Widget that displays a list of products
/// 
/// Takes a [List<Product>] and displays them in a grid
/// Uses [GridView.builder] for performance with large lists
/// 
/// Example:
/// ```dart
/// ProductGrid(products: myProducts)
/// ```
class ProductGrid extends StatelessWidget {
  final List<Product> products;

  const ProductGrid({required this.products});

  @override
  Widget build(BuildContext context) => ...;
}
```

## Report Issues

When reporting bugs, include:
- Flutter version: `flutter --version`
- Device/Emulator info
- Steps to reproduce
- Expected vs actual behavior
- Screenshots/videos if applicable

## Need Help?

- Check existing issues and PRs
- Review the code comments and documentation
- Ask questions in pull requests
- Contact the development team

---

Thank you for contributing to making Mkulima Exchange better! 🌱
