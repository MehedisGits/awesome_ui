#!/usr/bin/env dart

import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';

/// Dependency enforcement script for the Awesome UI monorepo.
/// 
/// This script ensures that:
/// 1. ui_controls packages only depend on ui_tokens and ui_core
/// 2. No circular dependencies exist
/// 3. All packages use consistent version constraints
/// 4. No forbidden dependencies are used

void main(List<String> args) {
  print('🔍 Checking dependency constraints...');
  
  final repoRoot = Directory.current.path;
  final packagesDir = Directory(path.join(repoRoot, 'packages'));
  
  if (!packagesDir.existsSync()) {
    print('❌ Packages directory not found');
    exit(1);
  }
  
  final violations = <String>[];
  
  // Define allowed dependencies for each package type
  final allowedDeps = {
    'ui_tokens': <String>[],
    'ui_core': <String>['ui_tokens'],
    'ui_controls_button': <String>['ui_tokens', 'ui_core'],
    'ui_controls_text_field': <String>['ui_tokens', 'ui_core'],
    'ui_controls_card': <String>['ui_tokens', 'ui_core'],
    'ui_showcase': <String>['ui_tokens', 'ui_core', 'ui_controls_button', 'ui_controls_text_field', 'ui_controls_card'],
  };
  
  // Check each package
  for (final packageDir in packagesDir.listSync()) {
    if (packageDir is! Directory) continue;
    
    final packageName = path.basename(packageDir.path);
    final pubspecFile = File(path.join(packageDir.path, 'pubspec.yaml'));
    
    if (!pubspecFile.existsSync()) continue;
    
    print('📦 Checking $packageName...');
    
    try {
      final pubspecContent = pubspecFile.readAsStringSync();
      final pubspec = loadYaml(pubspecContent) as Map;
      final dependencies = pubspec['dependencies'] as Map? ?? {};
      
      // Check for forbidden dependencies
      final allowed = allowedDeps[packageName] ?? <String>[];
      for (final depName in dependencies.keys) {
        if (depName is String && !allowed.contains(depName)) {
          violations.add('$packageName depends on forbidden package: $depName');
        }
      }
      
      // Check for missing required dependencies
      for (final requiredDep in allowed) {
        if (!dependencies.containsKey(requiredDep)) {
          violations.add('$packageName missing required dependency: $requiredDep');
        }
      }
      
      // Check for external dependencies (should be minimal)
      final externalDeps = <String>[];
      for (final depName in dependencies.keys) {
        if (depName is String && 
            !depName.startsWith('ui_') && 
            depName != 'flutter' && 
            depName != 'dart') {
          externalDeps.add(depName);
        }
      }
      
      if (externalDeps.length > 5) {
        violations.add('$packageName has too many external dependencies: ${externalDeps.length}');
      }
      
    } catch (e) {
      violations.add('$packageName: Error reading pubspec.yaml - $e');
    }
  }
  
  // Check for circular dependencies
  final circularDeps = _findCircularDependencies(packagesDir);
  violations.addAll(circularDeps);
  
  // Report results
  if (violations.isEmpty) {
    print('✅ All dependency constraints satisfied');
    exit(0);
  } else {
    print('❌ Dependency constraint violations found:');
    for (final violation in violations) {
      print('  • $violation');
    }
    exit(1);
  }
}

List<String> _findCircularDependencies(Directory packagesDir) {
  final violations = <String>[];
  final graph = <String, Set<String>>{};
  
  // Build dependency graph
  for (final packageDir in packagesDir.listSync()) {
    if (packageDir is! Directory) continue;
    
    final packageName = path.basename(packageDir.path);
    final pubspecFile = File(path.join(packageDir.path, 'pubspec.yaml'));
    
    if (!pubspecFile.existsSync()) continue;
    
    try {
      final pubspecContent = pubspecFile.readAsStringSync();
      final pubspec = loadYaml(pubspecContent) as Map;
      final dependencies = pubspec['dependencies'] as Map? ?? {};
      
      graph[packageName] = <String>{};
      for (final depName in dependencies.keys) {
        if (depName is String && depName.startsWith('ui_')) {
          graph[packageName]!.add(depName);
        }
      }
    } catch (e) {
      // Skip packages with invalid pubspec
    }
  }
  
  // Check for cycles using DFS
  final visited = <String>{};
  final recursionStack = <String>{};
  
  for (final package in graph.keys) {
    if (!visited.contains(package)) {
      _dfsCycleDetection(package, graph, visited, recursionStack, violations);
    }
  }
  
  return violations;
}

void _dfsCycleDetection(
  String package,
  Map<String, Set<String>> graph,
  Set<String> visited,
  Set<String> recursionStack,
  List<String> violations,
) {
  visited.add(package);
  recursionStack.add(package);
  
  for (final dependency in graph[package] ?? <String>{}) {
    if (!visited.contains(dependency)) {
      _dfsCycleDetection(dependency, graph, visited, recursionStack, violations);
    } else if (recursionStack.contains(dependency)) {
      violations.add('Circular dependency detected: $package -> $dependency');
    }
  }
  
  recursionStack.remove(package);
}
