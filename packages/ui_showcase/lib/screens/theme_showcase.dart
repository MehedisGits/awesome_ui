import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';
import 'package:ui_controls_button/ui_controls_button.dart';
import 'package:ui_controls_text_field/ui_controls_text_field.dart';
import 'package:ui_controls_card/ui_controls_card.dart';

class ThemeShowcase extends StatefulWidget {
  const ThemeShowcase({super.key});

  @override
  State<ThemeShowcase> createState() => _ThemeShowcaseState();
}

class _ThemeShowcaseState extends State<ThemeShowcase> {
  bool _isDarkMode = false;
  PlatformStyle _currentPlatformStyle = PlatformStyle.material;

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
          title: const Text('Theme Showcase'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            _buildPlatformToggle(),
            _buildThemeToggle(),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildThemeControls(),
              const SizedBox(height: 32),
              _buildColorPalette(),
              const SizedBox(height: 32),
              _buildTypographyScale(),
              const SizedBox(height: 32),
              _buildComponentExamples(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeControls() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme Controls',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Platform Style'),
                      const SizedBox(height: 8),
                      DropdownButton<PlatformStyle>(
                        value: _currentPlatformStyle,
                        isExpanded: true,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _currentPlatformStyle = value;
                            });
                          }
                        },
                        items: PlatformStyle.values.map((style) {
                          return DropdownMenuItem(
                            value: style,
                            child: Text(style.name.toUpperCase()),
                          );
                        }).toList(),
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
          ],
        ),
      ),
    );
  }

  Widget _buildColorPalette() {
    final colors = _isDarkMode ? AppColors.dark : AppColors.light;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Color Palette',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildColorSwatch('Primary', colors.primary),
                _buildColorSwatch('On Primary', colors.onPrimary),
                _buildColorSwatch('Primary Container', colors.primaryContainer),
                _buildColorSwatch('On Primary Container', colors.onPrimaryContainer),
                _buildColorSwatch('Secondary', colors.secondary),
                _buildColorSwatch('On Secondary', colors.onSecondary),
                _buildColorSwatch('Secondary Container', colors.secondaryContainer),
                _buildColorSwatch('On Secondary Container', colors.onSecondaryContainer),
                _buildColorSwatch('Tertiary', colors.tertiary),
                _buildColorSwatch('On Tertiary', colors.onTertiary),
                _buildColorSwatch('Tertiary Container', colors.tertiaryContainer),
                _buildColorSwatch('On Tertiary Container', colors.onTertiaryContainer),
                _buildColorSwatch('Error', colors.error),
                _buildColorSwatch('On Error', colors.onError),
                _buildColorSwatch('Error Container', colors.errorContainer),
                _buildColorSwatch('On Error Container', colors.onErrorContainer),
                _buildColorSwatch('Surface', colors.surface),
                _buildColorSwatch('On Surface', colors.onSurface),
                _buildColorSwatch('Surface Variant', colors.surfaceVariant),
                _buildColorSwatch('On Surface Variant', colors.onSurfaceVariant),
                _buildColorSwatch('Outline', colors.outline),
                _buildColorSwatch('Outline Variant', colors.outlineVariant),
                _buildColorSwatch('Shadow', colors.shadow),
                _buildColorSwatch('Scrim', colors.scrim),
                _buildColorSwatch('Inverse Surface', colors.inverseSurface),
                _buildColorSwatch('On Inverse Surface', colors.onInverseSurface),
                _buildColorSwatch('Inverse Primary', colors.inversePrimary),
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

  Widget _buildTypographyScale() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Typography Scale',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Display Large', style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(height: 8),
                Text('Display Medium', style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(height: 8),
                Text('Display Small', style: Theme.of(context).textTheme.displaySmall),
                const SizedBox(height: 8),
                Text('Headline Large', style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 8),
                Text('Headline Medium', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 8),
                Text('Headline Small', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text('Title Large', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text('Title Medium', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text('Title Small', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 8),
                Text('Body Large', style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text('Body Medium', style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 8),
                Text('Body Small', style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 8),
                Text('Label Large', style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 8),
                Text('Label Medium', style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: 8),
                Text('Label Small', style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComponentExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Component Examples',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                AppButton(
                  onPressed: () {},
                  child: const Text('Button'),
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
}
