# Setup Instructions for Mkulima Exchange

## Prerequisites

Before you start, make sure you have:
- **Flutter 3.0+** installed ([Download Flutter](https://flutter.dev/docs/get-started/install))
- **Dart 3.0+** (comes with Flutter)
- **Android Studio** or **Xcode** for emulators
- **Git** for version control

## Installation Steps

### 1. Clone the Repository

```bash
cd ~/Documents
git clone [your-repo-url]
cd mkulima_exchange
```

### 2. Get Dependencies

```bash
flutter pub get
```

This will download all the packages listed in `pubspec.yaml`.

### 3. Generate Build Files (Optional but Recommended)

```bash
flutter pub run build_runner build
```

This generates necessary files for code generation in the project.

## Running the App

### Android

```bash
# Using Android emulator
flutter run -d emulator-5554

# Or connect a physical Android device and run
flutter run
```

### iOS

```bash
# Requires macOS and Xcode
cd ios
pod install
cd ..
flutter run -d iphone
```

### Web (Testing Only)

```bash
flutter run -d chrome
```

## Development Workflow

### Daily Development

```bash
# 1. Start the app in development mode
flutter run

# 2. The app will hot reload when you save files
# 3. Close with 'q' in terminal
```

### Code Quality Checks

```bash
# Format code
dart format lib/

# Run analyzer
flutter analyze

# Run tests
flutter test

# Generate coverage report
flutter test --coverage
```

### Building for Release

```bash
# Android APK
flutter build apk --release

# Android App Bundle (for Play Store)
flutter build appbundle --release

# iOS App
flutter build ios --release
```

## Project Structure Quick Guide

```
lib/
├── main.dart              # App entry point
├── router.dart            # Route configuration
├── app_shell.dart         # Bottom nav shell
├── core/                  # Reusable core functionality
├── features/              # Feature modules (auth, home, marketplace, etc.)
├── models/                # Data models
├── services/              # Services (mock data, API calls, etc.)
└── widgets/               # Reusable widgets
```

## Important Files

| File | Purpose |
|------|---------|
| `pubspec.yaml` | Dependencies and configuration |
| `lib/main.dart` | App entry point |
| `lib/router.dart` | Navigation routes |
| `lib/core/theme/app_theme.dart` | App theme and colors |
| `lib/core/constants/app_constants.dart` | App-wide constants |

## Firebase Setup (For Production)

When ready to implement backend:

1. Create a Firebase project at [firebase.google.com](https://firebase.google.com)
2. Add Android/iOS apps to your Firebase project
3. Download config files:
   - Android: `google-services.json` → `android/app/`
   - iOS: `GoogleService-Info.plist` → `ios/`
4. Update Firebase configuration in `main.dart`

## Environment Variables

Create a `.env` file for sensitive data (not included in repo):

```
FIREBASE_API_KEY=your_key_here
FIREBASE_PROJECT_ID=your_project_id
FIREBASE_STORAGE_BUCKET=your_bucket_name
```

Then load in your app:
```dart
dotenv.load(fileName: ".env");
```

## Troubleshooting

### Flutter Doctor Issues

```bash
flutter doctor
```

This will show any configuration issues and how to fix them.

### Dependency Issues

```bash
flutter clean
flutter pub get
```

### Build Issues

```bash
# Clear all build files
flutter clean

# Rebuild
flutter pub get
flutter run
```

### iOS Specific

```bash
cd ios
rm -rf Pods
rm -rf Podfile.lock
pod install
cd ..
flutter run
```

### Android Specific

```bash
# Clear gradle cache
flutter clean

# Rebuild
# Make sure Android emulator/device is running
flutter run
```

## Device Testing

### Test on Physical Android Device

1. Enable Developer Mode on device
2. Connect USB cable
3. Create emulator or connect physical device
4. Run: `flutter run`

### Test on Physical iOS Device

1. Connect device to Mac
2. Trust the connection
3. Run: `flutter run`
4. May need to sign with Apple ID in Xcode

### Multiple Devices

```bash
# List all connected devices
flutter devices

# Run on specific device
flutter run -d device_id
```

## Debugging

### Debug Mode

```bash
flutter run
# Press 'd' for debug mode
```

### Debug Console in VS Code

- Set breakpoints by clicking on line numbers
- Use Flutter DevTools: `flutter pub global run devtools`
- Open browser to `localhost:9100`

### Common Debug Commands

```
h - show help
w - reload widget
r - hot reload
R - hot restart
q - quit
```

## Performance Testing

### Profile Mode

```bash
flutter run --profile
```

### Release Mode (Production)

```bash
flutter run --release
```

### DevTools Performance

```bash
flutter pub global activate devtools
devtools
# Open browser and connect to your running app
```

## Code Style & Formatting

The project uses:
- **Linter**: `flutter_lints` with custom rules in `analysis_options.yaml`
- **Formatter**: Dart formatter (run with `dart format lib/`)

### Pre-commit Hook (Optional)

Create `.git/hooks/pre-commit`:

```bash
#!/bin/bash
dart format lib/
flutter analyze
```

Make executable: `chmod +x .git/hooks/pre-commit`

## Documentation

- **README.md** - Project overview
- **CONTRIBUTING.md** - Contribution guidelines
- **Code comments** - Inline documentation
- **Commit messages** - Descriptive history

## Next Steps

1. Explore the codebase
2. Understand the architecture
3. Create mock data for testing
4. Build your first feature
5. Test thoroughly
6. Follow the contribution guidelines

## Support

For issues or questions:
1. Check the documentation
2. Review similar code in the project
3. Search GitHub issues
4. Contact the team

---

Happy coding! 🚀

**Last Updated**: 2024
