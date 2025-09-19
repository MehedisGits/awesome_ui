import 'package:flutter/material.dart';
import 'package:awesome_ui/awesome_ui.dart';

class AtomsShowcaseScreen extends StatefulWidget {
  const AtomsShowcaseScreen({super.key});

  @override
  State<AtomsShowcaseScreen> createState() => _AtomsShowcaseScreenState();
}

class _AtomsShowcaseScreenState extends State<AtomsShowcaseScreen> {
  double _progressValue = 0.3;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuiText(
            'Atoms Showcase',
            variant: AuiTextVariant.headlineLarge,
          ),
          const SizedBox(height: 24),
          
          // Buttons Section
          _buildButtonsSection(),
          
          const SizedBox(height: 32),
          
          // Text Section
          _buildTextSection(),
          
          const SizedBox(height: 32),
          
          // Icons Section
          _buildIconsSection(),
          
          const SizedBox(height: 32),
          
          // Chips Section
          _buildChipsSection(),
          
          const SizedBox(height: 32),
          
          // Progress Section
          _buildProgressSection(),
          
          const SizedBox(height: 32),
          
          // Skeleton Section
          _buildSkeletonSection(),
          
          const SizedBox(height: 32),
          
          // Divider Section
          _buildDividerSection(),
          
          const SizedBox(height: 32),
          
          // Tooltip Section
          _buildTooltipSection(),
        ],
      ),
    );
  }

  Widget _buildButtonsSection() {
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
            
            // Button Variants
            const AuiText('Variants', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiButton(
                  onPressed: () {},
                  child: const AuiText('Solid'),
                ),
                AuiButton(
                  onPressed: () {},
                  variant: AuiButtonVariant.tonal,
                  child: const AuiText('Tonal'),
                ),
                AuiButton(
                  onPressed: () {},
                  variant: AuiButtonVariant.outline,
                  child: const AuiText('Outline'),
                ),
                AuiButton(
                  onPressed: () {},
                  variant: AuiButtonVariant.ghost,
                  child: const AuiText('Ghost'),
                ),
                AuiButton(
                  onPressed: () {},
                  variant: AuiButtonVariant.link,
                  child: const AuiText('Link'),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Button Emphasis
            const AuiText('Emphasis', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiButton(
                  onPressed: () {},
                  emphasis: AuiButtonEmphasis.primary,
                  child: const AuiText('Primary'),
                ),
                AuiButton(
                  onPressed: () {},
                  emphasis: AuiButtonEmphasis.secondary,
                  child: const AuiText('Secondary'),
                ),
                AuiButton(
                  onPressed: () {},
                  emphasis: AuiButtonEmphasis.danger,
                  child: const AuiText('Danger'),
                ),
                AuiButton(
                  onPressed: () {},
                  emphasis: AuiButtonEmphasis.warning,
                  child: const AuiText('Warning'),
                ),
                AuiButton(
                  onPressed: () {},
                  emphasis: AuiButtonEmphasis.success,
                  child: const AuiText('Success'),
                ),
                AuiButton(
                  onPressed: () {},
                  emphasis: AuiButtonEmphasis.neutral,
                  child: const AuiText('Neutral'),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Button Sizes
            const AuiText('Sizes', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiButton(
                  onPressed: () {},
                  size: AuiButtonSize.xs,
                  child: const AuiText('XS'),
                ),
                AuiButton(
                  onPressed: () {},
                  size: AuiButtonSize.sm,
                  child: const AuiText('SM'),
                ),
                AuiButton(
                  onPressed: () {},
                  size: AuiButtonSize.md,
                  child: const AuiText('MD'),
                ),
                AuiButton(
                  onPressed: () {},
                  size: AuiButtonSize.lg,
                  child: const AuiText('LG'),
                ),
                AuiButton(
                  onPressed: () {},
                  size: AuiButtonSize.xl,
                  child: const AuiText('XL'),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Button States
            const AuiText('States', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiButton(
                  onPressed: () {},
                  child: const AuiText('Enabled'),
                ),
                AuiButton(
                  onPressed: null,
                  child: const AuiText('Disabled'),
                ),
                AuiButton(
                  onPressed: () {},
                  loading: true,
                  child: const AuiText('Loading'),
                ),
                AuiButton(
                  onPressed: () {},
                  icon: const AuiIcon(Icons.add),
                  child: const AuiText('With Icon'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Text',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Text Variants
            const AuiText('Variants', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            const AuiText('Display Large', variant: AuiTextVariant.displayLarge),
            const AuiText('Display Medium', variant: AuiTextVariant.displayMedium),
            const AuiText('Display Small', variant: AuiTextVariant.displaySmall),
            const AuiText('Headline Large', variant: AuiTextVariant.headlineLarge),
            const AuiText('Headline Medium', variant: AuiTextVariant.headlineMedium),
            const AuiText('Headline Small', variant: AuiTextVariant.headlineSmall),
            const AuiText('Title Large', variant: AuiTextVariant.titleLarge),
            const AuiText('Title Medium', variant: AuiTextVariant.titleMedium),
            const AuiText('Title Small', variant: AuiTextVariant.titleSmall),
            const AuiText('Body Large', variant: AuiTextVariant.bodyLarge),
            const AuiText('Body Medium', variant: AuiTextVariant.bodyMedium),
            const AuiText('Body Small', variant: AuiTextVariant.bodySmall),
            const AuiText('Label Large', variant: AuiTextVariant.labelLarge),
            const AuiText('Label Medium', variant: AuiTextVariant.labelMedium),
            const AuiText('Label Small', variant: AuiTextVariant.labelSmall),
            const AuiText('Caption', variant: AuiTextVariant.caption),
            const AuiText('Overline', variant: AuiTextVariant.overline),
            
            const SizedBox(height: 16),
            
            // Text Emphasis
            const AuiText('Emphasis', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            const AuiText('High Emphasis', variant: AuiTextVariant.bodyLarge, emphasis: AuiTextEmphasis.high),
            const AuiText('Medium Emphasis', variant: AuiTextVariant.bodyLarge, emphasis: AuiTextEmphasis.medium),
            const AuiText('Low Emphasis', variant: AuiTextVariant.bodyLarge, emphasis: AuiTextEmphasis.low),
            const AuiText('Disabled Text', variant: AuiTextVariant.bodyLarge, emphasis: AuiTextEmphasis.disabled),
          ],
        ),
      ),
    );
  }

  Widget _buildIconsSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Icons',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Icon Sizes
            const AuiText('Sizes', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiIcon(Icons.star, size: AuiIconSize.xs),
                AuiIcon(Icons.star, size: AuiIconSize.sm),
                AuiIcon(Icons.star, size: AuiIconSize.md),
                AuiIcon(Icons.star, size: AuiIconSize.lg),
                AuiIcon(Icons.star, size: AuiIconSize.xl),
                AuiIcon(Icons.star, size: AuiIconSize.xxl),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Icon Colors
            const AuiText('Colors', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiIcon(Icons.favorite, color: Colors.red),
                AuiIcon(Icons.star, color: Colors.orange),
                AuiIcon(Icons.thumb_up, color: Colors.green),
                AuiIcon(Icons.info, color: Colors.blue),
                AuiIcon(Icons.warning, color: Colors.amber),
                AuiIcon(Icons.error, color: Colors.red),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Common Icons
            const AuiText('Common Icons', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiIcon(Icons.home),
                AuiIcon(Icons.search),
                AuiIcon(Icons.settings),
                AuiIcon(Icons.person),
                AuiIcon(Icons.email),
                AuiIcon(Icons.phone),
                AuiIcon(Icons.location_on),
                AuiIcon(Icons.schedule),
                AuiIcon(Icons.notifications),
                AuiIcon(Icons.menu),
                AuiIcon(Icons.close),
                AuiIcon(Icons.check),
                AuiIcon(Icons.add),
                AuiIcon(Icons.remove),
                AuiIcon(Icons.edit),
                AuiIcon(Icons.delete),
                AuiIcon(Icons.download),
                AuiIcon(Icons.upload),
                AuiIcon(Icons.share),
                AuiIcon(Icons.favorite),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChipsSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Chips',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Chip Variants
            const AuiText('Variants', variant: AuiTextVariant.titleSmall),
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
            
            // Disabled Chips
            const AuiText('Disabled', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiChip(
                  label: const AuiText('Disabled'),
                  onPressed: null,
                ),
                AuiChip(
                  label: const AuiText('No Action'),
                  onPressed: null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Progress',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Linear Progress
            const AuiText('Linear Progress', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            AuiProgress(value: 0.2),
            const SizedBox(height: 8),
            AuiProgress(value: 0.5),
            const SizedBox(height: 8),
            AuiProgress(value: 0.8),
            const SizedBox(height: 8),
            AuiProgress(value: 1.0),
            
            const SizedBox(height: 16),
            
            // Circular Progress
            const AuiText('Circular Progress', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                AuiProgress(
                  value: 0.2,
                  variant: AuiProgressVariant.circular,
                ),
                const SizedBox(width: 16),
                AuiProgress(
                  value: 0.5,
                  variant: AuiProgressVariant.circular,
                ),
                const SizedBox(width: 16),
                AuiProgress(
                  value: 0.8,
                  variant: AuiProgressVariant.circular,
                ),
                const SizedBox(width: 16),
                AuiProgress(
                  value: 1.0,
                  variant: AuiProgressVariant.circular,
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Interactive Progress
            const AuiText('Interactive Progress', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            AuiProgress(value: _progressValue),
            const SizedBox(height: 8),
            Slider(
              value: _progressValue,
              onChanged: (value) {
                setState(() {
                  _progressValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Skeleton',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Skeleton Variants
            const AuiText('Variants', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            AuiSkeleton(
              width: 200,
              height: 20,
            ),
            const SizedBox(height: 8),
            AuiSkeleton(
              width: 150,
              height: 20,
            ),
            const SizedBox(height: 8),
            AuiSkeleton(
              width: 100,
              height: 20,
            ),
            
            const SizedBox(height: 16),
            
            // Skeleton Shapes
            const AuiText('Shapes', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                AuiSkeleton(
                  width: 60,
                  height: 60,
                  borderRadius: BorderRadius.circular(30),
                ),
                const SizedBox(width: 16),
                AuiSkeleton(
                  width: 60,
                  height: 60,
                  borderRadius: BorderRadius.circular(8),
                ),
                const SizedBox(width: 16),
                AuiSkeleton(
                  width: 60,
                  height: 60,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDividerSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Divider',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Horizontal Dividers
            const AuiText('Horizontal', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            const AuiDivider(),
            const SizedBox(height: 16),
            const AuiDivider(thickness: 2),
            const SizedBox(height: 16),
            const AuiDivider(thickness: 4),
            
            const SizedBox(height: 16),
            
            // Vertical Dividers
            const AuiText('Vertical', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                const AuiText('Left'),
                const VerticalDivider(width: 1, thickness: 1),
                const AuiText('Middle'),
                const VerticalDivider(width: 1, thickness: 1),
                const AuiText('Right'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTooltipSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Tooltip',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Tooltip Examples
            const AuiText('Examples', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiTooltip(
                  message: 'This is a tooltip',
                  child: AuiButton(
                    onPressed: () {},
                    child: const AuiText('Hover Me'),
                  ),
                ),
                AuiTooltip(
                  message: 'Long tooltip message that explains what this button does',
                  child: AuiButton(
                    onPressed: () {},
                    variant: AuiButtonVariant.outline,
                    child: const AuiText('Long Tooltip'),
                  ),
                ),
                AuiTooltip(
                  message: 'Icon tooltip',
                  child: AuiIcon(Icons.help, size: AuiIconSize.lg),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}