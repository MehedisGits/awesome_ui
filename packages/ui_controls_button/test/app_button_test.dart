import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_controls_button/ui_controls_button.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';

void main() {
  group('AppButton', () {
    testWidgets('renders with text', (WidgetTester tester) async {
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
              body: AppButton(
                onPressed: () {},
                text: 'Test Button',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('renders with icon', (WidgetTester tester) async {
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
              body: AppButton(
                onPressed: () {},
                icon: Icons.add,
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('renders disabled state', (WidgetTester tester) async {
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
              body: AppButton(
                onPressed: null,
                text: 'Disabled Button',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Disabled Button'), findsOneWidget);
      // Button should be disabled
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('renders loading state', (WidgetTester tester) async {
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
              body: AppButton(
                onPressed: () {},
                text: 'Loading Button',
                isLoading: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders different variants', (WidgetTester tester) async {
      final variants = [
        ButtonVariant.primary,
        ButtonVariant.secondary,
        ButtonVariant.tonal,
        ButtonVariant.ghost,
        ButtonVariant.destructive,
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
                body: AppButton(
                  onPressed: () {},
                  text: 'Button',
                  variant: variant,
                ),
              ),
            ),
          ),
        );

        expect(find.text('Button'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('renders different sizes', (WidgetTester tester) async {
      final sizes = [
        ButtonSize.xs,
        ButtonSize.sm,
        ButtonSize.md,
        ButtonSize.lg,
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
                body: AppButton(
                  onPressed: () {},
                  text: 'Button',
                  size: size,
                ),
              ),
            ),
          ),
        );

        expect(find.text('Button'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
      bool wasPressed = false;
      
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
              body: AppButton(
                onPressed: () {
                  wasPressed = true;
                },
                text: 'Test Button',
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Test Button'));
      expect(wasPressed, isTrue);
    });
  });
}
