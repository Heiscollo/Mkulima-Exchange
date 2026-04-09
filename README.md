# Mkulima Exchange - Flutter Mobile Marketplace

A production-ready Flutter mobile marketplace application that connects farmers directly with consumers in Kenya, eliminating middlemen and enabling fair pricing.

## 🎯 Project Overview

Mkulima Exchange is a Final Year Computer Science project designed to:
- Allow farmers to list farm produce
- Enable consumers to buy directly from farmers  
- Improve transparency of pricing
- Increase farmers' income
- Provide simple and accessible marketplace for agricultural products in Kenya

## ✨ Features Implemented

### Authentication
- ✅ Splash Screen with 3-second delay
- ✅ Onboarding screens (3 pages with illustrations)
- ✅ Login screen with email/password and Google login
- ✅ Registration screen with account type selection (Farmer/Consumer)
- ✅ Forgot Password flow with email reset

### Marketplace
- ✅ Home page with featured products and nearby farmers
- ✅ Marketplace with filtering by category and search
- ✅ Product details page with farmer information
- ✅ Responsive product grid/list views
- ✅ Product ratings and reviews display

### User Features
- ✅ Shopping cart management
- ✅ Order tracking (Active & Completed)
- ✅ User profile with account information
- ✅ Order history with status indicators

### Farmer Features
- ✅ Add product (with image upload, category, price, quantity)
- ✅ Manage products dashboard
- ✅ View farmer orders

### Design & UI
- ✅ Material Design 3 compliant
- ✅ Agricultural-themed color system (Deep Green, Light Green, Amber)
- ✅ Poppins font family throughout
- ✅ Smooth animations and transitions
- ✅ Card-based layout with rounded corners
- ✅ Responsive design for mobile

### Architecture
- ✅ Clean architecture with feature-based structure
- ✅ Modular code organization
- ✅ Reusable widgets
- ✅ Mock data service for development
- ✅ Form validation utilities
- ✅ Extension methods for common operations

## 📁 Project Structure

```
lib/
├── core/                          # Core functionality
│   ├── theme/
│   │   └── app_theme.dart        # Material Design 3 theme
│   ├── constants/
│   │   └── app_constants.dart    # App-wide constants
│   └── utils/
│       ├── validators.dart        # Form validators
│       └── extensions.dart        # Useful extensions
│
├── features/                      # Feature modules
│   ├── auth/
│   │   ├── login/
│   │   ├── register/
│   │   ├── forgot_password/
│   │   ├── splash/
│   │   └── onboarding/
│   │
│   ├── home/
│   │   └── home_screen.dart      # Home page
│   │
│   ├── marketplace/
│   │   ├── product_list/         # Marketplace listing
│   │   ├── product_details/      # Product details page
│   │   └── search/               # Search functionality
│   │
│   ├── cart/
│   │   └── cart_screen.dart
│   │
│   ├── orders/
│   │   └── orders_screen.dart
│   │
│   ├── profile/
│   │   └── profile_screen.dart
│   │
│   └── farmer/
│       ├── add_product/
│       ├── manage_products/
│       └── orders/
│
├── models/
│   ├── user_model.dart
│   ├── product_model.dart
│   ├── order_model.dart
│   └── models.dart               # Model barrel export
│
├── services/
│   └── mock_data_service.dart    # Mock data for development
│
├── widgets/
│   └── custom_widgets.dart       # Reusable widgets
│
├── app_shell.dart                # Bottom navigation shell
├── router.dart                   # GoRouter configuration
└── main.dart                     # App entry point
```

## 🎨 Color Palette

| Color | Use | Hex |
|-------|-----|-----|
| Deep Green | Primary color | #2E7D32 |
| Light Green | Secondary color | #81C784 |
| Amber Orange | Accent color | #F9A825 |
| Light Gray | Background | #F5F5F5 |
| Dark Gray | Text primary | #212121 |

## 📦 Dependencies

### State Management & Routing
- `flutter_riverpod` - State management
- `go_router` - Modern navigation

### Firebase
- `firebase_core` - Firebase core
- `firebase_auth` - Authentication
- `cloud_firestore` - Database
- `firebase_storage` - File storage

### UI & Utilities
- `google_fonts` - Poppins font
- `flutter_svg` - SVG support
- `cached_network_image` - Image caching
- `intl` - Internationalization
- `fluttertoast` - Toast notifications
- `image_picker` - Image selection

### Form & Validation
- `form_validator` - Form validation

## 🚀 Getting Started

### Prerequisites
- Flutter 3.0+
- Dart 3.0+
- Android SDK / iOS SDK

### Installation

1. **Configure environment:**
   ```bash
   flutter pub get
   ```

2. **Update pubspec.yaml fonts (if needed):**
   Download Poppins font files and place in `assets/fonts/`

3. **Run the app:**
   ```bash
   flutter run
   ```

4. **Build for production:**
   ```bash
   # Android
   flutter build apk --release
   flutter build appbundle --release
   
   # iOS
   flutter build ios --release
   ```

## 📱 Screens Overview

| Screen | Purpose |
|--------|---------|
| Splash | Welcome screen with 3-second delay |
| Onboarding | 3 screens explaining app features |
| Login | User authentication |
| Register | New user signup |
| Forgot Password | Password reset flow |
| Home | Featured products & nearby farmers |
| Marketplace | Browse all products with filtering |
| Product Details | Full product information |
| Cart | Manage shopping cart |
| Orders | Track orders (Active & Completed) |
| Profile | User account management |

## 🔐 Security Considerations

- ✅ Form validation on all inputs
- ✅ Password strength requirements
- ✅ Error handling throughout app
- ⚠️ Firebase Auth integration needed (placeholder ready)
- ⚠️ HTTPS only for API calls

## 🔄 Next Steps / Enhancements

1. **Backend Integration**
   - Connect to Firebase Authentication
   - Integrate Firestore for data persistence
   - Setup Firebase Storage for images

2. **Payment Processing**
   - Integrate M-Pesa for payments
   - Implement checkout flow
   - Order confirmation emails

3. **Push Notifications**
   - Order status updates
   - New product alerts
   - Messages from farmers

4. **Advanced Features**
   - Real-time chat with farmers
   - Quality ratings and reviews
   - Delivery tracking with maps
   - Wishlist functionality
   - Social sharing

5. **Performance**
   - Implement pagination for product lists
   - Optimize images
   - Add offline support
   - Database indexing

## 🧪 Testing

```bash
# Run tests
flutter test

# Generate coverage
flutter test --coverage
```

## 📸 Screenshots

[Screenshots coming soon]

## 📄 License

This project is part of a Final Year Computer Science project.

## 👥 Team

- Project Lead: [Your Name]
- Contributors: [Team Members]

## 📞 Support

For issues and questions, please contact the development team.

---

**Built with ❤️ using Flutter**
