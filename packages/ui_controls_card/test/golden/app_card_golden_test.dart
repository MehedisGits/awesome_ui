import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_controls_card/ui_controls_card.dart';
import 'package:ui_controls_card/src/card_sizes.dart' as card_sizes;
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';

void main() {
  group('AppCard Golden Tests', () {
    testWidgets('card variants', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppStyleScope(
            platformStyle: PlatformStyle.material,
            colors: AppColors.light,
            typography: AppTypography.standard(),
            spacing: AppSpacing.standard(),
            radius: AppRadius.standard(),
            elevation: AppElevation.standard(),
            motion: AppMotion.standard(),
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    AppCard(
                      child: const Text('Filled Card'),
                      variant: CardVariant.filled,
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('Outlined Card'),
                      variant: CardVariant.outlined,
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('Elevated Card'),
                      variant: CardVariant.elevated,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('card_variants.png'),
      );
    });

    testWidgets('card sizes', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppStyleScope(
            platformStyle: PlatformStyle.material,
            colors: AppColors.light,
            typography: AppTypography.standard(),
            spacing: AppSpacing.standard(),
            radius: AppRadius.standard(),
            elevation: AppElevation.standard(),
            motion: AppMotion.standard(),
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    AppCard(
                      child: const Text('Small Card'),
                      size: card_sizes.CardSize.sm,
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('Medium Card'),
                      size: card_sizes.CardSize.md,
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('Large Card'),
                      size: card_sizes.CardSize.lg,
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('Extra Large Card'),
                      size: card_sizes.CardSize.xl,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('card_sizes.png'),
      );
    });

    testWidgets('card elevations', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppStyleScope(
            platformStyle: PlatformStyle.material,
            colors: AppColors.light,
            typography: AppTypography.standard(),
            spacing: AppSpacing.standard(),
            radius: AppRadius.standard(),
            elevation: AppElevation.standard(),
            motion: AppMotion.standard(),
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    AppCard(
                      child: const Text('No Elevation'),
                      elevation: CardElevation.none,
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('Low Elevation'),
                      elevation: CardElevation.low,
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('Medium Elevation'),
                      elevation: CardElevation.medium,
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('High Elevation'),
                      elevation: CardElevation.high,
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('Maximum Elevation'),
                      elevation: CardElevation.maximum,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('card_elevations.png'),
      );
    });

    testWidgets('card states', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppStyleScope(
            platformStyle: PlatformStyle.material,
            colors: AppColors.light,
            typography: AppTypography.standard(),
            spacing: AppSpacing.standard(),
            radius: AppRadius.standard(),
            elevation: AppElevation.standard(),
            motion: AppMotion.standard(),
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    AppCard(
                      child: const Text('Normal Card'),
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('Clickable Card'),
                      isClickable: true,
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('Selected Card'),
                      isSelected: true,
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('Disabled Card'),
                      isDisabled: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('card_states.png'),
      );
    });

    testWidgets('card surfaces', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppStyleScope(
            platformStyle: PlatformStyle.material,
            colors: AppColors.light,
            typography: AppTypography.standard(),
            spacing: AppSpacing.standard(),
            radius: AppRadius.standard(),
            elevation: AppElevation.standard(),
            motion: AppMotion.standard(),
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    AppCard(
                      child: const Text('Primary Surface'),
                      surface: CardSurface.primary,
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('Secondary Surface'),
                      surface: CardSurface.secondary,
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('Tertiary Surface'),
                      surface: CardSurface.tertiary,
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('Container Surface'),
                      surface: CardSurface.container,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('card_surfaces.png'),
      );
    });

    testWidgets('card responsive', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppStyleScope(
            platformStyle: PlatformStyle.material,
            colors: AppColors.light,
            typography: AppTypography.standard(),
            spacing: AppSpacing.standard(),
            radius: AppRadius.standard(),
            elevation: AppElevation.standard(),
            motion: AppMotion.standard(),
            child: Scaffold(
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        AppCard(
                          child: const Text('Mobile Card'),
                        ),
                        AppCard(
                          child: const Text('Tablet Card'),
                        ),
                        AppCard(
                          child: const Text('Desktop Card'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('card_responsive.png'),
      );
    });

    testWidgets('card accessibility', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppStyleScope(
            platformStyle: PlatformStyle.material,
            colors: AppColors.light,
            typography: AppTypography.standard(),
            spacing: AppSpacing.standard(),
            radius: AppRadius.standard(),
            elevation: AppElevation.standard(),
            motion: AppMotion.standard(),
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    AppCard(
                      child: const Text('Accessible Card'),
                      semanticLabel: 'Accessible card for testing',
                    ),
                    const SizedBox(height: 16),
                    AppCard(
                      child: const Text('Clickable Card'),
                      isClickable: true,
                      onTap: () {},
                      semanticLabel: 'Clickable card, tap to activate',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('card_accessibility.png'),
      );
    });
  });
}
