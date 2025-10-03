import 'package:flutter/material.dart';
import 'package:ui_controls_button/ui_controls_button.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';

void main() {
  runApp(const AppButtonExample());
}

class AppButtonExample extends StatelessWidget {
  const AppButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStyleScope(
      platformStyle: PlatformStyle.material,
      colors: AppColors.light,
      typography: AppTypography.standard(),
      spacing: AppSpacing.standard(),
      radius: AppRadius.standard(),
      elevation: AppElevation.standard(),
      motion: AppMotion.standard(),
      child: MaterialApp(
        title: 'AppButton Example',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: AppColors.light.toColorScheme(),
        ),
        home: const ButtonShowcase(),
      ),
    );
  }
}

class ButtonShowcase extends StatefulWidget {
  const ButtonShowcase({super.key});

  @override
  State<ButtonShowcase> createState() => _ButtonShowcaseState();
}

class _ButtonShowcaseState extends State<ButtonShowcase> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppButton Showcase'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Button Variants',
              [
                _buildButtonRow([
                  AppButton(
                    onPressed: () {},
                    text: 'Primary',
                    variant: ButtonVariant.primary,
                  ),
                  AppButton(
                    onPressed: () {},
                    text: 'Secondary',
                    variant: ButtonVariant.secondary,
                  ),
                  AppButton(
                    onPressed: () {},
                    text: 'Tonal',
                    variant: ButtonVariant.tonal,
                  ),
                  AppButton(
                    onPressed: () {},
                    text: 'Ghost',
                    variant: ButtonVariant.ghost,
                  ),
                  AppButton(
                    onPressed: () {},
                    text: 'Destructive',
                    variant: ButtonVariant.destructive,
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Button Sizes',
              [
                _buildButtonColumn([
                  AppButton(
                    onPressed: () {},
                    text: 'Extra Small',
                    size: ButtonSize.xs,
                  ),
                  AppButton(
                    onPressed: () {},
                    text: 'Small',
                    size: ButtonSize.sm,
                  ),
                  AppButton(
                    onPressed: () {},
                    text: 'Medium',
                    size: ButtonSize.md,
                  ),
                  AppButton(
                    onPressed: () {},
                    text: 'Large',
                    size: ButtonSize.lg,
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Button States',
              [
                _buildButtonRow([
                  AppButton(
                    onPressed: () {},
                    text: 'Normal',
                  ),
                  AppButton(
                    onPressed: null,
                    text: 'Disabled',
                  ),
                  AppButton(
                    onPressed: () {},
                    text: 'Loading',
                    isLoading: _isLoading,
                  ),
                ]),
                const SizedBox(height: 16),
                AppButton(
                  onPressed: () {
                    setState(() {
                      _isLoading = !_isLoading;
                    });
                  },
                  text: 'Toggle Loading',
                  variant: ButtonVariant.secondary,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Button with Icons',
              [
                _buildButtonRow([
                  AppButton(
                    onPressed: () {},
                    text: 'Add',
                    icon: Icons.add,
                  ),
                  AppButton(
                    onPressed: () {},
                    text: 'Edit',
                    icon: Icons.edit,
                  ),
                  AppButton(
                    onPressed: () {},
                    text: 'Delete',
                    icon: Icons.delete,
                    variant: ButtonVariant.destructive,
                  ),
                ]),
                const SizedBox(height: 16),
                _buildButtonRow([
                  AppButton(
                    onPressed: () {},
                    icon: Icons.favorite,
                    size: ButtonSize.sm,
                  ),
                  AppButton(
                    onPressed: () {},
                    icon: Icons.share,
                    size: ButtonSize.sm,
                  ),
                  AppButton(
                    onPressed: () {},
                    icon: Icons.settings,
                    size: ButtonSize.sm,
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Full Width Buttons',
              [
                AppButton(
                  onPressed: () {},
                  text: 'Full Width Button',
                  isFullWidth: true,
                ),
                const SizedBox(height: 8),
                AppButton(
                  onPressed: () {},
                  text: 'Full Width Secondary',
                  variant: ButtonVariant.secondary,
                  isFullWidth: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildButtonRow(List<AppButton> buttons) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: buttons,
    );
  }

  Widget _buildButtonColumn(List<AppButton> buttons) {
    return Column(
      children: buttons
          .map((button) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: button,
              ))
          .toList(),
    );
  }
}
