import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mkulima_exchange/app_shell.dart';
import 'package:mkulima_exchange/core/constants/app_constants.dart';
import 'package:mkulima_exchange/features/auth/forgot_password/forgot_password_screen.dart';
import 'package:mkulima_exchange/features/auth/login/login_screen.dart';
import 'package:mkulima_exchange/features/auth/onboarding/onboarding_screen.dart';
import 'package:mkulima_exchange/features/auth/register/register_screen.dart';
import 'package:mkulima_exchange/features/auth/splash/splash_screen.dart';
import 'package:mkulima_exchange/features/marketplace/product_details/product_details_screen.dart';

/// App router configuration using GoRouter
final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  debugLogDiagnostics: true,
  routes: [
    // Splash screen
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    // Onboarding
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),

    // Auth routes (not in shell)
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => const RegisterScreen(),
    ),

    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),

    // Main app shell with bottom navigation
    ShellRoute(
      builder: (context, state, child) {
        // Determine initial index based on route
        int initialIndex = 0;
        if (state.fullPath?.startsWith('/marketplace') ?? false) {
          initialIndex = 1;
        } else if (state.fullPath?.startsWith('/cart') ?? false) {
          initialIndex = 2;
        } else if (state.fullPath?.startsWith('/orders') ?? false) {
          initialIndex = 3;
        } else if (state.fullPath?.startsWith('/profile') ?? false) {
          initialIndex = 4;
        }
        return AppShell(initialIndex: initialIndex);
      },
      routes: [
        // Home
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) {
            return const AppShell(initialIndex: 0);
          },
        ),

        // Marketplace
        GoRoute(
          path: AppRoutes.marketplace,
          builder: (context, state) {
            return const AppShell(initialIndex: 1);
          },
          routes: [
            // Product details
            GoRoute(
              path: 'details/:id',
              builder: (context, state) {
                final productId = state.pathParameters['id'];
                return ProductDetailsScreen(productId: productId ?? '');
              },
            ),
          ],
        ),

        // Cart
        GoRoute(
          path: AppRoutes.cart,
          builder: (context, state) {
            return const AppShell(initialIndex: 2);
          },
        ),

        // Orders
        GoRoute(
          path: AppRoutes.orders,
          builder: (context, state) {
            return const AppShell(initialIndex: 3);
          },
        ),

        // Profile
        GoRoute(
          path: AppRoutes.profile,
          builder: (context, state) {
            return const AppShell(initialIndex: 4);
          },
        ),
      ],
    ),
  ],

  // Error page
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Text('Error: ${state.error?.toString()}'),
      ),
    );
  },
);
