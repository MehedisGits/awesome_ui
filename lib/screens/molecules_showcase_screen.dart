import 'package:flutter/material.dart';
import 'package:awesome_ui/awesome_ui.dart';

class MoleculesShowcaseScreen extends StatefulWidget {
  const MoleculesShowcaseScreen({super.key});

  @override
  State<MoleculesShowcaseScreen> createState() => _MoleculesShowcaseScreenState();
}

class _MoleculesShowcaseScreenState extends State<MoleculesShowcaseScreen> {
  final TextEditingController _textController = TextEditingController();
  bool _checkboxValue = false;
  bool _switchValue = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuiText(
            'Molecules Showcase',
            variant: AuiTextVariant.headlineLarge,
          ),
          const SizedBox(height: 24),
          
          // Inputs Section
          _buildInputsSection(),
          
          const SizedBox(height: 32),
          
          // Cards Section
          _buildCardsSection(),
          
          const SizedBox(height: 32),
          
          // Avatars Section
          _buildAvatarsSection(),
          
          const SizedBox(height: 32),
          
          // Empty State Section
          _buildEmptyStateSection(),
        ],
      ),
    );
  }

  Widget _buildInputsSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Inputs',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Text Fields
            const AuiText('Text Fields', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Label',
                hintText: 'Enter text here',
              ),
              onChanged: (value) {
                // Handle text change
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            
            const SizedBox(height: 16),
            
            // Checkboxes
            const AuiText('Checkboxes', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                AuiCheckbox(
                  value: _checkboxValue,
                  onChanged: (value) {
                    setState(() {
                      _checkboxValue = value ?? false;
                    });
                  },
                ),
                const SizedBox(width: 8),
                const AuiText('Checkbox Option'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                AuiCheckbox(
                  value: !_checkboxValue,
                  onChanged: (value) {
                    setState(() {
                      _checkboxValue = !(value ?? false);
                    });
                  },
                ),
                const SizedBox(width: 8),
                const AuiText('Another Option'),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Switches
            const AuiText('Switches', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                AuiSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
                const SizedBox(width: 8),
                const AuiText('Switch Option'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                AuiSwitch(
                  value: !_switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = !value;
                    });
                  },
                ),
                const SizedBox(width: 8),
                const AuiText('Another Switch'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardsSection() {
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
            
            // Basic Card
            const AuiText('Basic Card', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
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
                      'This is a basic card with some content.',
                      variant: AuiTextVariant.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Card with Actions
            const AuiText('Card with Actions', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            AuiCard(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AuiText(
                      'Action Card',
                      variant: AuiTextVariant.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    const AuiText(
                      'This card has action buttons.',
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
            
            // List Tiles
            const AuiText('List Tiles', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            AuiListTile(
              leading: const AuiIcon(Icons.person),
              title: const AuiText('List Tile Title'),
              subtitle: const AuiText('List tile subtitle'),
              trailing: const AuiIcon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            AuiListTile(
              leading: const AuiIcon(Icons.settings),
              title: const AuiText('Settings'),
              subtitle: const AuiText('App settings and preferences'),
              trailing: const AuiIcon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            AuiListTile(
              leading: const AuiIcon(Icons.notifications),
              title: const AuiText('Notifications'),
              subtitle: const AuiText('Manage your notifications'),
              trailing: AuiSwitch(
                value: true,
                onChanged: (value) {},
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarsSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Avatars',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Avatar Sizes
            const AuiText('Sizes', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                AuiAvatar(
                  child: const AuiText('A'),
                  size: AuiAvatarSize.xs,
                ),
                const SizedBox(width: 8),
                AuiAvatar(
                  child: const AuiText('B'),
                  size: AuiAvatarSize.sm,
                ),
                const SizedBox(width: 8),
                AuiAvatar(
                  child: const AuiText('C'),
                  size: AuiAvatarSize.md,
                ),
                const SizedBox(width: 8),
                AuiAvatar(
                  child: const AuiText('D'),
                  size: AuiAvatarSize.lg,
                ),
                const SizedBox(width: 8),
                AuiAvatar(
                  child: const AuiText('E'),
                  size: AuiAvatarSize.xl,
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Avatar with Icons
            const AuiText('With Icons', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                AuiAvatar(
                  child: const AuiIcon(Icons.person),
                  size: AuiAvatarSize.md,
                ),
                const SizedBox(width: 8),
                AuiAvatar(
                  child: const AuiIcon(Icons.group),
                  size: AuiAvatarSize.md,
                ),
                const SizedBox(width: 8),
                AuiAvatar(
                  child: const AuiIcon(Icons.business),
                  size: AuiAvatarSize.md,
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Avatar Groups
            const AuiText('Avatar Groups', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                AuiAvatar(
                  child: const AuiText('A'),
                  size: AuiAvatarSize.sm,
                ),
                AuiAvatar(
                  child: const AuiText('B'),
                  size: AuiAvatarSize.sm,
                ),
                AuiAvatar(
                  child: const AuiText('C'),
                  size: AuiAvatarSize.sm,
                ),
                AuiAvatar(
                  child: const AuiText('+2'),
                  size: AuiAvatarSize.sm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyStateSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Empty State',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Empty State Examples
            AuiEmptyState(
              icon: const AuiIcon(Icons.inbox, size: AuiIconSize.xxl),
              title: 'No Items',
              subtitle: 'There are no items to display',
              action: AuiButton(
                onPressed: () {},
                child: const AuiText('Add Item'),
              ),
            ),
            
            const SizedBox(height: 16),
            
            AuiEmptyState(
              icon: const AuiIcon(Icons.search, size: AuiIconSize.xxl),
              title: 'No Results',
              subtitle: 'No results found for your search',
              action: AuiButton(
                onPressed: () {},
                variant: AuiButtonVariant.outline,
                child: const AuiText('Clear Search'),
              ),
            ),
            
            const SizedBox(height: 16),
            
            AuiEmptyState(
              icon: const AuiIcon(Icons.error_outline, size: AuiIconSize.xxl),
              title: 'Error',
              subtitle: 'Something went wrong',
              action: AuiButton(
                onPressed: () {},
                child: const AuiText('Retry'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}