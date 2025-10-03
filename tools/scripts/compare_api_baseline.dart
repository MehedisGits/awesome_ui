#!/usr/bin/env dart

import 'dart:io';
import 'dart:convert';

/// Script to compare API baselines and detect breaking changes.
/// 
/// This script compares current API state with baseline snapshots
/// to identify breaking changes, additions, and removals.
void main(List<String> args) async {
  print('🔍 Comparing API Baselines...\n');

  final baselineDir = Directory('api_baselines');
  if (baselineDir.existsSync() == false) {
    print('❌ No baseline directory found. Run create_api_baseline.dart first.');
    exit(1);
  }

  final packages = [
    'ui_tokens',
    'ui_core',
    'ui_controls_button',
    'ui_controls_text_field',
    'ui_controls_card',
    'ui_showcase',
  ];

  bool hasBreakingChanges = false;
  bool hasChanges = false;

  for (final package in packages) {
    print('📦 Comparing $package...');
    
    try {
      final baselineFile = File('api_baselines/${package}_baseline.json');
      if (baselineFile.existsSync() == false) {
        print('⚠️  No baseline found for $package');
        continue;
      }

      final baseline = jsonDecode(await baselineFile.readAsString()) as Map<String, dynamic>;
      final current = await _createCurrentApiSnapshot(package);
      
      final comparison = _compareApiSnapshots(baseline, current);
      
      if (comparison['hasBreakingChanges'] == true) {
        hasBreakingChanges = true;
        print('🚨 Breaking changes detected in $package');
        _printBreakingChanges(comparison['breakingChanges'] as Map<String, dynamic>);
      }
      
      if (comparison['hasChanges'] == true) {
        hasChanges = true;
        print('📝 Changes detected in $package');
        _printChanges(comparison['changes'] as Map<String, dynamic>);
      }
      
      if (comparison['hasChanges'] == false) {
        print('✅ No changes in $package');
      }
      
    } catch (e) {
      print('❌ Failed to compare $package: $e');
    }
  }

  print('\n📊 Comparison Summary:');
  print('=====================');
  
  if (hasBreakingChanges) {
    print('🚨 Breaking changes detected!');
    print('   This may require a major version bump.');
  } else if (hasChanges) {
    print('📝 Non-breaking changes detected.');
    print('   This may require a minor version bump.');
  } else {
    print('✅ No changes detected.');
    print('   No version bump required.');
  }

  if (hasBreakingChanges) {
    exit(1);
  }
}

/// Create current API snapshot for a package
Future<Map<String, dynamic>> _createCurrentApiSnapshot(String package) async {
  // This is a simplified version - in practice, you'd use the same
  // analysis logic as in create_api_baseline.dart
  return {
    'package': package,
    'timestamp': DateTime.now().toIso8601String(),
    'apis': <String, dynamic>{},
  };
}

/// Compare two API snapshots
Map<String, dynamic> _compareApiSnapshots(
  Map<String, dynamic> baseline,
  Map<String, dynamic> current,
) {
  final comparison = <String, dynamic>{
    'hasBreakingChanges': false,
    'hasChanges': false,
    'breakingChanges': <String, dynamic>{},
    'changes': <String, dynamic>{},
  };

  final baselineApis = baseline['apis'] as Map<String, dynamic>;
  final currentApis = current['apis'] as Map<String, dynamic>;

  // Check for removed APIs (breaking changes)
  for (final file in baselineApis.keys) {
    if (!currentApis.containsKey(file)) {
      comparison['breakingChanges']['removedFiles'] ??= <String>[];
      comparison['breakingChanges']['removedFiles'].add(file);
      comparison['hasBreakingChanges'] = true;
    }
  }

  // Check for added APIs (non-breaking changes)
  for (final file in currentApis.keys) {
    if (!baselineApis.containsKey(file)) {
      comparison['changes']['addedFiles'] ??= <String>[];
      comparison['changes']['addedFiles'].add(file);
      comparison['hasChanges'] = true;
    }
  }

  // Check for changes in existing files
  for (final file in baselineApis.keys) {
    if (currentApis.containsKey(file)) {
      final fileChanges = _compareFileApis(
        baselineApis[file] as Map<String, dynamic>,
        currentApis[file] as Map<String, dynamic>,
      );
      
      if (fileChanges['hasBreakingChanges'] == true) {
        comparison['breakingChanges']['fileChanges'] ??= <String, dynamic>{};
        comparison['breakingChanges']['fileChanges'][file] = fileChanges['breakingChanges'];
        comparison['hasBreakingChanges'] = true;
      }
      
      if (fileChanges['hasChanges'] == true) {
        comparison['changes']['fileChanges'] ??= <String, dynamic>{};
        comparison['changes']['fileChanges'][file] = fileChanges['changes'];
        comparison['hasChanges'] = true;
      }
    }
  }

  return comparison;
}

/// Compare APIs in a single file
Map<String, dynamic> _compareFileApis(
  Map<String, dynamic> baseline,
  Map<String, dynamic> current,
) {
  final comparison = <String, dynamic>{
    'hasBreakingChanges': false,
    'hasChanges': false,
    'breakingChanges': <String, dynamic>{},
    'changes': <String, dynamic>{},
  };

  // Compare classes
  final baselineClasses = baseline['classes'] as Map<String, dynamic>? ?? {};
  final currentClasses = current['classes'] as Map<String, dynamic>? ?? {};

  for (final className in baselineClasses.keys) {
    if (!currentClasses.containsKey(className)) {
      comparison['breakingChanges']['removedClasses'] ??= <String>[];
      comparison['breakingChanges']['removedClasses'].add(className);
      comparison['hasBreakingChanges'] = true;
    } else {
      final classChanges = _compareClassApis(
        baselineClasses[className] as Map<String, dynamic>,
        currentClasses[className] as Map<String, dynamic>,
      );
      
      if (classChanges['hasBreakingChanges'] == true) {
        comparison['breakingChanges']['classChanges'] ??= <String, dynamic>{};
        comparison['breakingChanges']['classChanges'][className] = classChanges['breakingChanges'];
        comparison['hasBreakingChanges'] = true;
      }
      
      if (classChanges['hasChanges'] == true) {
        comparison['changes']['classChanges'] ??= <String, dynamic>{};
        comparison['changes']['classChanges'][className] = classChanges['changes'];
        comparison['hasChanges'] = true;
      }
    }
  }

  // Check for added classes
  for (final className in currentClasses.keys) {
    if (!baselineClasses.containsKey(className)) {
      comparison['changes']['addedClasses'] ??= <String>[];
      comparison['changes']['addedClasses'].add(className);
      comparison['hasChanges'] = true;
    }
  }

  // Compare functions
  final baselineFunctions = baseline['functions'] as Map<String, dynamic>? ?? {};
  final currentFunctions = current['functions'] as Map<String, dynamic>? ?? {};

  for (final functionName in baselineFunctions.keys) {
    if (!currentFunctions.containsKey(functionName)) {
      comparison['breakingChanges']['removedFunctions'] ??= <String>[];
      comparison['breakingChanges']['removedFunctions'].add(functionName);
      comparison['hasBreakingChanges'] = true;
    }
  }

  for (final functionName in currentFunctions.keys) {
    if (!baselineFunctions.containsKey(functionName)) {
      comparison['changes']['addedFunctions'] ??= <String>[];
      comparison['changes']['addedFunctions'].add(functionName);
      comparison['hasChanges'] = true;
    }
  }

  // Compare enums
  final baselineEnums = baseline['enums'] as Map<String, dynamic>? ?? {};
  final currentEnums = current['enums'] as Map<String, dynamic>? ?? {};

  for (final enumName in baselineEnums.keys) {
    if (!currentEnums.containsKey(enumName)) {
      comparison['breakingChanges']['removedEnums'] ??= <String>[];
      comparison['breakingChanges']['removedEnums'].add(enumName);
      comparison['hasBreakingChanges'] = true;
    } else {
      final enumChanges = _compareEnumApis(
        baselineEnums[enumName] as Map<String, dynamic>,
        currentEnums[enumName] as Map<String, dynamic>,
      );
      
      if (enumChanges['hasBreakingChanges'] == true) {
        comparison['breakingChanges']['enumChanges'] ??= <String, dynamic>{};
        comparison['breakingChanges']['enumChanges'][enumName] = enumChanges['breakingChanges'];
        comparison['hasBreakingChanges'] = true;
      }
      
      if (enumChanges['hasChanges'] == true) {
        comparison['changes']['enumChanges'] ??= <String, dynamic>{};
        comparison['changes']['enumChanges'][enumName] = enumChanges['changes'];
        comparison['hasChanges'] = true;
      }
    }
  }

  for (final enumName in currentEnums.keys) {
    if (!baselineEnums.containsKey(enumName)) {
      comparison['changes']['addedEnums'] ??= <String>[];
      comparison['changes']['addedEnums'].add(enumName);
      comparison['hasChanges'] = true;
    }
  }

  return comparison;
}

/// Compare class APIs
Map<String, dynamic> _compareClassApis(
  Map<String, dynamic> baseline,
  Map<String, dynamic> current,
) {
  final comparison = <String, dynamic>{
    'hasBreakingChanges': false,
    'hasChanges': false,
    'breakingChanges': <String, dynamic>{},
    'changes': <String, dynamic>{},
  };

  // Compare constructors
  final baselineConstructors = baseline['constructors'] as Map<String, dynamic>? ?? {};
  final currentConstructors = current['constructors'] as Map<String, dynamic>? ?? {};

  for (final constructorName in baselineConstructors.keys) {
    if (!currentConstructors.containsKey(constructorName)) {
      comparison['breakingChanges']['removedConstructors'] ??= <String>[];
      comparison['breakingChanges']['removedConstructors'].add(constructorName);
      comparison['hasBreakingChanges'] = true;
    }
  }

  for (final constructorName in currentConstructors.keys) {
    if (!baselineConstructors.containsKey(constructorName)) {
      comparison['changes']['addedConstructors'] ??= <String>[];
      comparison['changes']['addedConstructors'].add(constructorName);
      comparison['hasChanges'] = true;
    }
  }

  // Compare methods
  final baselineMethods = baseline['methods'] as Map<String, dynamic>? ?? {};
  final currentMethods = current['methods'] as Map<String, dynamic>? ?? {};

  for (final methodName in baselineMethods.keys) {
    if (!currentMethods.containsKey(methodName)) {
      comparison['breakingChanges']['removedMethods'] ??= <String>[];
      comparison['breakingChanges']['removedMethods'].add(methodName);
      comparison['hasBreakingChanges'] = true;
    }
  }

  for (final methodName in currentMethods.keys) {
    if (!baselineMethods.containsKey(methodName)) {
      comparison['changes']['addedMethods'] ??= <String>[];
      comparison['changes']['addedMethods'].add(methodName);
      comparison['hasChanges'] = true;
    }
  }

  // Compare properties
  final baselineProperties = baseline['properties'] as Map<String, dynamic>? ?? {};
  final currentProperties = current['properties'] as Map<String, dynamic>? ?? {};

  for (final propertyName in baselineProperties.keys) {
    if (!currentProperties.containsKey(propertyName)) {
      comparison['breakingChanges']['removedProperties'] ??= <String>[];
      comparison['breakingChanges']['removedProperties'].add(propertyName);
      comparison['hasBreakingChanges'] = true;
    }
  }

  for (final propertyName in currentProperties.keys) {
    if (!baselineProperties.containsKey(propertyName)) {
      comparison['changes']['addedProperties'] ??= <String>[];
      comparison['changes']['addedProperties'].add(propertyName);
      comparison['hasChanges'] = true;
    }
  }

  return comparison;
}

/// Compare enum APIs
Map<String, dynamic> _compareEnumApis(
  Map<String, dynamic> baseline,
  Map<String, dynamic> current,
) {
  final comparison = <String, dynamic>{
    'hasBreakingChanges': false,
    'hasChanges': false,
    'breakingChanges': <String, dynamic>{},
    'changes': <String, dynamic>{},
  };

  final baselineValues = baseline['values'] as List<dynamic>? ?? [];
  final currentValues = current['values'] as List<dynamic>? ?? [];

  // Check for removed enum values (breaking changes)
  for (final value in baselineValues) {
    if (!currentValues.contains(value)) {
      comparison['breakingChanges']['removedValues'] ??= <String>[];
      comparison['breakingChanges']['removedValues'].add(value.toString());
      comparison['hasBreakingChanges'] = true;
    }
  }

  // Check for added enum values (non-breaking changes)
  for (final value in currentValues) {
    if (!baselineValues.contains(value)) {
      comparison['changes']['addedValues'] ??= <String>[];
      comparison['changes']['addedValues'].add(value.toString());
      comparison['hasChanges'] = true;
    }
  }

  return comparison;
}

/// Print breaking changes
void _printBreakingChanges(Map<String, dynamic> breakingChanges) {
  if (breakingChanges.isEmpty) return;

  print('🚨 Breaking Changes:');
  
  if (breakingChanges.containsKey('removedFiles')) {
    print('  📁 Removed files:');
    for (final file in breakingChanges['removedFiles'] as List<dynamic>) {
      print('    - $file');
    }
  }
  
  if (breakingChanges.containsKey('removedClasses')) {
    print('  🏗️  Removed classes:');
    for (final className in breakingChanges['removedClasses'] as List<dynamic>) {
      print('    - $className');
    }
  }
  
  if (breakingChanges.containsKey('removedFunctions')) {
    print('  🔧 Removed functions:');
    for (final functionName in breakingChanges['removedFunctions'] as List<dynamic>) {
      print('    - $functionName');
    }
  }
  
  if (breakingChanges.containsKey('removedEnums')) {
    print('  📋 Removed enums:');
    for (final enumName in breakingChanges['removedEnums'] as List<dynamic>) {
      print('    - $enumName');
    }
  }
  
  if (breakingChanges.containsKey('removedMethods')) {
    print('  ⚙️  Removed methods:');
    for (final methodName in breakingChanges['removedMethods'] as List<dynamic>) {
      print('    - $methodName');
    }
  }
  
  if (breakingChanges.containsKey('removedProperties')) {
    print('  📊 Removed properties:');
    for (final propertyName in breakingChanges['removedProperties'] as List<dynamic>) {
      print('    - $propertyName');
    }
  }
  
  if (breakingChanges.containsKey('removedValues')) {
    print('  🔢 Removed enum values:');
    for (final value in breakingChanges['removedValues'] as List<dynamic>) {
      print('    - $value');
    }
  }
}

/// Print non-breaking changes
void _printChanges(Map<String, dynamic> changes) {
  if (changes.isEmpty) return;

  print('📝 Changes:');
  
  if (changes.containsKey('addedFiles')) {
    print('  📁 Added files:');
    for (final file in changes['addedFiles'] as List<dynamic>) {
      print('    + $file');
    }
  }
  
  if (changes.containsKey('addedClasses')) {
    print('  🏗️  Added classes:');
    for (final className in changes['addedClasses'] as List<dynamic>) {
      print('    + $className');
    }
  }
  
  if (changes.containsKey('addedFunctions')) {
    print('  🔧 Added functions:');
    for (final functionName in changes['addedFunctions'] as List<dynamic>) {
      print('    + $functionName');
    }
  }
  
  if (changes.containsKey('addedEnums')) {
    print('  📋 Added enums:');
    for (final enumName in changes['addedEnums'] as List<dynamic>) {
      print('    + $enumName');
    }
  }
  
  if (changes.containsKey('addedMethods')) {
    print('  ⚙️  Added methods:');
    for (final methodName in changes['addedMethods'] as List<dynamic>) {
      print('    + $methodName');
    }
  }
  
  if (changes.containsKey('addedProperties')) {
    print('  📊 Added properties:');
    for (final propertyName in changes['addedProperties'] as List<dynamic>) {
      print('    + $propertyName');
    }
  }
  
  if (changes.containsKey('addedValues')) {
    print('  🔢 Added enum values:');
    for (final value in changes['addedValues'] as List<dynamic>) {
      print('    + $value');
    }
  }
}
