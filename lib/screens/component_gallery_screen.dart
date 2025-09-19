import 'package:flutter/material.dart';
import 'package:awesome_ui/awesome_ui.dart';

class ComponentGalleryScreen extends StatelessWidget {
  const ComponentGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Component Gallery',
              variant: AuiTextVariant.headlineLarge,
            ),
            const SizedBox(height: 24),
            
            // Foundation Section
            _buildSection(
              context,
              'Foundation',
              'Core design system components',
              [
                _buildFoundationDemo(context),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Atoms Section
            _buildSection(
              context,
              'Atoms',
              'Basic building blocks',
              [
                _buildAtomsDemo(context),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Molecules Section
            _buildSection(
              context,
              'Molecules',
              'Combined atomic components',
              [
                _buildMoleculesDemo(context),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Navigation Section
            _buildSection(
              context,
              'Navigation',
              'Navigation and routing components',
              [
                _buildNavigationDemo(context),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Feedback Section
            _buildSection(
              context,
              'Feedback',
              'User feedback and notifications',
              [
                _buildFeedbackDemo(context),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Layout Section
            _buildSection(
              context,
              'Layout',
              'Layout and structure components',
              [
                _buildLayoutDemo(context),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Data Display Section
            _buildSection(
              context,
              'Data Display',
              'Data visualization components',
              [
                _buildDataDisplayDemo(context),
              ],
            ),
          ],
        ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String subtitle, List<Widget> demos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuiText(
          title,
          variant: AuiTextVariant.headlineMedium,
        ),
        const SizedBox(height: 8),
        AuiText(
          subtitle,
          variant: AuiTextVariant.bodyMedium,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        const SizedBox(height: 16),
        ...demos,
      ],
    );
  }

  Widget _buildFoundationDemo(BuildContext context) {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Colors & Typography',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildColorSwatch(context, 'Primary', Theme.of(context).colorScheme.primary),
                _buildColorSwatch(context, 'Secondary', Theme.of(context).colorScheme.secondary),
                _buildColorSwatch(context, 'Error', Theme.of(context).colorScheme.error),
                _buildColorSwatch(context, 'Surface', Theme.of(context).colorScheme.surface),
              ],
            ),
            const SizedBox(height: 16),
            const AuiText(
              'Typography Scale',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 8),
            const AuiText('Display Large', variant: AuiTextVariant.displayLarge),
            const AuiText('Display Medium', variant: AuiTextVariant.displayMedium),
            const AuiText('Headline Large', variant: AuiTextVariant.headlineLarge),
            const AuiText('Title Large', variant: AuiTextVariant.titleLarge),
            const AuiText('Body Large', variant: AuiTextVariant.bodyLarge),
            const AuiText('Body Medium', variant: AuiTextVariant.bodyMedium),
            const AuiText('Label Large', variant: AuiTextVariant.labelLarge),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSwatch(BuildContext context, String name, Color color) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
        ),
        const SizedBox(height: 4),
        AuiText(
          name,
          variant: AuiTextVariant.labelSmall,
        ),
      ],
    );
  }

  Widget _buildAtomsDemo(BuildContext context) {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Buttons',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiButton(
                  onPressed: () {},
                  child: const AuiText('Primary'),
                ),
                AuiButton(
                  onPressed: () {},
                  variant: AuiButtonVariant.outline,
                  child: const AuiText('Secondary'),
                ),
                AuiButton(
                  onPressed: () {},
                  variant: AuiButtonVariant.outline,
                  child: const AuiText('Outline'),
                ),
                AuiButton(
                  onPressed: () {},
                  variant: AuiButtonVariant.outline,
                  child: const AuiText('Text'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const AuiText(
              'Chips',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiChip(
                  label: const AuiText('Action'),
                  onPressed: () {},
                ),
                AuiChip(
                  label: const AuiText('Filter'),
                  onPressed: () {},
                ),
                AuiChip(
                  label: const AuiText('Choice'),
                  onPressed: () {},
                ),
                AuiChip(
                  label: const AuiText('Input'),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            const AuiText(
              'Progress',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 8),
            const AuiProgress(value: 0.3),
            const SizedBox(height: 8),
            const AuiProgress(
              value: 0.7,
              variant: AuiProgressVariant.circular,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoleculesDemo(BuildContext context) {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Cards',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            AuiCard(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AuiText(
                      'Card Title',
                      variant: AuiTextVariant.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    const AuiText(
                      'This is a card component with some content.',
                      variant: AuiTextVariant.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AuiButton(
                          onPressed: () {},
                          variant: AuiButtonVariant.outline,
                          child: const AuiText('Cancel'),
                        ),
                        const SizedBox(width: 8),
                        AuiButton(
                          onPressed: () {},
                          child: const AuiText('Action'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const AuiText(
              'List Tiles',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 8),
            AuiListTile(
              leading: const AuiIcon(Icons.person),
              title: const AuiText('List Tile Title'),
              subtitle: const AuiText('List tile subtitle'),
              trailing: const AuiIcon(Icons.arrow_forward_ios),
            ),
            AuiListTile(
              leading: const AuiIcon(Icons.settings),
              title: const AuiText('Settings'),
              subtitle: const AuiText('App settings and preferences'),
              trailing: const AuiIcon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationDemo(BuildContext context) {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Tabs',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            const AuiText('Tab Bar Placeholder'),
            const SizedBox(height: 16),
            const AuiText(
              'Breadcrumbs',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 8),
            const AuiText('Breadcrumbs Placeholder'),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackDemo(BuildContext context) {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Feedback Components',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: AuiText('This is a snackbar message')),
                    );
                  },
                  child: const AuiText('Show Snackbar'),
                ),
                AuiButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const AuiText('Dialog Title'),
                        content: const AuiText('This is a dialog content.'),
                        actions: [
                          AuiButton(
                            onPressed: () => Navigator.of(context).pop(),
                            variant: AuiButtonVariant.outline,
                            child: const AuiText('Cancel'),
                          ),
                          AuiButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const AuiText('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const AuiText('Show Dialog'),
                ),
                AuiButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        padding: const EdgeInsets.all(16),
                        child: const AuiText('This is a bottom sheet content.'),
                      ),
                    );
                  },
                  child: const AuiText('Show Bottom Sheet'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLayoutDemo(BuildContext context) {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Layout Components',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            const AuiText(
              'Responsive Grid',
              variant: AuiTextVariant.titleSmall,
            ),
            const SizedBox(height: 8),
            Wrap(
              children: List.generate(6, (index) => Container(
                width: 100,
                height: 60,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: AuiText('Item ${index + 1}'),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataDisplayDemo(BuildContext context) {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Data Display Components',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            const AuiText(
              'Data Table',
              variant: AuiTextVariant.titleSmall,
            ),
            const SizedBox(height: 8),
            const AuiText('Data Table Placeholder'),
          ],
        ),
      ),
    );
  }
}
