import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_controls_card/ui_controls_card.dart';
import 'package:ui_controls_card/src/card_sizes.dart' as card_sizes;
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';

void main() {
  group('AppCard', () {
    testWidgets('renders with child', (WidgetTester tester) async {
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
              body: AppCard(
                child: Text('Test Card Content'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Test Card Content'), findsOneWidget);
    });

    testWidgets('renders clickable card', (WidgetTester tester) async {
      bool wasTapped = false;
      
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
              body: AppCard(
                child: Text('Clickable Card'),
                isClickable: true,
                onTap: () {
                  wasTapped = true;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Clickable Card'));
      expect(wasTapped, isTrue);
    });

    testWidgets('renders disabled card', (WidgetTester tester) async {
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
              body: AppCard(
                child: Text('Disabled Card'),
                isClickable: true,
                isDisabled: true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Disabled Card'), findsOneWidget);
      // Card should not be tappable when disabled
      await tester.tap(find.text('Disabled Card'));
      // No crash should occur
    });

    testWidgets('renders selected card', (WidgetTester tester) async {
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
              body: AppCard(
                child: Text('Selected Card'),
                isSelected: true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Selected Card'), findsOneWidget);
    });

    testWidgets('renders different variants', (WidgetTester tester) async {
      final variants = [
        CardVariant.filled,
        CardVariant.outlined,
        CardVariant.elevated,
      ];

      for (final variant in variants) {
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
                body: AppCard(
                  child: Text('Test Card'),
                  variant: variant,
                ),
              ),
            ),
          ),
        );

        expect(find.text('Test Card'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('renders different sizes', (WidgetTester tester) async {
      final sizes = [
        card_sizes.CardSize.sm,
        card_sizes.CardSize.md,
        card_sizes.CardSize.lg,
        card_sizes.CardSize.xl,
      ];

      for (final size in sizes) {
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
                body: AppCard(
                  child: Text('Test Card'),
                  size: size,
                ),
              ),
            ),
          ),
        );

        expect(find.text('Test Card'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('renders different elevations', (WidgetTester tester) async {
      final elevations = [
        CardElevation.none,
        CardElevation.low,
        CardElevation.medium,
        CardElevation.high,
        CardElevation.maximum,
      ];

      for (final elevation in elevations) {
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
                body: AppCard(
                  child: Text('Test Card'),
                  elevation: elevation,
                ),
              ),
            ),
          ),
        );

        expect(find.text('Test Card'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });
  });
}
