import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';
import 'package:ui_controls_button/ui_controls_button.dart';
import 'package:ui_controls_text_field/ui_controls_text_field.dart';
import 'package:ui_controls_card/ui_controls_card.dart';

class ResponsiveDemo extends StatefulWidget {
  const ResponsiveDemo({super.key});

  @override
  State<ResponsiveDemo> createState() => _ResponsiveDemoState();
}

class _ResponsiveDemoState extends State<ResponsiveDemo> {
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
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Responsive Demo'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBreakpointInfo(),
              const SizedBox(height: 32),
              _buildResponsiveGrid(),
              const SizedBox(height: 32),
              _buildResponsiveComponents(),
              const SizedBox(height: 32),
              _buildResponsiveTypography(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBreakpointInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Breakpoint Information',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final breakpoint = _getBreakpoint(width);
                final isMobile = width < 600;
                final isTablet = width >= 600 && width < 900;
                final isDesktop = width >= 900 && width < 1200;
                final isLargeDesktop = width >= 1200;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Current Width: ${width.toStringAsFixed(0)}dp'),
                    Text('Breakpoint: $breakpoint'),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildBreakpointIndicator('Mobile', isMobile),
                        const SizedBox(width: 8),
                        _buildBreakpointIndicator('Tablet', isTablet),
                        const SizedBox(width: 8),
                        _buildBreakpointIndicator('Desktop', isDesktop),
                        const SizedBox(width: 8),
                        _buildBreakpointIndicator('Large Desktop', isLargeDesktop),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakpointIndicator(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }

  String _getBreakpoint(double width) {
    if (width < 600) return 'Mobile';
    if (width < 900) return 'Tablet';
    if (width < 1200) return 'Desktop';
    return 'Large Desktop';
  }

  Widget _buildResponsiveGrid() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Responsive Grid',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final crossAxisCount = _getCrossAxisCount(width);
                
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return AppCard(
                      child: Center(
                        child: Text('Item ${index + 1}'),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  int _getCrossAxisCount(double width) {
    if (width < 600) return 1;
    if (width < 900) return 2;
    if (width < 1200) return 3;
    return 4;
  }

  Widget _buildResponsiveComponents() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Responsive Components',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final isMobile = width < 600;
                
                return Column(
                  children: [
                    if (isMobile) ...[
                      _buildMobileLayout(),
                    ] else ...[
                      _buildDesktopLayout(),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        AppButton(
          onPressed: () {},
          child: const Text('Mobile Button'),
        ),
        const SizedBox(height: 16),
        AppTextField(
          decoration: const InputDecoration(
            labelText: 'Mobile Text Field',
          ),
        ),
        const SizedBox(height: 16),
        AppCard(
          child: const Text('Mobile Card'),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              AppButton(
                onPressed: () {},
                child: const Text('Desktop Button'),
              ),
              const SizedBox(height: 16),
              AppTextField(
                decoration: const InputDecoration(
                  labelText: 'Desktop Text Field',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: AppCard(
            child: const Text('Desktop Card'),
          ),
        ),
      ],
    );
  }

  Widget _buildResponsiveTypography() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Responsive Typography',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final isMobile = width < 600;
                
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Responsive Text',
                      style: isMobile 
                          ? Theme.of(context).textTheme.headlineMedium
                          : Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'This text adapts to screen size',
                      style: isMobile
                          ? Theme.of(context).textTheme.bodyMedium
                          : Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Mobile: Smaller text for better readability on small screens',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Desktop: Larger text for better readability on large screens',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
