import 'package:flutter/material.dart';
import 'package:ui_controls_card/ui_controls_card.dart';
import 'package:ui_controls_card/src/card_sizes.dart' as card_sizes;
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';

void main() {
  runApp(const AppCardExample());
}

class AppCardExample extends StatelessWidget {
  const AppCardExample({super.key});

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
        title: 'AppCard Example',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: AppColors.light.toColorScheme(),
        ),
        home: const CardShowcase(),
      ),
    );
  }
}

class CardShowcase extends StatefulWidget {
  const CardShowcase({super.key});

  @override
  State<CardShowcase> createState() => _CardShowcaseState();
}

class _CardShowcaseState extends State<CardShowcase> {
  int _selectedCardIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppCard Showcase'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Card Variants',
              [
                _buildCardRow([
                  AppCard(
                    child: _buildCardContent('Filled Card', 'This is a filled card'),
                    variant: CardVariant.filled,
                  ),
                  AppCard(
                    child: _buildCardContent('Outlined Card', 'This is an outlined card'),
                    variant: CardVariant.outlined,
                  ),
                  AppCard(
                    child: _buildCardContent('Elevated Card', 'This is an elevated card'),
                    variant: CardVariant.elevated,
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Card Sizes',
              [
                _buildCardRow([
                  AppCard(
                    child: _buildCardContent('Small Card', 'Small size'),
                    size: card_sizes.CardSize.sm,
                  ),
                  AppCard(
                    child: _buildCardContent('Medium Card', 'Medium size'),
                    size: card_sizes.CardSize.md,
                  ),
                  AppCard(
                    child: _buildCardContent('Large Card', 'Large size'),
                    size: card_sizes.CardSize.lg,
                  ),
                  AppCard(
                    child: _buildCardContent('Extra Large Card', 'Extra large size'),
                    size: card_sizes.CardSize.xl,
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Card States',
              [
                _buildCardRow([
                  AppCard(
                    child: _buildCardContent('Normal Card', 'Normal state'),
                  ),
                  AppCard(
                    child: _buildCardContent('Selected Card', 'Selected state'),
                    isSelected: true,
                  ),
                  AppCard(
                    child: _buildCardContent('Disabled Card', 'Disabled state'),
                    isDisabled: true,
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Clickable Cards',
              [
                _buildCardRow([
                  AppCard(
                    child: _buildCardContent('Clickable Card', 'Tap me!'),
                    isClickable: true,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Card tapped!')),
                      );
                    },
                  ),
                  AppCard(
                    child: _buildCardContent('Long Press Card', 'Long press me!'),
                    isClickable: true,
                    onLongPress: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Card long pressed!')),
                      );
                    },
                  ),
                  AppCard(
                    child: _buildCardContent('Double Tap Card', 'Double tap me!'),
                    isClickable: true,
                    onDoubleTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Card double tapped!')),
                      );
                    },
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Card Elevations',
              [
                _buildCardRow([
                  AppCard(
                    child: _buildCardContent('No Elevation', 'Flat appearance'),
                    elevation: CardElevation.none,
                  ),
                  AppCard(
                    child: _buildCardContent('Low Elevation', 'Subtle depth'),
                    elevation: CardElevation.low,
                  ),
                  AppCard(
                    child: _buildCardContent('Medium Elevation', 'Standard depth'),
                    elevation: CardElevation.medium,
                  ),
                  AppCard(
                    child: _buildCardContent('High Elevation', 'Prominent depth'),
                    elevation: CardElevation.high,
                  ),
                  AppCard(
                    child: _buildCardContent('Maximum Elevation', 'Highest depth'),
                    elevation: CardElevation.maximum,
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Selectable Cards',
              [
                _buildCardRow([
                  for (int i = 0; i < 3; i++)
                    AppCard(
                      child: _buildCardContent('Card ${i + 1}', 'Selectable card'),
                      isClickable: true,
                      isSelected: _selectedCardIndex == i,
                      onTap: () {
                        setState(() {
                          _selectedCardIndex = _selectedCardIndex == i ? -1 : i;
                        });
                      },
                    ),
                ]),
                const SizedBox(height: 16),
                Text(
                  'Selected: ${_selectedCardIndex == -1 ? 'None' : 'Card ${_selectedCardIndex + 1}'}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Card with Custom Content',
              [
                _buildCardRow([
                  AppCard(
                    child: _buildRichCardContent(
                      'Product Card',
                      'Amazing product description',
                      '\$99.99',
                      Icons.shopping_cart,
                    ),
                    isClickable: true,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Product added to cart!')),
                      );
                    },
                  ),
                  AppCard(
                    child: _buildRichCardContent(
                      'Article Card',
                      'Read our latest article about design systems',
                      '5 min read',
                      Icons.article,
                    ),
                    isClickable: true,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Article opened!')),
                      );
                    },
                  ),
                ]),
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

  Widget _buildCardRow(List<AppCard> cards) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: cards,
    );
  }

  Widget _buildCardContent(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildRichCardContent(String title, String subtitle, String trailing, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              trailing,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
