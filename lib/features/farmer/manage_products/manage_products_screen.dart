import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mkulima_exchange/core/constants/app_constants.dart';
import 'package:mkulima_exchange/core/theme/app_theme.dart';
import 'package:mkulima_exchange/core/utils/extensions.dart';
import 'package:mkulima_exchange/models/models.dart';
import 'package:mkulima_exchange/services/mock_data_service.dart';
import 'package:mkulima_exchange/widgets/custom_widgets.dart';

/// Manage products screen for farmers
class ManageProductsScreen extends StatefulWidget {
  const ManageProductsScreen({Key? key}) : super(key: key);

  @override
  State<ManageProductsScreen> createState() => _ManageProductsScreenState();
}

class _ManageProductsScreenState extends State<ManageProductsScreen> {
  late List<Product> _farmProducts;

  @override
  void initState() {
    super.initState();
    _loadFarmProducts();
  }

  /// Load farmer's products from mock service
  void _loadFarmProducts() {
    // In a real app, this would be the current farmer's products
    _farmProducts = MockDataService.getProductsByFarmerId('farmer1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.backgroundColor,
        title: const Text('Manage Products'),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/farmer/add-product');
        },
        child: const Icon(Icons.add),
      ),
      body: _farmProducts.isEmpty
          ? EmptyState(
              icon: Icons.shopping_bag_outlined,
              title: 'No Products Yet',
              description: 'Start by adding your first product to the marketplace.',
              actionLabel: 'Add Product',
              onAction: () {
                context.push('/farmer/add-product');
              },
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _farmProducts.length,
              itemBuilder: (context, index) {
                final product = _farmProducts[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        // Product image
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(product.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Product info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.productName,
                                style: context.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product.category,
                                style: context.textTheme.labelSmall,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'KES ${product.price.toStringAsFixed(0)}',
                                    style: context.textTheme.titleSmall?.copyWith(
                                      color: AppTheme.primaryGreen,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: product.isAvailable
                                          ? AppTheme.secondaryGreen
                                              .withOpacity(0.1)
                                          : AppTheme.errorRed.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      product.isAvailable
                                          ? 'Available'
                                          : 'Out of Stock',
                                      style: context.textTheme.labelSmall
                                          ?.copyWith(
                                        color: product.isAvailable
                                            ? AppTheme.primaryGreen
                                            : AppTheme.errorRed,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${product.quantityAvailable} kg available',
                                style: context.textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                        // Actions
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: AppTheme.primaryGreen,
                              ),
                              onPressed: () {
                                context.showSnackBar(
                                    'Edit product coming soon!');
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: AppTheme.errorRed,
                              ),
                              onPressed: () {
                                _showDeleteConfirmation(product);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  /// Show delete confirmation dialog
  void _showDeleteConfirmation(Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Product'),
          content: Text(
              'Are you sure you want to delete ${product.productName}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context.showSnackBar('Product deleted successfully');
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: AppTheme.errorRed),
              ),
            ),
          ],
        );
      },
    );
  }
}
