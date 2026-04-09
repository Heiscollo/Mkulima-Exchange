# Mkulima Exchange - Quick Start Guide

## 🚀 Get Started in 5 Minutes

### Step 1: Install Dependencies (2 min)
```bash
cd "c:\Users\ADMIN\Mkulima Exchange"
flutter pub get
```

### Step 2: Run the App (1 min)
```bash
flutter run
```
Choose your device/emulator when prompted.

### Step 3: Explore the App (2 min)
- Splash screen → Onboarding → Login → Main App
- Try these accounts (mock data):
  - Email: any@email.com
  - Password: anypassword

---

## 🎯 Important Routes

| Screen | Route | Purpose |
|--------|-------|---------|
| Splash | `/splash` | Welcome screen |
| Onboarding | `/onboarding` | App introduction |
| Login | `/login` | User signin |
| Register | `/register` | New user signup |
| Home | `/home` | Main feed |
| Marketplace | `/marketplace` | Browse products |
| Cart | `/cart` | Shopping cart |
| Orders | `/orders` | Order tracking |
| Profile | `/profile` | User account |

---

## 📂 Key Files to Know

```
lib/main.dart                      ← App entry point
lib/router.dart                    ← Navigation routes
lib/app_shell.dart                 ← Bottom navigation
lib/core/theme/app_theme.dart      ← Colors & styling
lib/core/constants/app_constants.dart ← App constants
lib/services/mock_data_service.dart ← Test data
```

---

## 🎨 Customize These

### Colors
Edit `lib/core/theme/app_theme.dart`:
```dart
static const primaryGreen = Color(0xFF2E7D32);
static const secondaryGreen = Color(0xFF81C784);
```

### App Name
Edit `lib/core/constants/app_constants.dart`:
```dart
static const String appName = 'Mkulima Exchange';
```

### Product Categories
Edit `lib/core/constants/app_constants.dart`:
```dart
static const List<String> productCategories = [
  'Vegetables', 'Fruits', 'Grains', 'Dairy', 'Poultry',
];
```

---

## ⚡ Common Commands

```bash
# Format code
dart format lib/

# Check for errors
flutter analyze

# Run in profile mode (faster)
flutter run --profile

# Build for Android release
flutter build apk --release

# Build for iOS release
flutter build ios --release

# Run tests
flutter test

# Clean build
flutter clean
```

---

## 🔍 Find Things Quickly

### Looking for a screen?
- All screens in `lib/features/*/`
- Format: `[feature]_screen.dart`

### Need a widget?
- Reusable widgets in `lib/widgets/custom_widgets.dart`

### Need test data?
- Mock data in `lib/services/mock_data_service.dart`

### Looking for constants?
- App constants in `lib/core/constants/app_constants.dart`

---

## 💡 Pro Tips

### Hot Reload Shortcut
- Press `r` in terminal while app is running
- Changes appear instantly (most of the time)

### Debug a Screen
- Add print statements: `print('Value: $someValue');`
- View in Flutter console at bottom of terminal

### Test Quickly
- Modify `mock_data_service.dart` to change test data
- Write new test data without touching backend

### Add a New Screen
1. Create file: `lib/features/name/name_screen.dart`
2. Add route in `lib/router.dart`
3. Create link from existing screen

---

## ❓ Common Issues & Fixes

### "Build cache is invalid"
```bash
flutter clean
flutter pub get
flutter run
```

### App crashes on start
```bash
flutter analyze  # Check for errors
```

### Emulator too slow
```bash
flutter run --profile  # Faster performance
```

### Can't find files
```bash
flutter pub get  # Refresh dependencies
```

---

## 📚 Documentation Files

- **README.md** - Full project overview
- **SETUP.md** - Detailed setup & troubleshooting
- **CONTRIBUTING.md** - Code guidelines & development
- **PROJECT_COMPLETION.md** - What's been built
- **QUICK_START.md** - This file!

---

## 🔗 Useful Links

- [Flutter Docs](https://flutter.dev/docs)
- [Material Design 3](https://m3.material.io)
- [GoRouter Docs](https://pub.dev/packages/go_router)
- [Dart Docs](https://dart.dev/guides)

---

## 🎓 Understanding the App Flow

```
main.dart
    ↓
app_theme.dart (theme loading)
    ↓
router.dart (route configuration)
    ↓
splash_screen.dart (3 sec delay)
    ↓
onboarding_screen.dart (3 pages)
    ↓
login_screen.dart (or register)
    ↓
app_shell.dart (main app with bottom nav)
    ├── home_screen.dart
    ├── marketplace_screen.dart
    ├── cart_screen.dart
    ├── orders_screen.dart
    └── profile_screen.dart
```

---

## ✅ Checklist Before Going Live

- [ ] Update app name and logo
- [ ] Set primary colors to brand colors
- [ ] Add Firebase configuration
- [ ] Implement payment processing
- [ ] Setup push notifications
- [ ] Add analytics
- [ ] Test on real devices
- [ ] Prepare app store listings
- [ ] Get team approval
- [ ] Deploy to Play Store / App Store

---

## 🆘 Need Help?

1. **Check the docs** - Start with README.md or SETUP.md
2. **Search the code** - Use Ctrl+F to find similar examples
3. **Read comments** - Code has descriptive comments
4. **Run analyze** - `flutter analyze` shows issues
5. **Check error messages** - Usually tells you what's wrong

---

## 🌟 You're All Set!

Your Mkulima Exchange app is ready to customize and deploy. 

**Commands to remember:**
```bash
flutter pub get     # Get dependencies
flutter run         # Run app
flutter analyze     # Check code quality
dart format lib/    # Format code
```

**Questions?** Check the full documentation in README.md and SETUP.md

Happy coding! 🎉
