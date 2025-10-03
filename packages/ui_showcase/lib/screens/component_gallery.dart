import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';
import 'package:ui_controls_button/ui_controls_button.dart';
import 'package:ui_controls_text_field/ui_controls_text_field.dart';
import 'package:ui_controls_card/ui_controls_card.dart';
import 'theme_showcase.dart';
import 'accessibility_demo.dart';
import 'responsive_demo.dart';
import 'brand_showcase.dart';

class ComponentGallery extends StatefulWidget {
  const ComponentGallery({super.key});

  @override
  State<ComponentGallery> createState() => _ComponentGalleryState();
}

class _ComponentGalleryState extends State<ComponentGallery> {
  int _selectedIndex = 0;
  PlatformStyle _currentPlatformStyle = PlatformStyle.material;
  bool _isDarkMode = false;
  String _currentBrand = 'Default';

  @override
  Widget build(BuildContext context) {
    return AppStyleScope(
      platformStyle: _currentPlatformStyle,
      colors: _isDarkMode ? AppColors.dark : AppColors.light,
      typography: AppTypography.standard(),
      spacing: AppSpacing.standard(),
      radius: AppRadius.standard(),
      elevation: AppElevation.standard(),
      motion: AppMotion.standard(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Awesome UI Showcase'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            _buildPlatformToggle(),
            _buildThemeToggle(),
            _buildBrandToggle(),
          ],
        ),
        body: Row(
          children: [
            _buildNavigationRail(),
            Expanded(
              child: _buildSelectedScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationRail() {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      labelType: NavigationRailLabelType.all,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.dashboard),
          selectedIcon: Icon(Icons.dashboard),
          label: Text('Components'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.palette),
          selectedIcon: Icon(Icons.palette),
          label: Text('Themes'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.accessibility),
          selectedIcon: Icon(Icons.accessibility),
          label: Text('Accessibility'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.view_quilt),
          selectedIcon: Icon(Icons.view_quilt),
          label: Text('Responsive'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.business),
          selectedIcon: Icon(Icons.business),
          label: Text('Brands'),
        ),
      ],
    );
  }

  Widget _buildSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return _buildComponentsScreen();
      case 1:
        return LazyWidget(
          child: const ThemeShowcase(),
          isVisible: _selectedIndex == 1,
          delay: const Duration(milliseconds: 100),
          placeholder: _buildLoadingPlaceholder('Theme Showcase'),
        );
      case 2:
        return LazyWidget(
          child: const AccessibilityDemo(),
          isVisible: _selectedIndex == 2,
          delay: const Duration(milliseconds: 100),
          placeholder: _buildLoadingPlaceholder('Accessibility Demo'),
        );
      case 3:
        return LazyWidget(
          child: const ResponsiveDemo(),
          isVisible: _selectedIndex == 3,
          delay: const Duration(milliseconds: 100),
          placeholder: _buildLoadingPlaceholder('Responsive Demo'),
        );
      case 4:
        return LazyWidget(
          child: const BrandShowcase(),
          isVisible: _selectedIndex == 4,
          delay: const Duration(milliseconds: 100),
          placeholder: _buildLoadingPlaceholder('Brand Showcase'),
        );
      default:
        return _buildComponentsScreen();
    }
  }

  Widget _buildLoadingPlaceholder(String title) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            'Loading $title...',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildComponentsScreen() {
    return LazyListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildSection(
          'Buttons',
          _buildButtonShowcase(),
        ),
        const SizedBox(height: 32),
        _buildSection(
          'Text Fields',
          _buildTextFieldShowcase(),
        ),
        const SizedBox(height: 32),
        _buildSection(
          'Cards',
          _buildCardShowcase(),
        ),
      ],
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        content,
      ],
    );
  }

  Widget _buildButtonShowcase() {
    return Wrap(
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
        AppButton(
          onPressed: () {},
          variant: ButtonVariant.ghost,
          child: const Text('Ghost Button'),
        ),
        AppButton(
          onPressed: () {},
          variant: ButtonVariant.destructive,
          child: const Text('Destructive Button'),
        ),
        AppButton(
          onPressed: () {},
          size: ButtonSize.sm,
          child: const Text('Small'),
        ),
        AppButton(
          onPressed: () {},
          size: ButtonSize.lg,
          child: const Text('Large'),
        ),
        AppButton(
          onPressed: null,
          child: const Text('Disabled'),
        ),
      ],
    );
  }

  Widget _buildTextFieldShowcase() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        SizedBox(
          width: 300,
          child: AppTextField(
            decoration: const InputDecoration(
              labelText: 'Standard Text Field',
            ),
          ),
        ),
        SizedBox(
          width: 300,
          child: AppTextField(
            decoration: const InputDecoration(
              labelText: 'With Helper Text',
              helperText: 'This is helper text',
            ),
          ),
        ),
        SizedBox(
          width: 300,
          child: AppTextField(
            decoration: const InputDecoration(
              labelText: 'With Error',
              errorText: 'This field has an error',
            ),
          ),
        ),
        SizedBox(
          width: 300,
          child: AppTextField(
            decoration: const InputDecoration(
              labelText: 'With Prefix',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        SizedBox(
          width: 300,
          child: AppTextField(
            decoration: const InputDecoration(
              labelText: 'With Suffix',
              suffixIcon: Icon(Icons.visibility),
            ),
          ),
        ),
        SizedBox(
          width: 300,
          child: AppTextField(
            decoration: const InputDecoration(
              labelText: 'Disabled',
            ),
            enabled: false,
          ),
        ),
      ],
    );
  }

  Widget _buildCardShowcase() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        AppCard(
          child: _buildCardContent('Filled Card', 'This is a filled card'),
          variant: CardVariant.filled,
        ),
        AppCard(
          child: _buildCardContent('Outlined Card', 'This is an outlined card'),
          variant: CardVariant.outlined,
        ),
        AppCard(
          child: _buildCardContent('Elevated Card', 'This is an elevated card'),
          variant: CardVariant.elevated,
        ),
        AppCard(
          child: _buildCardContent('Clickable Card', 'Tap me!'),
          isClickable: true,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Card tapped!')),
            );
          },
        ),
        AppCard(
          child: _buildCardContent('Selected Card', 'I am selected'),
          isSelected: true,
        ),
        AppCard(
          child: _buildCardContent('Disabled Card', 'I am disabled'),
          isDisabled: true,
        ),
      ],
    );
  }

  Widget _buildCardContent(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildPlatformToggle() {
    return PopupMenuButton<PlatformStyle>(
      icon: const Icon(Icons.phone_android),
      onSelected: (style) {
        setState(() {
          _currentPlatformStyle = style;
        });
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: PlatformStyle.material,
          child: Text('Material 3'),
        ),
        const PopupMenuItem(
          value: PlatformStyle.cupertino,
          child: Text('Cupertino'),
        ),
        const PopupMenuItem(
          value: PlatformStyle.web,
          child: Text('Web'),
        ),
        const PopupMenuItem(
          value: PlatformStyle.adaptive,
          child: Text('Adaptive'),
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

  Widget _buildBrandToggle() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.business),
      onSelected: (brand) {
        setState(() {
          _currentBrand = brand;
        });
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'Default',
          child: Text('Default'),
        ),
        const PopupMenuItem(
          value: 'Fintech',
          child: Text('Fintech'),
        ),
        const PopupMenuItem(
          value: 'Health',
          child: Text('Health'),
        ),
        const PopupMenuItem(
          value: 'E-commerce',
          child: Text('E-commerce'),
        ),
      ],
    );
  }
}
