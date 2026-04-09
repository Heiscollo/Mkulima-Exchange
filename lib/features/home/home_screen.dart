import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mkulima_exchange/core/theme/app_theme.dart';
import 'package:mkulima_exchange/core/utils/extensions.dart';
import 'package:mkulima_exchange/models/models.dart';
import 'package:mkulima_exchange/services/mock_data_service.dart';
import 'package:mkulima_exchange/widgets/custom_widgets.dart';
import 'package:mkulima_exchange/core/constants/app_constants.dart';

/// Home page displaying featured products and categories
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Product> _allProducts;
  late List<Farmer> _nearbyFarmers;
  late User _currentUser;
  late List<Product> _featuredProducts;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  /// Load data from mock service
  void _loadData() {
    _allProducts = MockDataService.getAllProducts();
    _nearbyFarmers = MockDataService.getNearbyFarmers();
    _currentUser = MockDataService.getCurrentUser();
    _featuredProducts = MockDataService.getFeaturedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.primaryGreen.withOpacity(0.08),
              AppTheme.backgroundColor,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              // Header section with user greeting
              _buildHeaderSection(),

              const SizedBox(height: 24),

              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    context.push(AppRoutes.marketplace);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      border: Border.all(color: AppTheme.border),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          color: AppTheme.textSecondary,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Search products...',
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Categories section
              _buildCategoriesSection(),

              const SizedBox(height: 24),

              // Featured products section
              _buildFeaturedProductsSection(),

              const SizedBox(height: 24),

              // Nearby farmers section
              _buildNearbyFarmersSection(),

              const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Build header section with greeting
  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, ${_currentUser.fullName}! 👋',
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'What fresh produce do you need today?',
            style: context.textTheme.bodyLarge?.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  /// Build categories section
  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Categories',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        )        ,
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: AppConstants.productCategories
                .map((category) => Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: CategoryChip(
                        label: category,
                        onTap: () {
                          // Filter products by category
                          context.push(AppRoutes.marketplace);
                        },
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  /// Build featured products section
  Widget _buildFeaturedProductsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured Products',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () => context.push(AppRoutes.marketplace),
                child: const Text('See All'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _featuredProducts.length,
            itemBuilder: (context, index) {
              final product = _featuredProducts[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SizedBox(
                  width: 200,
                  child: ProductCard(
                    productName: product.productName,
                    imagePath: product.imageUrl,
                    price: product.price,
                    farmerName: product.farmerName,
                    location: product.location,
                    rating: product.rating,
                    onTap: () {
                      context.push('${AppRoutes.marketplace}/details/${product.id}');
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /// Build nearby farmers section
  Widget _buildNearbyFarmersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Nearby Farmers',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: _nearbyFarmers.length,
          itemBuilder: (context, index) {
            final farmer = _nearbyFarmers[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: FarmerCard(
                farmerName: farmer.fullName,
                farmName: farmer.farmName ?? 'Farm',
                location: farmer.address,
                rating: farmer.rating,
                totalProducts: farmer.totalProducts,
                imageUrl: farmer.profileImageUrl ?? 'https://via.placeholder.com/100',
                onTap: () {
                  // Navigate to farmer details
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Farmer details coming soon')),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
