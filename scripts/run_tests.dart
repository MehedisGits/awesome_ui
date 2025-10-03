#!/usr/bin/env dart

import 'dart:io';
import 'dart:convert';

/// Test runner script for Awesome UI library
void main(List<String> args) async {
  print('🧪 Running Awesome UI Tests...\n');

  // Parse command line arguments
  final testType = args.isNotEmpty ? args[0] : 'all';
  final verbose = args.contains('--verbose') || args.contains('-v');
  final coverage = args.contains('--coverage') || args.contains('-c');
  final golden = args.contains('--golden') || args.contains('-g');

  // Load test configuration
  final config = await _loadTestConfig();

  // Run tests based on type
  switch (testType) {
    case 'all':
      await _runAllTests(config, verbose, coverage, golden);
      break;
    case 'unit':
      await _runUnitTests(config, verbose, coverage);
      break;
    case 'widget':
      await _runWidgetTests(config, verbose, coverage);
      break;
    case 'integration':
      await _runIntegrationTests(config, verbose, coverage);
      break;
    case 'golden':
      await _runGoldenTests(config, verbose);
      break;
    case 'accessibility':
      await _runAccessibilityTests(config, verbose);
      break;
    case 'performance':
      await _runPerformanceTests(config, verbose);
      break;
    case 'cross-platform':
      await _runCrossPlatformTests(config, verbose);
      break;
    default:
      print('❌ Unknown test type: $testType');
      print('Available types: all, unit, widget, integration, golden, accessibility, performance, cross-platform');
      exit(1);
  }

  print('\n✅ All tests completed successfully!');
}

/// Load test configuration from JSON file
Future<Map<String, dynamic>> _loadTestConfig() async {
  try {
    final file = File('test_config.json');
    final contents = await file.readAsString();
    return jsonDecode(contents) as Map<String, dynamic>;
  } catch (e) {
    print('⚠️  Could not load test configuration: $e');
    return {};
  }
}

/// Run all tests
Future<void> _runAllTests(Map<String, dynamic> config, bool verbose, bool coverage, bool golden) async {
  print('🚀 Running all tests...\n');
  
  await _runUnitTests(config, verbose, coverage);
  await _runWidgetTests(config, verbose, coverage);
  await _runIntegrationTests(config, verbose, coverage);
  
  if (golden) {
    await _runGoldenTests(config, verbose);
  }
  
  await _runAccessibilityTests(config, verbose);
  await _runPerformanceTests(config, verbose);
  await _runCrossPlatformTests(config, verbose);
}

/// Run unit tests
Future<void> _runUnitTests(Map<String, dynamic> config, bool verbose, bool coverage) async {
  print('📝 Running unit tests...');
  
  final packages = [
    'packages/ui_tokens',
    'packages/ui_core',
    'packages/ui_controls_button',
    'packages/ui_controls_text_field',
    'packages/ui_controls_card',
  ];

  for (final package in packages) {
    print('  Testing $package...');
    final result = await Process.run(
      'flutter',
      ['test', if (coverage) '--coverage', if (verbose) '--verbose'],
      workingDirectory: package,
    );

    if (result.exitCode != 0) {
      print('❌ Unit tests failed for $package');
      print(result.stderr);
      exit(1);
    }
  }
  
  print('✅ Unit tests passed\n');
}

/// Run widget tests
Future<void> _runWidgetTests(Map<String, dynamic> config, bool verbose, bool coverage) async {
  print('🎨 Running widget tests...');
  
  final packages = [
    'packages/ui_controls_button',
    'packages/ui_controls_text_field',
    'packages/ui_controls_card',
  ];

  for (final package in packages) {
    print('  Testing $package...');
    final result = await Process.run(
      'flutter',
      ['test', if (coverage) '--coverage', if (verbose) '--verbose'],
      workingDirectory: package,
    );

    if (result.exitCode != 0) {
      print('❌ Widget tests failed for $package');
      print(result.stderr);
      exit(1);
    }
  }
  
  print('✅ Widget tests passed\n');
}

/// Run integration tests
Future<void> _runIntegrationTests(Map<String, dynamic> config, bool verbose, bool coverage) async {
  print('🔗 Running integration tests...');
  
  final result = await Process.run(
    'flutter',
    ['test', 'integration_test/', if (coverage) '--coverage', if (verbose) '--verbose'],
  );

  if (result.exitCode != 0) {
    print('❌ Integration tests failed');
    print(result.stderr);
    exit(1);
  }
  
  print('✅ Integration tests passed\n');
}

/// Run golden tests
Future<void> _runGoldenTests(Map<String, dynamic> config, bool verbose) async {
  print('🖼️  Running golden tests...');
  
  final packages = [
    'packages/ui_controls_button',
    'packages/ui_controls_text_field',
    'packages/ui_controls_card',
  ];

  for (final package in packages) {
    print('  Testing $package...');
    final result = await Process.run(
      'flutter',
      ['test', 'test/golden/', if (verbose) '--verbose'],
      workingDirectory: package,
    );

    if (result.exitCode != 0) {
      print('❌ Golden tests failed for $package');
      print(result.stderr);
      exit(1);
    }
  }
  
  print('✅ Golden tests passed\n');
}

/// Run accessibility tests
Future<void> _runAccessibilityTests(Map<String, dynamic> config, bool verbose) async {
  print('♿ Running accessibility tests...');
  
  final result = await Process.run(
    'flutter',
    ['test', 'test/accessibility/', if (verbose) '--verbose'],
  );

  if (result.exitCode != 0) {
    print('❌ Accessibility tests failed');
    print(result.stderr);
    exit(1);
  }
  
  print('✅ Accessibility tests passed\n');
}

/// Run performance tests
Future<void> _runPerformanceTests(Map<String, dynamic> config, bool verbose) async {
  print('⚡ Running performance tests...');
  
  final result = await Process.run(
    'flutter',
    ['test', 'test/performance/', if (verbose) '--verbose'],
  );

  if (result.exitCode != 0) {
    print('❌ Performance tests failed');
    print(result.stderr);
    exit(1);
  }
  
  print('✅ Performance tests passed\n');
}

/// Run cross-platform tests
Future<void> _runCrossPlatformTests(Map<String, dynamic> config, bool verbose) async {
  print('🌐 Running cross-platform tests...');
  
  final result = await Process.run(
    'flutter',
    ['test', 'test/cross_platform/', if (verbose) '--verbose'],
  );

  if (result.exitCode != 0) {
    print('❌ Cross-platform tests failed');
    print(result.stderr);
    exit(1);
  }
  
  print('✅ Cross-platform tests passed\n');
}
