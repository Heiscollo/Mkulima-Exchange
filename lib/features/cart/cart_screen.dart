import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mkulima_exchange/core/theme/app_theme.dart';
import 'package:mkulima_exchange/core/utils/extensions.dart';
import 'package:mkulima_exchange/widgets/custom_widgets.dart';

/// Cart page showing products in cart
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool get _isEmpty => true; // Mock - cart is empty

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.secondaryGreen.withOpacity(0.08),
              AppTheme.backgroundColor,
            ],
          ),
        ),
        child: Column(
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text('Shopping Cart'),
              centerTitle: false,
            ),
            Expanded(
              child: _isEmpty
                  ? EmptyState(
                      icon: Icons.shopping_cart_outlined,
                      title: 'Your Cart is Empty',
                      description: 'Browse fresh produce and add items to your cart.',
                      actionLabel: 'Continue Shopping',
                      onAction: () => context.go('/marketplace'),
                    )
                  : Column(
                      children: [
                        // Cart items would be here
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: 0,
                            itemBuilder: (context, index) {
                              return CartItemCard(
                                productName: 'Product',
                                productImage: 'https://via.placeholder.com/80',
                                price: 100,
                                quantity: 1,
                                onQuantityChanged: (qty) {},
                                onRemove: () {},
                              );
                            },
                  ),
                ),
                // Checkout section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.textPrimary.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'KES 0',
                            style: context.textTheme.headlineSmall?.copyWith(
                              color: AppTheme.primaryGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        label: 'Proceed to Checkout',
                        onPressed: () {
                          context.showSnackBar(
                              'Checkout coming soon!');
                        },
                      ),
                    ],
                  ),
                ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
