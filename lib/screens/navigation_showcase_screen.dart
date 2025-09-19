import 'package:flutter/material.dart';
import 'package:awesome_ui/awesome_ui.dart';

class NavigationShowcaseScreen extends StatefulWidget {
  const NavigationShowcaseScreen({super.key});

  @override
  State<NavigationShowcaseScreen> createState() => _NavigationShowcaseScreenState();
}

class _NavigationShowcaseScreenState extends State<NavigationShowcaseScreen> {
  int _selectedTabIndex = 0;
  int _selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuiText(
            'Navigation Showcase',
            variant: AuiTextVariant.headlineLarge,
          ),
          const SizedBox(height: 24),
          
          // App Bar Section
          _buildAppBarSection(),
          
          const SizedBox(height: 32),
          
          // Tabs Section
          _buildTabsSection(),
          
          const SizedBox(height: 32),
          
          // Bottom Navigation Section
          _buildBottomNavSection(),
          
          const SizedBox(height: 32),
          
          // Breadcrumbs Section
          _buildBreadcrumbsSection(),
        ],
      ),
    );
  }

  Widget _buildAppBarSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'App Bar',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Basic App Bar
            const AuiText('Basic App Bar', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            AuiAppBar(
              title: const AuiText(
                'Basic App Bar',
                variant: AuiTextVariant.headlineMedium,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // App Bar with Actions
            const AuiText('With Actions', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            AuiAppBar(
              title: const AuiText(
                'With Actions',
                variant: AuiTextVariant.headlineMedium,
              ),
              actions: [
                IconButton(
                  icon: const AuiIcon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const AuiIcon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // App Bar with Leading
            const AuiText('With Leading', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            AuiAppBar(
              title: const AuiText(
                'With Leading',
                variant: AuiTextVariant.headlineMedium,
              ),
              leading: IconButton(
                icon: const AuiIcon(Icons.menu),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  icon: const AuiIcon(Icons.settings),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabsSection() {
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
            
            // Basic Tabs
            const AuiText('Basic Tabs', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    onTap: (index) {
                      setState(() {
                        _selectedTabIndex = index;
                      });
                    },
                    tabs: const [
                      Tab(icon: AuiIcon(Icons.home), text: 'Home'),
                      Tab(icon: AuiIcon(Icons.search), text: 'Search'),
                      Tab(icon: AuiIcon(Icons.person), text: 'Profile'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: AuiText(
                        'Tab ${_selectedTabIndex + 1} Content',
                        variant: AuiTextVariant.headlineMedium,
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

  Widget _buildBottomNavSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Bottom Navigation',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Basic Bottom Navigation
            const AuiText('Basic Bottom Navigation', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            AuiBottomNav(
              currentIndex: _selectedBottomNavIndex,
              onTap: (index) {
                setState(() {
                  _selectedBottomNavIndex = index;
                });
              },
              items: [
                AuiBottomNavItem(
                  icon: const AuiIcon(Icons.home),
                  label: 'Home',
                ),
                AuiBottomNavItem(
                  icon: const AuiIcon(Icons.search),
                  label: 'Search',
                ),
                AuiBottomNavItem(
                  icon: const AuiIcon(Icons.favorite),
                  label: 'Favorites',
                ),
                AuiBottomNavItem(
                  icon: const AuiIcon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Bottom Navigation Content
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: AuiText(
                  'Bottom Nav Item ${_selectedBottomNavIndex + 1} Content',
                  variant: AuiTextVariant.headlineMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreadcrumbsSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Breadcrumbs',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Basic Breadcrumbs
            const AuiText('Basic Breadcrumbs', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            AuiBreadcrumbs(
              items: [
                AuiBreadcrumbItem(
                  label: 'Home',
                  onTap: () {},
                ),
                AuiBreadcrumbItem(
                  label: 'Products',
                  onTap: () {},
                ),
                AuiBreadcrumbItem(
                  label: 'Electronics',
                  onTap: () {},
                ),
                AuiBreadcrumbItem(
                  label: 'Smartphones',
                  onTap: null, // Current page
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Breadcrumbs with Icons
            const AuiText('With Icons', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            AuiBreadcrumbs(
              items: [
                AuiBreadcrumbItem(
                  icon: const AuiIcon(Icons.home),
                  label: 'Home',
                  onTap: () {},
                ),
                AuiBreadcrumbItem(
                  icon: const AuiIcon(Icons.folder),
                  label: 'Documents',
                  onTap: () {},
                ),
                AuiBreadcrumbItem(
                  icon: const AuiIcon(Icons.description),
                  label: 'Reports',
                  onTap: () {},
                ),
                AuiBreadcrumbItem(
                  icon: const AuiIcon(Icons.assessment),
                  label: 'Monthly Report',
                  onTap: null, // Current page
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}