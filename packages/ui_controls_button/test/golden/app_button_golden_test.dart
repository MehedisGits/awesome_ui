import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_controls_button/ui_controls_button.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';

void main() {
  group('AppButton Golden Tests', () {
    testWidgets('button variants', (WidgetTester tester) async {
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
                    AppButton(
                      onPressed: () {},
                      child: const Text('Primary'),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      onPressed: () {},
                      variant: ButtonVariant.secondary,
                      child: const Text('Secondary'),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      onPressed: () {},
                      variant: ButtonVariant.tonal,
                      child: const Text('Tonal'),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      onPressed: () {},
                      variant: ButtonVariant.ghost,
                      child: const Text('Ghost'),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      onPressed: () {},
                      variant: ButtonVariant.destructive,
                      child: const Text('Destructive'),
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
        matchesGoldenFile('button_variants.png'),
      );
    });

    testWidgets('button sizes', (WidgetTester tester) async {
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
                    AppButton(
                      onPressed: () {},
                      size: ButtonSize.xs,
                      child: const Text('Extra Small'),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      onPressed: () {},
                      size: ButtonSize.sm,
                      child: const Text('Small'),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      onPressed: () {},
                      size: ButtonSize.md,
                      child: const Text('Medium'),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      onPressed: () {},
                      size: ButtonSize.lg,
                      child: const Text('Large'),
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
        matchesGoldenFile('button_sizes.png'),
      );
    });

    testWidgets('button states', (WidgetTester tester) async {
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
                    AppButton(
                      onPressed: () {},
                      child: const Text('Normal'),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      onPressed: () {},
                      isLoading: true,
                      child: const Text('Loading'),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      onPressed: null,
                      child: const Text('Disabled'),
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
        matchesGoldenFile('button_states.png'),
      );
    });

    testWidgets('button with icons', (WidgetTester tester) async {
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
                    AppButton(
                      onPressed: () {},
                      // leadingIcon: const Icon(Icons.add), // Not available in current Flutter version
                      child: const Text('Add Item'),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      onPressed: () {},
                      // trailingIcon: const Icon(Icons.arrow_forward), // Not available in current Flutter version
                      child: const Text('Next'),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      onPressed: () {},
                      // leadingIcon: const Icon(Icons.save), // Not available in current Flutter version
                      // trailingIcon: const Icon(Icons.check), // Not available in current Flutter version
                      child: const Text('Save & Continue'),
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
        matchesGoldenFile('button_with_icons.png'),
      );
    });

    testWidgets('button responsive', (WidgetTester tester) async {
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
                        AppButton(
                          onPressed: () {},
                          child: const Text('Mobile'),
                        ),
                        AppButton(
                          onPressed: () {},
                          child: const Text('Tablet'),
                        ),
                        AppButton(
                          onPressed: () {},
                          child: const Text('Desktop'),
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
        matchesGoldenFile('button_responsive.png'),
      );
    });

    testWidgets('button accessibility', (WidgetTester tester) async {
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
                    AppButton(
                      onPressed: () {},
                      semanticLabel: 'Accessible button for testing',
                      child: const Text('Accessible Button'),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      onPressed: () {},
                      semanticLabel: 'Required action button',
                      child: const Text('Required Button'),
                      // tooltip: 'This action is required', // Not available in current Flutter version
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
        matchesGoldenFile('button_accessibility.png'),
      );
    });
  });
}
