import 'package:flutter/material.dart';
import 'package:awesome_ui/awesome_ui.dart';
import 'main_dashboard_screen.dart';
import 'component_gallery_screen.dart';
import 'interactive_playground_screen.dart';
import 'accessibility_demo_screen.dart';
import 'responsive_demo_screen.dart';
import 'animation_demo_screen.dart';
import 'atoms_showcase_screen.dart';
import 'molecules_showcase_screen.dart';
import 'navigation_showcase_screen.dart';
import 'feedback_showcase_screen.dart';
import 'layout_showcase_screen.dart';
import 'data_display_showcase_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.onToggleTheme,
    this.isDarkMode = false,
  });

  final VoidCallback? onToggleTheme;
  final bool isDarkMode;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _screenTransitionController;
  late Animation<double> _screenTransitionAnimation;

  @override
  void initState() {
    super.initState();
    _screenTransitionController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _screenTransitionAnimation = CurvedAnimation(
      parent: _screenTransitionController,
      curve: Curves.easeInOut,
    );
    _screenTransitionController.forward();
  }

  @override
  void dispose() {
    _screenTransitionController.dispose();
    super.dispose();
  }

  // Method to navigate to a specific section
  void _navigateToSection(int sectionIndex) {
    if (sectionIndex >= 0 && sectionIndex < _navigationItems.length) {
      _screenTransitionController.reset();
      setState(() {
        _selectedIndex = sectionIndex;
      });
      _screenTransitionController.forward();
    }
  }

  // Public method to navigate to a specific section (for external access)
  void navigateToSection(int sectionIndex) {
    _navigateToSection(sectionIndex);
  }

  final List<NavigationItem> _navigationItems = [
    NavigationItem(
      icon: Icons.dashboard,
      label: 'Dashboard',
      screen: const MainDashboardScreen(),
    ),
    NavigationItem(
      icon: Icons.grid_view,
      label: 'Overview',
      screen: const ComponentGalleryScreen(),
    ),
    NavigationItem(
      icon: Icons.play_arrow,
      label: 'Playground',
      screen: const InteractivePlaygroundScreen(),
    ),
    NavigationItem(
      icon: Icons.circle,
      label: 'Atoms',
      screen: const AtomsShowcaseScreen(),
    ),
    NavigationItem(
      icon: Icons.widgets,
      label: 'Molecules',
      screen: const MoleculesShowcaseScreen(),
    ),
    NavigationItem(
      icon: Icons.navigation,
      label: 'Navigation',
      screen: const NavigationShowcaseScreen(),
    ),
    NavigationItem(
      icon: Icons.feedback,
      label: 'Feedback',
      screen: const FeedbackShowcaseScreen(),
    ),
    NavigationItem(
      icon: Icons.grid_view,
      label: 'Layout',
      screen: const LayoutShowcaseScreen(),
    ),
    NavigationItem(
      icon: Icons.table_chart,
      label: 'Data Display',
      screen: const DataDisplayShowcaseScreen(),
    ),
    NavigationItem(
      icon: Icons.accessibility,
      label: 'Accessibility',
      screen: const AccessibilityDemoScreen(),
    ),
    NavigationItem(
      icon: Icons.dashboard_customize,
      label: 'Responsive',
      screen: const ResponsiveDemoScreen(),
    ),
    NavigationItem(
      icon: Icons.animation,
      label: 'Animations',
      screen: const AnimationDemoScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AuiSafeAreaScaffold(
      appBar: AuiAppBar(
        title: AuiText(
          _navigationItems[_selectedIndex].label,
          variant: AuiTextVariant.headlineMedium,
        ),
        leading: IconButton(
          icon: const AuiIcon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          AuiMicroInteraction(
            config: const AuiMicroInteractionConfig(
              type: AuiMicroInteractionType.scale,
              scale: 0.9,
              duration: Duration(milliseconds: 150),
              curve: Curves.easeInOut,
            ),
            child: IconButton(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    turns: animation,
                    child: ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                  );
                },
                child: AuiIcon(
                  widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  key: ValueKey(widget.isDarkMode),
                ),
              ),
              onPressed: widget.onToggleTheme,
              tooltip: widget.isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
            ),
          ),
          AuiMicroInteraction(
            config: const AuiMicroInteractionConfig(
              type: AuiMicroInteractionType.scale,
              scale: 0.9,
              duration: Duration(milliseconds: 150),
              curve: Curves.easeInOut,
            ),
            child: IconButton(
              icon: const AuiIcon(Icons.settings),
              onPressed: () {
                // Open settings
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: AuiText('Settings coming soon!'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuiText(
                    'Awesome UI',
                    variant: AuiTextVariant.headlineMedium,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  AuiText(
                    'Component Library',
                    variant: AuiTextVariant.bodyMedium,
                    color: Colors.white70,
                  ),
                ],
              ),
            ),
            ..._navigationItems.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return ListTile(
                leading: AuiIcon(item.icon),
                title: AuiText(item.label),
                selected: _selectedIndex == index,
                onTap: () {
                  Navigator.pop(context);
                  _navigateToSection(index);
                },
              );
            }).toList(),
            const Divider(),
            ListTile(
              leading: const AuiIcon(Icons.info),
              title: const AuiText('About'),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const AuiText('About Awesome UI'),
                    content: const AuiText(
                      'A comprehensive Flutter UI component library with 99% UI/UX coverage for SaaS, CRM, E-commerce, and more.',
                    ),
                    actions: [
                      AuiButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const AuiText('OK'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: FadeTransition(
        opacity: _screenTransitionAnimation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.1, 0),
            end: Offset.zero,
          ).animate(_screenTransitionAnimation),
          child: IndexedStack(
            index: _selectedIndex,
            children: _navigationItems.map((item) => item.screen).toList(),
          ),
        ),
      ),
      bottomNavigationBar: AuiBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _navigateToSection(index);
        },
        items: _navigationItems.map((item) => AuiBottomNavItem(
          icon: AuiIcon(item.icon),
          label: item.label,
        )).toList(),
      ),
      floatingActionButton: AuiMicroInteraction(
        config: const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.scale,
          scale: 0.9,
          duration: Duration(milliseconds: 150),
          curve: Curves.easeInOut,
        ),
        child: FloatingActionButton(
          onPressed: () {
            // Quick access to playground
            _navigateToSection(2);
          },
          child: const AuiIcon(Icons.play_arrow),
          tooltip: 'Quick Playground Access',
        ),
      ),
    );
  }
}

class NavigationItem {
  final IconData icon;
  final String label;
  final Widget screen;

  NavigationItem({
    required this.icon,
    required this.label,
    required this.screen,
  });
}
