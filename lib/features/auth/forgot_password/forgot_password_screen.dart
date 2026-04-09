import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mkulima_exchange/core/theme/app_theme.dart';
import 'package:mkulima_exchange/core/utils/extensions.dart';
import 'package:mkulima_exchange/core/utils/validators.dart';
import 'package:mkulima_exchange/widgets/custom_widgets.dart';

/// Forgot password screen
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController _emailController;
  late FocusNode _emailFocus;
  bool _isLoading = false;
  bool _emailSent = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _emailFocus = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  /// Handle send reset link
  void _handleSendResetLink() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      // Simulate API call
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
            _emailSent = true;
          });
          context.showSuccessSnackBar('Password reset link sent!');
        }
      });
    }
  }

  /// Return to login
  void _returnToLogin() {
    context.go('/login');
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppTheme.secondaryGreen.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.lock_outline,
                    size: 40,
                    color: AppTheme.primaryGreen,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Header
              Text(
                _emailSent ? 'Check Your Email' : 'Forgot Password?',
                style: context.textTheme.displaySmall?.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Description
              Text(
                _emailSent
                    ? 'We have sent a password reset link to your email address. Check your email and follow the instructions to reset your password.'
                    : 'Enter your email address and we will send you a link to reset your password.',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),

              if (!_emailSent)
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email field
                      CustomTextField(
                        label: 'Email Address',
                        hintText: 'Enter your email',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        focusNode: _emailFocus,
                        validator: FormValidators.validateEmail,
                      ),
                      const SizedBox(height: 24),

                      // Send button
                      CustomButton(
                        label: 'Send Reset Link',
                        onPressed: _handleSendResetLink,
                        isLoading: _isLoading,
                      ),
                    ],
                  ),
                ),

              if (_emailSent) ...[
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.secondaryGreen),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: AppTheme.primaryGreen,
                        size: 48,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Email Sent Successfully',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: AppTheme.primaryGreen,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Please check your email for reset instructions.',
                        style: context.textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                CustomButton(
                  label: 'Back to Login',
                  onPressed: _returnToLogin,
                ),
              ],

              if (!_emailSent) ...[
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Back to Login'),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
