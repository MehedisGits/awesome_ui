import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_core/ui_core.dart';
import 'package:ui_tokens/ui_tokens.dart';

void main() {
  group('UI Core Tests', () {
    test('PlatformStyle should have all expected values', () {
      expect(PlatformStyle.values, contains(PlatformStyle.material));
      expect(PlatformStyle.values, contains(PlatformStyle.cupertino));
      expect(PlatformStyle.values, contains(PlatformStyle.web));
    });

    test('AppStyleScope should be creatable', () {
      expect(() => AppStyleScope(
        platformStyle: PlatformStyle.material,
        colors: AppColors.light,
        typography: AppTypography.standard(),
        spacing: AppSpacing.standard(),
        radius: AppRadius.standard(),
        elevation: AppElevation.standard(),
        motion: AppMotion.standard(),
        child: Container(),
      ), returnsNormally);
    });

    test('PerformanceMonitor should be singleton', () {
      final monitor1 = PerformanceMonitor();
      final monitor2 = PerformanceMonitor();
      expect(identical(monitor1, monitor2), isTrue);
    });

    test('MemoryMonitor should be singleton', () {
      final monitor1 = MemoryMonitor();
      final monitor2 = MemoryMonitor();
      expect(identical(monitor1, monitor2), isTrue);
    });
  });
}
