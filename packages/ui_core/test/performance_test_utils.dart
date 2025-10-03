import 'dart:io';

  import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Performance test utilities for the Awesome UI library.
class PerformanceTestUtils {
  /// Measure widget build time
  static Future<Duration> measureBuildTime(
    WidgetTester tester,
    Widget Function() builder,
  ) async {
    final stopwatch = Stopwatch()..start();
    await tester.pumpWidget(builder());
    stopwatch.stop();
    return stopwatch.elapsed;
  }

  /// Measure widget render time
  static Future<Duration> measureRenderTime(
    WidgetTester tester,
    Widget Function() builder,
  ) async {
    await tester.pumpWidget(builder());
    final stopwatch = Stopwatch()..start();
    await tester.pumpAndSettle();
    stopwatch.stop();
    return stopwatch.elapsed;
  }

  /// Measure memory usage
  static int measureMemoryUsage() {
    return ProcessInfo.currentRss;
  }

  /// Test if build time is within acceptable limits
  static void expectBuildTimeWithin(
    Duration actual,
    Duration maxDuration,
  ) {
    expect(actual, lessThanOrEqualTo(maxDuration));
  }

  /// Test if render time is within acceptable limits
  static void expectRenderTimeWithin(
    Duration actual,
    Duration maxDuration,
  ) {
    expect(actual, lessThanOrEqualTo(maxDuration));
  }

  /// Test if memory usage is within acceptable limits
  static void expectMemoryUsageWithin(
    int actual,
    int maxMemory,
  ) {
    expect(actual, lessThanOrEqualTo(maxMemory));
  }
}
