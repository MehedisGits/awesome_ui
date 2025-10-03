import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_core/ui_core.dart';
import 'package:ui_tokens/ui_tokens.dart';

/// Cross-platform test matrix for the Awesome UI library.
class CrossPlatformTestMatrix {
  /// Test all platform styles
  static Future<void> testAllPlatforms(
    WidgetTester tester,
    Widget Function(PlatformStyle) builder,
  ) async {
    for (final platform in PlatformStyle.values) {
      await tester.pumpWidget(
        AppStyleScope(
          platformStyle: platform,
          colors: AppColors.light,
          typography: AppTypography.standard(),
          spacing: AppSpacing.standard(),
          radius: AppRadius.standard(),
          elevation: AppElevation.standard(),
          motion: AppMotion.standard(),
          child: MaterialApp(
            home: builder(platform),
          ),
        ),
      );
      await tester.pumpAndSettle();
    }
  }

  /// Test all theme variants
  static Future<void> testAllThemes(
    WidgetTester tester,
    Widget Function(AppColors) builder,
  ) async {
    final themes = [
      AppColors.light,
      AppColors.dark,
      AppColors.highContrast,
    ];

    for (final theme in themes) {
      await tester.pumpWidget(
        AppStyleScope(
          platformStyle: PlatformStyle.material,
          colors: theme,
          typography: AppTypography.standard(),
          spacing: AppSpacing.standard(),
          radius: AppRadius.standard(),
          elevation: AppElevation.standard(),
          motion: AppMotion.standard(),
          child: MaterialApp(
            home: builder(theme),
          ),
        ),
      );
      await tester.pumpAndSettle();
    }
  }

  /// Test all breakpoints
  static Future<void> testAllBreakpoints(
    WidgetTester tester,
    Widget Function(double) builder,
  ) async {
    final breakpoints = [400.0, 600.0, 900.0, 1200.0];

    for (final width in breakpoints) {
      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: width,
            child: builder(width),
          ),
        ),
      );
      await tester.pumpAndSettle();
    }
  }

  /// Test all accessibility features
  static Future<void> testAllAccessibility(
    WidgetTester tester,
    Widget Function() builder,
  ) async {
    // Test with high contrast
    await tester.pumpWidget(
      AppStyleScope(
        platformStyle: PlatformStyle.material,
        colors: AppColors.highContrast,
        typography: AppTypography.standard(),
        spacing: AppSpacing.standard(),
        radius: AppRadius.standard(),
        elevation: AppElevation.standard(),
        motion: AppMotion.standard(),
        child: MaterialApp(
          home: builder(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Test with reduced motion
    await tester.pumpWidget(
      AppStyleScope(
        platformStyle: PlatformStyle.material,
        colors: AppColors.light,
        typography: AppTypography.standard(),
        spacing: AppSpacing.standard(),
        radius: AppRadius.standard(),
        elevation: AppElevation.standard(),
        motion: AppMotion.standard(),
        child: MaterialApp(
          home: builder(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Test with RTL
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: AppStyleScope(
          platformStyle: PlatformStyle.material,
          colors: AppColors.light,
          typography: AppTypography.standard(),
          spacing: AppSpacing.standard(),
          radius: AppRadius.standard(),
          elevation: AppElevation.standard(),
          motion: AppMotion.standard(),
          child: MaterialApp(
            home: builder(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }
}
