import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';
import 'package:ui_controls_button/ui_controls_button.dart';
import 'package:ui_controls_text_field/ui_controls_text_field.dart';
import 'package:ui_controls_card/ui_controls_card.dart';

class BrandShowcase extends StatefulWidget {
  const BrandShowcase({super.key});

  @override
  State<BrandShowcase> createState() => _BrandShowcaseState();
}

class _BrandShowcaseState extends State<BrandShowcase> {
  String _selectedBrand = 'Default';
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final colors = _getBrandColors(_selectedBrand);
    
    return AppStyleScope(
      platformStyle: PlatformStyle.material,
      colors: _isDarkMode ? AppColors.dark : AppColors.light,
      typography: AppTypography.standard(),
      spacing: AppSpacing.standard(),
      radius: AppRadius.standard(),
      elevation: AppElevation.standard(),
      motion: AppMotion.standard(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Brand Showcase'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            _buildBrandToggle(),
            _buildThemeToggle(),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBrandInfo(),
              const SizedBox(height: 32),
              _buildBrandColors(),
              const SizedBox(height: 32),
              _buildBrandComponents(),
              const SizedBox(height: 32),
              _buildBrandExamples(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Brand Information',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selected Brand'),
                      const SizedBox(height: 8),
                      DropdownButton<String>(
                        value: _selectedBrand,
                        isExpanded: true,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedBrand = value;
                            });
                          }
                        },
                        items: const [
                          DropdownMenuItem(
                            value: 'Default',
                            child: Text('Default'),
                          ),
                          DropdownMenuItem(
                            value: 'Fintech',
                            child: Text('Fintech'),
                          ),
                          DropdownMenuItem(
                            value: 'Health',
                            child: Text('Health'),
                          ),
                          DropdownMenuItem(
                            value: 'E-commerce',
                            child: Text('E-commerce'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Theme Mode'),
                      const SizedBox(height: 8),
                      Switch(
                        value: _isDarkMode,
                        onChanged: (value) {
                          setState(() {
                            _isDarkMode = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              _getBrandDescription(_selectedBrand),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandColors() {
    final colors = _getBrandColors(_selectedBrand);
    final currentColors = _isDarkMode ? AppColors.dark : AppColors.light;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Brand Color Palette',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildColorSwatch('Primary', currentColors.primary),
                _buildColorSwatch('Secondary', currentColors.secondary),
                _buildColorSwatch('Tertiary', currentColors.tertiary),
                _buildColorSwatch('Error', currentColors.error),
                _buildColorSwatch('Surface', currentColors.surface),
                _buildColorSwatch('On Surface', currentColors.onSurface),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSwatch(String name, Color color) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 80,
          child: Text(
            name,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildBrandComponents() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Brand Components',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                AppButton(
                  onPressed: () {},
                  child: const Text('Primary Button'),
                ),
                AppButton(
                  onPressed: () {},
                  variant: ButtonVariant.secondary,
                  child: const Text('Secondary Button'),
                ),
                AppButton(
                  onPressed: () {},
                  variant: ButtonVariant.tonal,
                  child: const Text('Tonal Button'),
                ),
                AppTextField(
                  decoration: const InputDecoration(
                    labelText: 'Text Field',
                  ),
                ),
                AppCard(
                  child: const Text('Card'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Brand Examples',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildBrandExample(),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandExample() {
    switch (_selectedBrand) {
      case 'Fintech':
        return _buildFintechExample();
      case 'Health':
        return _buildHealthExample();
      case 'E-commerce':
        return _buildEcommerceExample();
      default:
        return _buildDefaultExample();
    }
  }

  Widget _buildFintechExample() {
    return Column(
      children: [
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.account_balance, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    'Account Balance',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                '\$12,345.67',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Available Balance',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: AppButton(
                onPressed: () {},
                child: const Text('Transfer'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppButton(
                onPressed: () {},
                variant: ButtonVariant.outlined,
                child: const Text('Pay Bills'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHealthExample() {
    return Column(
      children: [
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.health_and_safety, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    'Health Dashboard',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Steps Today: 8,432',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Goal: 10,000 steps',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: AppButton(
                onPressed: () {},
                child: const Text('Log Activity'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppButton(
                onPressed: () {},
                variant: ButtonVariant.outlined,
                child: const Text('View History'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEcommerceExample() {
    return Column(
      children: [
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.shopping_cart, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    'Shopping Cart',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                '3 items • \$89.99',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Free shipping on orders over \$50',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: AppButton(
                onPressed: () {},
                child: const Text('Checkout'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppButton(
                onPressed: () {},
                variant: ButtonVariant.outlined,
                child: const Text('Continue Shopping'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDefaultExample() {
    return Column(
      children: [
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.info, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    'Default Theme',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'This is the default theme with standard colors and styling.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: AppButton(
                onPressed: () {},
                child: const Text('Primary Action'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppButton(
                onPressed: () {},
                variant: ButtonVariant.outlined,
                child: const Text('Secondary Action'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBrandToggle() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.business),
      onSelected: (brand) {
        setState(() {
          _selectedBrand = brand;
        });
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: 'Default',
          child: Text('Default'),
        ),
        PopupMenuItem(
          value: 'Fintech',
          child: Text('Fintech'),
        ),
        PopupMenuItem(
          value: 'Health',
          child: Text('Health'),
        ),
        PopupMenuItem(
          value: 'E-commerce',
          child: Text('E-commerce'),
        ),
      ],
    );
  }

  Widget _buildThemeToggle() {
    return IconButton(
      icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
      onPressed: () {
        setState(() {
          _isDarkMode = !_isDarkMode;
        });
      },
    );
  }

  AppColors _getBrandColors(String brand) {
    switch (brand) {
      case 'Fintech':
        return FintechTokens.colors;
      case 'Health':
        return HealthTokens.colors;
      case 'E-commerce':
        return EcommerceTokens.colors;
      default:
        return AppColors.light;
    }
  }

  String _getBrandDescription(String brand) {
    switch (brand) {
      case 'Fintech':
        return 'Professional blue and green color scheme designed for financial applications. Emphasizes trust, security, and reliability.';
      case 'Health':
        return 'Clean and calming color palette perfect for healthcare and wellness applications. Promotes healing and well-being.';
      case 'E-commerce':
        return 'Vibrant and energetic colors optimized for online shopping experiences. Encourages engagement and conversion.';
      default:
        return 'Standard Material 3 color scheme with balanced primary, secondary, and tertiary colors.';
    }
  }
}
