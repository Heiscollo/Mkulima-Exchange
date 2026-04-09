import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mkulima_exchange/core/constants/app_constants.dart';
import 'package:mkulima_exchange/core/theme/app_theme.dart';
import 'package:mkulima_exchange/core/utils/extensions.dart';
import 'package:mkulima_exchange/core/utils/validators.dart';
import 'package:mkulima_exchange/widgets/custom_widgets.dart';

/// Add product screen for farmers
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late TextEditingController _productNameController;
  late TextEditingController _priceController;
  late TextEditingController _quantityController;
  late TextEditingController _descriptionController;
  String _selectedCategory = AppConstants.productCategories.first;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _productNameController = TextEditingController();
    _priceController = TextEditingController();
    _quantityController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /// Handle product submission
  void _handleAddProduct() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() => _isLoading = false);
          context.showSuccessSnackBar('Product added successfully!');
          context.pop();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Text(
                  'Add New Product',
                  style: context.textTheme.displaySmall?.copyWith(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Add your fresh produce to the marketplace',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 32),

                // Product image upload section
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.border, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: AppTheme.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.cloud_upload_outlined,
                          size: 48, color: AppTheme.primaryGreen),
                      const SizedBox(height: 12),
                      Text(
                        'Upload Product Image',
                        style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tap to select image from gallery',
                        style: context.textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Product name
                CustomTextField(
                  label: 'Product Name',
                  hintText: 'e.g., Fresh Tomatoes',
                  controller: _productNameController,
                  validator: FormValidators.validateProductName,
                ),
                const SizedBox(height: 16),

                // Category
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Category',
                        style: context.textTheme.titleSmall),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.border),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButton<String>(
                        value: _selectedCategory,
                        isExpanded: true,
                        underline: const SizedBox(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(
                                () => _selectedCategory = newValue);
                          }
                        },
                        items: AppConstants.productCategories
                            .map((category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Price and Quantity row
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: 'Price (per kg)',
                        hintText: 'Enter price',
                        controller: _priceController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        validator: FormValidators.validatePrice,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomTextField(
                        label: 'Quantity (kg)',
                        hintText: 'Available quantity',
                        controller: _quantityController,
                        keyboardType: TextInputType.number,
                        validator: FormValidators.validateQuantity,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Description
                CustomTextField(
                  label: 'Description',
                  hintText: 'Describe your product...',
                  controller: _descriptionController,
                  maxLines: 4,
                  minLines: 3,
                  validator: FormValidators.validateDescription,
                ),
                const SizedBox(height: 24),

                // Submit button
                CustomButton(
                  label: 'Add Product',
                  onPressed: _handleAddProduct,
                  isLoading: _isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
