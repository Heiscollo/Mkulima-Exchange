import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mkulima_exchange/core/constants/app_constants.dart';
import 'package:mkulima_exchange/core/theme/app_theme.dart';
import 'package:mkulima_exchange/core/utils/extensions.dart';
import 'package:mkulima_exchange/models/models.dart';
import 'package:mkulima_exchange/services/mock_data_service.dart';
import 'package:mkulima_exchange/widgets/custom_widgets.dart';

/// Marketplace page showing all products
class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({Key? key}) : super(key: key);

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  late List<Product> _allProducts;
  late List<Product> _filteredProducts;
  String _selectedCategory = 'All';
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _loadProducts();
    _filteredProducts = _allProducts;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Load products from mock service
  void _loadProducts() {
    _allProducts = MockDataService.getAllProducts();
  }

  /// Filter products by category and search
  void _filterProducts() {
    _filteredProducts = _allProducts.where((product) {
      final matchesCategory =
          _selectedCategory == 'All' || product.category == _selectedCategory;
      final matchesSearch = product.productName
          .toLowerCase()
          .contains(_searchController.text.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
    setState(() {});
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
              AppTheme.accentOrange.withOpacity(0.06),
              AppTheme.backgroundColor,
            ],
          ),
        ),
        child: Column(
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text('Marketplace'),
              centerTitle: false,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Search bar
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (_) => _filterProducts(),
                        decoration: InputDecoration(
                          hintText: 'Search products...',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    _searchController.clear();
                                    _filterProducts();
                                  },
                                  child: const Icon(Icons.clear),
                                )
                              : null,
                        ),
                      ),
                    ),

                    // Category filter
                    SizedBox(
                      height: 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: CategoryChip(
                              label: 'All',
                              isSelected: _selectedCategory == 'All',
                              onTap: () {
                                setState(() => _selectedCategory = 'All');
                                _filterProducts();
                              },
                            ),
                          ),
                          ...AppConstants.productCategories.map((category) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: CategoryChip(
                                label: category,
                                isSelected: _selectedCategory == category,
                                onTap: () {
                                  setState(() => _selectedCategory = category);
                                  _filterProducts();
                                },
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Products grid
                    if (_filteredProducts.isEmpty)
                      EmptyState(
                        icon: Icons.shopping_bag_outlined,
                        title: 'No Products Found',
                        description: 'Try adjusting your search or filter criteria.',
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: _filteredProducts.length,
                          itemBuilder: (context, index) {
                            final product = _filteredProducts[index];
                            return ProductCard(
                              productName: product.productName,
                              imagePath: product.imageUrl,
                              price: product.price,
                              farmerName: product.farmerName,
                              location: product.location,
                              rating: product.rating,
                              onTap: () {
                                context.push(
                                  '${AppRoutes.marketplace}/details/${product.id}',
                                );
                              },
                            );
                          },
                        ),
                      ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
