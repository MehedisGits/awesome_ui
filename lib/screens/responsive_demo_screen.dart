import 'package:flutter/material.dart';
import 'package:awesome_ui/awesome_ui.dart';

class ResponsiveDemoScreen extends StatelessWidget {
  const ResponsiveDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    final isDesktop = screenWidth >= 1024;
    
    return SingleChildScrollView(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuiText(
            'Responsive Demo',
            variant: isMobile 
                ? AuiTextVariant.headlineMedium 
                : AuiTextVariant.headlineLarge,
          ),
          SizedBox(height: isMobile ? 16 : 24),
          
          // Responsive Info
          _buildResponsiveInfo(context, isMobile, isTablet, isDesktop),
          
          SizedBox(height: isMobile ? 24 : 32),
          
          // Responsive Grid
          _buildResponsiveGrid(context, isMobile, isTablet, isDesktop),
          
          SizedBox(height: isMobile ? 24 : 32),
          
          // Responsive Text
          _buildResponsiveText(context, isMobile, isTablet, isDesktop),
          
          SizedBox(height: isMobile ? 24 : 32),
          
          // Responsive Spacing
          _buildResponsiveSpacing(context, isMobile, isTablet, isDesktop),
          
          SizedBox(height: isMobile ? 24 : 32),
          
          // Responsive Breakpoints
          _buildResponsiveBreakpoints(context, isMobile, isTablet, isDesktop),
          
          SizedBox(height: isMobile ? 24 : 32),
          
          // Responsive Cards
          _buildResponsiveCards(context, isMobile, isTablet, isDesktop),
        ],
      ),
    );
  }

  Widget _buildResponsiveInfo(BuildContext context, bool isMobile, bool isTablet, bool isDesktop) {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Responsive Information',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Width', '${MediaQuery.of(context).size.width.toInt()}px'),
            _buildInfoRow('Height', '${MediaQuery.of(context).size.height.toInt()}px'),
            _buildInfoRow('Aspect Ratio', MediaQuery.of(context).size.aspectRatio.toStringAsFixed(2)),
            _buildInfoRow('Pixel Ratio', MediaQuery.of(context).devicePixelRatio.toStringAsFixed(2)),
            _buildInfoRow('Text Scale', MediaQuery.of(context).textScaler.scale(1.0).toStringAsFixed(2)),
            _buildInfoRow('Breakpoint', 'Unknown'),
            _buildInfoRow('Device Type', 'Unknown'),
            _buildInfoRow('Orientation', MediaQuery.of(context).orientation.name),
            _buildInfoRow('Is Mobile', 'Unknown'),
            _buildInfoRow('Is Tablet', 'Unknown'),
            _buildInfoRow('Is Desktop', 'Unknown'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AuiText(
            label,
            variant: AuiTextVariant.bodyMedium,
          ),
          AuiText(
            value,
            variant: AuiTextVariant.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveGrid(BuildContext context, bool isMobile, bool isTablet, bool isDesktop) {
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
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(12, (index) => Container(
                width: isMobile ? 150 : isTablet ? 120 : 100,
                height: 60,
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
            const AuiText('Responsive Layout'),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveText(BuildContext context, bool isMobile, bool isTablet, bool isDesktop) {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Responsive Text',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            const AuiText(
              'This text adapts to different screen sizes',
              variant: AuiTextVariant.bodyLarge,
            ),
            const SizedBox(height: 16),
            const AuiText(
              'Current breakpoint: Unknown',
              variant: AuiTextVariant.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveSpacing(BuildContext context, bool isMobile, bool isTablet, bool isDesktop) {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Responsive Spacing',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            Container(
              height: 100,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: AuiText('Responsive Padding'),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 70,
              color: Colors.blue,
              child: const Center(child: AuiText('Responsive Container')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveBreakpoints(BuildContext context, bool isMobile, bool isTablet, bool isDesktop) {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Responsive Breakpoints',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            const AuiText('Extra Small Screen'),
            const AuiText('Small Screen'),
            const AuiText('Medium Screen'),
            const AuiText('Large Screen'),
            const AuiText('Extra Large Screen'),
            const AuiText('2X Large Screen'),
            const SizedBox(height: 16),
            const AuiText('Mobile Device'),
            const AuiText('Tablet Device'),
            const AuiText('Desktop Device'),
            const AuiText('Portrait Orientation'),
            const AuiText('Landscape Orientation'),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveCards(BuildContext context, bool isMobile, bool isTablet, bool isDesktop) {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Responsive Cards',
              variant: AuiTextVariant.titleLarge,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(
                  width: isMobile ? double.infinity : isTablet ? 300 : 250,
                  child: AuiCard(
                    child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuiIcon(
                          Icons.dashboard,
                          size: AuiIconSize.xl,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 12),
                        AuiText(
                          'Dashboard',
                          variant: AuiTextVariant.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        AuiText(
                          'Responsive dashboard with adaptive layout',
                          variant: AuiTextVariant.bodyMedium,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                  ),
                ),
                SizedBox(
                  width: isMobile ? double.infinity : isTablet ? 300 : 250,
                  child: AuiCard(
                    child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuiIcon(
                          Icons.analytics,
                          size: AuiIconSize.xl,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(height: 12),
                        AuiText(
                          'Analytics',
                          variant: AuiTextVariant.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        AuiText(
                          'Data visualization that adapts to screen size',
                          variant: AuiTextVariant.bodyMedium,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                  ),
                ),
                SizedBox(
                  width: isMobile ? double.infinity : isTablet ? 300 : 250,
                  child: AuiCard(
                    child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuiIcon(
                          Icons.settings,
                          size: AuiIconSize.xl,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        const SizedBox(height: 12),
                        AuiText(
                          'Settings',
                          variant: AuiTextVariant.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        AuiText(
                          'Configuration options for all devices',
                          variant: AuiTextVariant.bodyMedium,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
