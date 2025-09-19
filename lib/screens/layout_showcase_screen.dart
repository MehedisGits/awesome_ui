import 'package:flutter/material.dart';
import 'package:awesome_ui/awesome_ui.dart';

class LayoutShowcaseScreen extends StatefulWidget {
  const LayoutShowcaseScreen({super.key});

  @override
  State<LayoutShowcaseScreen> createState() => _LayoutShowcaseScreenState();
}

class _LayoutShowcaseScreenState extends State<LayoutShowcaseScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuiText(
            'Layout Showcase',
            variant: AuiTextVariant.headlineLarge,
          ),
          const SizedBox(height: 24),
          
          // Responsive Grid Section
          _buildResponsiveGridSection(),
          
          const SizedBox(height: 32),
          
          // Masonry Grid Section
          _buildMasonryGridSection(),
          
          const SizedBox(height: 32),
          
          // Split View Section
          _buildSplitViewSection(),
          
          const SizedBox(height: 32),
          
          // Safe Area Scaffold Section
          _buildSafeAreaScaffoldSection(),
        ],
      ),
    );
  }

  Widget _buildResponsiveGridSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Responsive Grid',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Basic Grid
            const AuiText('Basic Grid', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(6, (index) => Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: AuiText('Item ${index + 1}'),
                ),
              )),
            ),
            
            const SizedBox(height: 16),
            
            // Responsive Columns
            const AuiText('Responsive Columns', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(8, (index) => Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: AuiText('R${index + 1}'),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMasonryGridSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Masonry Grid',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Basic Masonry
            const AuiText('Basic Masonry', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(12, (index) => Container(
                width: 100,
                height: 60 + (index % 3) * 20, // Varying heights
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: AuiText('M${index + 1}'),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSplitViewSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Split View',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Basic Split View
            const AuiText('Basic Split View', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AuiText('Left Panel', variant: AuiTextVariant.titleMedium),
                          SizedBox(height: 8),
                          AuiText('This is the left panel content'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AuiText('Right Panel', variant: AuiTextVariant.titleMedium),
                          SizedBox(height: 8),
                          AuiText('This is the right panel content'),
                        ],
                      ),
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

  Widget _buildSafeAreaScaffoldSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Safe Area Scaffold',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Basic Safe Area Scaffold
            const AuiText('Basic Safe Area Scaffold', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AuiSafeAreaScaffold(
                  appBar: AuiAppBar(
                    title: const AuiText('Safe Area App Bar'),
                    actions: [
                      IconButton(
                        icon: const AuiIcon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  body: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuiText('Safe Area Content', variant: AuiTextVariant.titleMedium),
                        SizedBox(height: 8),
                        AuiText('This content respects safe areas'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}