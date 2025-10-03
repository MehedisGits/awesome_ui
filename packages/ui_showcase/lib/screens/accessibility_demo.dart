import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';
import 'package:ui_controls_button/ui_controls_button.dart';
import 'package:ui_controls_text_field/ui_controls_text_field.dart';
import 'package:ui_controls_card/ui_controls_card.dart';

class AccessibilityDemo extends StatefulWidget {
  const AccessibilityDemo({super.key});

  @override
  State<AccessibilityDemo> createState() => _AccessibilityDemoState();
}

class _AccessibilityDemoState extends State<AccessibilityDemo> {
  bool _isHighContrast = false;
  bool _isReducedMotion = false;
  bool _isRTL = false;

  @override
  Widget build(BuildContext context) {
    return AppStyleScope(
      platformStyle: PlatformStyle.material,
      colors: _isHighContrast ? AppColors.highContrast : AppColors.light,
      typography: AppTypography.standard(),
      spacing: AppSpacing.standard(),
      radius: AppRadius.standard(),
      elevation: AppElevation.standard(),
      motion: _isReducedMotion ? AppMotion.standard() : AppMotion.standard(),
      child: Directionality(
        textDirection: _isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Accessibility Demo'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              _buildAccessibilityControls(),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAccessibilityControls(),
                const SizedBox(height: 32),
                _buildTouchTargetDemo(),
                const SizedBox(height: 32),
                _buildSemanticLabelsDemo(),
                const SizedBox(height: 32),
                _buildFocusManagementDemo(),
                const SizedBox(height: 32),
                _buildScreenReaderDemo(),
                const SizedBox(height: 32),
                _buildHighContrastDemo(),
                const SizedBox(height: 32),
                _buildRTLDemo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccessibilityControls() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Accessibility Controls',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SwitchListTile(
                    title: const Text('High Contrast'),
                    value: _isHighContrast,
                    onChanged: (value) {
                      setState(() {
                        _isHighContrast = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: SwitchListTile(
                    title: const Text('Reduced Motion'),
                    value: _isReducedMotion,
                    onChanged: (value) {
                      setState(() {
                        _isReducedMotion = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: SwitchListTile(
                    title: const Text('RTL Layout'),
                    value: _isRTL,
                    onChanged: (value) {
                      setState(() {
                        _isRTL = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTouchTargetDemo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Touch Target Demo (48dp minimum)',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                AppButton(
                  onPressed: () {},
                  size: ButtonSize.sm,
                  child: const Text('Small (48dp)'),
                ),
                AppButton(
                  onPressed: () {},
                  size: ButtonSize.md,
                  child: const Text('Medium (48dp)'),
                ),
                AppButton(
                  onPressed: () {},
                  size: ButtonSize.lg,
                  child: const Text('Large (48dp)'),
                ),
                AppCard(
                  child: const Text('Card (48dp)'),
                  isClickable: true,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'All interactive elements meet the 48dp minimum touch target requirement for accessibility.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSemanticLabelsDemo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Semantic Labels Demo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                AppButton(
                  onPressed: () {},
                  child: const Text('Save'),
                  semanticLabel: 'Save document',
                ),
                AppButton(
                  onPressed: () {},
                  variant: ButtonVariant.destructive,
                  child: const Text('Delete'),
                  semanticLabel: 'Delete selected item',
                ),
                AppTextField(
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    helperText: 'Enter your email address',
                  ),
                  semanticLabel: 'Email address input field',
                ),
                AppCard(
                  child: const Text('Product Card'),
                  isClickable: true,
                  onTap: () {},
                  semanticLabel: 'Product card for iPhone 15',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'All components include semantic labels for screen readers.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFocusManagementDemo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Focus Management Demo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              'Use Tab to navigate between elements. Focus indicators will be visible.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                AppButton(
                  onPressed: () {},
                  child: const Text('Focusable Button'),
                ),
                AppTextField(
                  decoration: const InputDecoration(
                    labelText: 'Focusable Text Field',
                  ),
                ),
                AppCard(
                  child: const Text('Focusable Card'),
                  isClickable: true,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreenReaderDemo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Screen Reader Demo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              'Enable screen reader to hear semantic announcements.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                AppButton(
                  onPressed: () {},
                  child: const Text('Button'),
                  semanticLabel: 'Primary action button',
                ),
                AppButton(
                  onPressed: () {},
                  variant: ButtonVariant.secondary,
                  child: const Text('Secondary'),
                  semanticLabel: 'Secondary action button',
                ),
                AppTextField(
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    helperText: 'Enter search terms',
                  ),
                  semanticLabel: 'Search input field',
                ),
                AppCard(
                  child: const Text('Article'),
                  isClickable: true,
                  onTap: () {},
                  semanticLabel: 'Article card, tap to read',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighContrastDemo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'High Contrast Demo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              'Toggle high contrast mode to see improved visibility.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                AppButton(
                  onPressed: () {},
                  child: const Text('High Contrast Button'),
                ),
                AppButton(
                  onPressed: () {},
                  variant: ButtonVariant.outlined,
                  child: const Text('Outlined Button'),
                ),
                AppTextField(
                  decoration: const InputDecoration(
                    labelText: 'High Contrast Text Field',
                  ),
                ),
                AppCard(
                  child: const Text('High Contrast Card'),
                  variant: CardVariant.outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRTLDemo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RTL Layout Demo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              'Toggle RTL mode to see right-to-left layout support.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                AppButton(
                  onPressed: () {},
                  child: const Text('Button 1'),
                ),
                const SizedBox(width: 16),
                AppButton(
                  onPressed: () {},
                  child: const Text('Button 2'),
                ),
                const SizedBox(width: 16),
                AppButton(
                  onPressed: () {},
                  child: const Text('Button 3'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            AppTextField(
              decoration: const InputDecoration(
                labelText: 'RTL Text Field',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
