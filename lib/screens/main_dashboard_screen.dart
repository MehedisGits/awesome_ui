import 'package:flutter/material.dart';
import 'package:awesome_ui/awesome_ui.dart';
import 'home_screen.dart';

class MainDashboardScreen extends StatefulWidget {
  const MainDashboardScreen({super.key});

  @override
  State<MainDashboardScreen> createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));
    
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  // Callback to navigate to different sections
  void _navigateToSection(BuildContext context, int sectionIndex) {
    // Find the parent HomeScreen and update its selected index
    final homeScreen = context.findAncestorStateOfType<State<HomeScreen>>();
    if (homeScreen != null) {
      (homeScreen as dynamic).navigateToSection(sectionIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(context),
              
              const SizedBox(height: 32),
              
              // Quick Stats
              _buildQuickStats(context),
              
              const SizedBox(height: 32),
              
              // Component Categories
              _buildComponentCategories(context),
              
              const SizedBox(height: 32),
              
              // Advanced Features
              _buildAdvancedFeatures(context),
              
              const SizedBox(height: 32),
              
              // Getting Started
              _buildGettingStarted(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.secondaryContainer,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const AuiIcon(
                  Icons.widgets,
                  color: Colors.white,
                  size: AuiIconSize.xl,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AuiText(
                      'Awesome UI Showcase',
                      variant: AuiTextVariant.displayLarge,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 8),
                    AuiText(
                      'A comprehensive Flutter UI component library with 99% UI/UX coverage for SaaS, CRM, E-commerce, and more.',
                      variant: AuiTextVariant.bodyLarge,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              AuiButton(
                onPressed: () {
                  // Navigate to playground (index 2)
                  _navigateToSection(context, 2);
                },
                child: const AuiText('Try Interactive Playground'),
              ),
              AuiButton(
                onPressed: () {
                  // Show documentation
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: AuiText('Documentation coming soon!'),
                    ),
                  );
                },
                variant: AuiButtonVariant.outline,
                child: const AuiText('View Documentation'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats(BuildContext context) {
    return AuiCard(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: AuiIcon(
                    Icons.analytics,
                    color: Theme.of(context).colorScheme.primary,
                    size: AuiIconSize.lg,
                  ),
                ),
                const SizedBox(width: 12),
                const AuiText(
                  'Library Statistics',
                  variant: AuiTextVariant.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildStatItem(context, 'Components', '50+', 'UI Components', Icons.widgets, Colors.blue),
                _buildStatItem(context, 'Categories', '8', 'Main Categories', Icons.category, Colors.green),
                _buildStatItem(context, 'Accessibility', '100%', 'WCAG Compliant', Icons.accessibility, Colors.purple),
                _buildStatItem(context, 'Responsive', 'Yes', 'Mobile First', Icons.phone_android, Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String title, String value, String subtitle, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: AuiIcon(
              icon,
              color: color,
              size: AuiIconSize.lg,
            ),
          ),
          const SizedBox(height: 12),
          AuiText(
            value,
            variant: AuiTextVariant.headlineMedium,
            color: color,
          ),
          const SizedBox(height: 4),
          AuiText(
            title,
            variant: AuiTextVariant.titleSmall,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          AuiText(
            subtitle,
            variant: AuiTextVariant.bodySmall,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ],
      ),
    );
  }

  Widget _buildComponentCategories(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AuiText(
          'Component Categories',
          variant: AuiTextVariant.headlineMedium,
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            _buildCategoryCard(
              context,
              'Atoms',
              'Basic building blocks',
              Icons.circle,
              Colors.blue,
              () => _navigateToSection(context, 3), // Atoms index
            ),
            const SizedBox(height: 16),
            _buildCategoryCard(
              context,
              'Molecules',
              'Combined atomic components',
              Icons.widgets,
              Colors.green,
              () => _navigateToSection(context, 4), // Molecules index
            ),
            const SizedBox(height: 16),
            _buildCategoryCard(
              context,
              'Navigation',
              'Navigation and routing',
              Icons.navigation,
              Colors.purple,
              () => _navigateToSection(context, 5), // Navigation index
            ),
            const SizedBox(height: 16),
            _buildCategoryCard(
              context,
              'Feedback',
              'User feedback components',
              Icons.feedback,
              Colors.orange,
              () => _navigateToSection(context, 6), // Feedback index
            ),
            const SizedBox(height: 16),
            _buildCategoryCard(
              context,
              'Layout',
              'Layout and structure',
              Icons.grid_view,
              Colors.teal,
              () => _navigateToSection(context, 7), // Layout index
            ),
            const SizedBox(height: 16),
            _buildCategoryCard(
              context,
              'Data Display',
              'Data visualization',
              Icons.table_chart,
              Colors.indigo,
              () => _navigateToSection(context, 8), // Data Display index
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAdvancedFeatures(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AuiText(
          'Advanced Features',
          variant: AuiTextVariant.headlineMedium,
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            _buildFeatureCard(
              context,
              'Accessibility',
              'WCAG 2.1 compliant components with screen reader support',
              Icons.accessibility,
              Colors.red,
              () => _navigateToSection(context, 9), // Accessibility index
            ),
            const SizedBox(height: 16),
            _buildFeatureCard(
              context,
              'Responsive Design',
              'Mobile-first responsive components that adapt to all screen sizes',
              Icons.phone_android,
              Colors.blue,
              () => _navigateToSection(context, 10), // Responsive index
            ),
            const SizedBox(height: 16),
            _buildFeatureCard(
              context,
              'Animations',
              'Smooth animations and micro-interactions for better UX',
              Icons.animation,
              Colors.purple,
              () => _navigateToSection(context, 11), // Animations index
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGettingStarted(BuildContext context) {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Getting Started',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            const AuiText(
              '1. Explore the component categories above to see all available components',
              variant: AuiTextVariant.bodyMedium,
            ),
            const SizedBox(height: 8),
            const AuiText(
              '2. Use the Interactive Playground to test components with different configurations',
              variant: AuiTextVariant.bodyMedium,
            ),
            const SizedBox(height: 8),
            const AuiText(
              '3. Check the Accessibility and Responsive demos to see advanced features',
              variant: AuiTextVariant.bodyMedium,
            ),
            const SizedBox(height: 8),
            const AuiText(
              '4. All components are fully customizable and follow Material Design 3 guidelines',
              variant: AuiTextVariant.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                AuiButton(
                  onPressed: () {
                    _navigateToSection(context, 2); // Playground index
                  },
                  child: const AuiText('Start Exploring'),
                ),
                const SizedBox(width: 16),
                AuiButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: AuiText('GitHub repository coming soon!'),
                      ),
                    );
                  },
                  variant: AuiButtonVariant.outline,
                  child: const AuiText('View on GitHub'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return AuiMicroInteraction(
      config: const AuiMicroInteractionConfig(
        type: AuiMicroInteractionType.scale,
        scale: 0.98,
        duration: Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      ),
      child: AuiCard(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AuiMicroInteraction(
                    config: const AuiMicroInteractionConfig(
                      type: AuiMicroInteractionType.scale,
                      scale: 1.1,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeOutBack,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha:0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: AuiIcon(
                        icon,
                        color: color,
                        size: AuiIconSize.lg,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AuiText(
                      title,
                      variant: AuiTextVariant.titleMedium,
                    ),
                  ),
                  AuiMicroInteraction(
                    config: const AuiMicroInteractionConfig(
                      type: AuiMicroInteractionType.slide,
                      offset: Offset(4, 0),
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    ),
                    child: AuiIcon(
                      Icons.arrow_forward_ios,
                      size: AuiIconSize.sm,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              AuiText(
                subtitle,
                variant: AuiTextVariant.bodyMedium,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return AuiCard(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha:0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: AuiIcon(
                    icon,
                    color: color,
                    size: AuiIconSize.lg,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AuiText(
                    title,
                    variant: AuiTextVariant.titleMedium,
                  ),
                ),
                AuiIcon(
                  Icons.arrow_forward_ios,
                  size: AuiIconSize.sm,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ],
            ),
            const SizedBox(height: 8),
            AuiText(
              description,
              variant: AuiTextVariant.bodyMedium,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}