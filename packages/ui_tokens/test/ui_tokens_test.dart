import 'package:flutter_test/flutter_test.dart';
import 'package:ui_tokens/ui_tokens.dart';

void main() {
  group('UI Tokens Tests', () {
    test('AppColors should have light and dark themes', () {
      expect(AppColors.light, isNotNull);
      expect(AppColors.dark, isNotNull);
      expect(AppColors.highContrast, isNotNull);
    });

    test('AppTypography should have standard factory', () {
      expect(AppTypography.standard(), isNotNull);
    });

    test('AppSpacing should have standard factory', () {
      expect(AppSpacing.standard(), isNotNull);
    });

    test('AppRadius should have standard factory', () {
      expect(AppRadius.standard(), isNotNull);
    });

    test('AppElevation should have standard factory', () {
      expect(AppElevation.standard(), isNotNull);
    });

    test('AppMotion should have standard factory', () {
      expect(AppMotion.standard, isNotNull);
    });
  });
}
