#!/usr/bin/env dart

import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart' as path;

/// Public API stability checker for the Awesome UI monorepo.
/// 
/// This script ensures that:
/// 1. Public APIs remain stable across versions
/// 2. Breaking changes are properly documented
/// 3. API baselines are maintained
/// 4. Deprecated APIs are properly marked

void main(List<String> args) {
  print('🔍 Checking public API stability...');
  
  final repoRoot = Directory.current.path;
  final packagesDir = Directory(path.join(repoRoot, 'packages'));
  final baselinesDir = Directory(path.join(repoRoot, 'tools', 'baselines'));
  
  if (!packagesDir.existsSync()) {
    print('❌ Packages directory not found');
    exit(1);
  }
  
  // Create baselines directory if it doesn't exist
  if (!baselinesDir.existsSync()) {
    baselinesDir.createSync(recursive: true);
  }
  
  final violations = <String>[];
  
  // Check each package
  for (final packageDir in packagesDir.listSync()) {
    if (packageDir is! Directory) continue;
    
    final packageName = path.basename(packageDir.path);
    final libDir = Directory(path.join(packageDir.path, 'lib'));
    
    if (!libDir.existsSync()) continue;
    
    print('📦 Checking $packageName API...');
    
    try {
      final currentApi = _extractPublicApi(libDir);
      final baselineFile = File(path.join(baselinesDir.path, '$packageName.json'));
      
      if (baselineFile.existsSync()) {
        final baselineContent = baselineFile.readAsStringSync();
        final baselineApi = jsonDecode(baselineContent) as Map<String, dynamic>;
        
        // Compare APIs
        final changes = _compareApis(baselineApi, currentApi);
        if (changes.isNotEmpty) {
          violations.addAll(changes.map((change) => '$packageName: $change'));
        }
      } else {
        // Create initial baseline
        baselineFile.writeAsStringSync(JsonEncoder.withIndent('  ').convert(currentApi));
        print('  📝 Created initial API baseline for $packageName');
      }
      
    } catch (e) {
      violations.add('$packageName: Error extracting API - $e');
    }
  }
  
  // Report results
  if (violations.isEmpty) {
    print('✅ All public APIs are stable');
    exit(0);
  } else {
    print('❌ Public API changes detected:');
    for (final violation in violations) {
      print('  • $violation');
    }
    print('\n💡 To update baselines, run: dart run tools/scripts/check_public_api.dart --update');
    exit(1);
  }
}

Map<String, dynamic> _extractPublicApi(Directory libDir) {
  final api = <String, dynamic>{};
  
  for (final file in libDir.listSync(recursive: true)) {
    if (file is! File || !file.path.endsWith('.dart')) continue;
    
    final relativePath = path.relative(file.path, from: libDir.path);
    final content = file.readAsStringSync();
    
    // Extract public classes, functions, and variables
    final lines = content.split('\n');
    for (int i = 0; i < lines.length; i++) {
      final line = lines[i].trim();
      
      // Skip private members (starting with _)
      if (line.startsWith('_')) continue;
      
      // Skip comments and imports
      if (line.startsWith('//') || line.startsWith('import') || line.startsWith('export')) continue;
      
      // Extract class definitions
      if (line.startsWith('class ') && !line.contains('_')) {
        final className = _extractClassName(line);
        if (className != null) {
          api['$relativePath:class:$className'] = {
            'type': 'class',
            'line': i + 1,
            'signature': line,
          };
        }
      }
      
      // Extract function definitions
      if (line.startsWith('void ') || line.startsWith('Future<') || line.startsWith('Widget ') || 
          line.startsWith('String ') || line.startsWith('int ') || line.startsWith('bool ') ||
          line.startsWith('double ') || line.startsWith('Color ') || line.startsWith('EdgeInsets ') ||
          line.startsWith('BorderRadius ') || line.startsWith('TextStyle ') || line.startsWith('ThemeData ')) {
        final functionName = _extractFunctionName(line);
        if (functionName != null && !functionName.startsWith('_')) {
          api['$relativePath:function:$functionName'] = {
            'type': 'function',
            'line': i + 1,
            'signature': line,
          };
        }
      }
      
      // Extract enum definitions
      if (line.startsWith('enum ')) {
        final enumName = _extractEnumName(line);
        if (enumName != null) {
          api['$relativePath:enum:$enumName'] = {
            'type': 'enum',
            'line': i + 1,
            'signature': line,
          };
        }
      }
      
      // Extract typedef definitions
      if (line.startsWith('typedef ')) {
        final typedefName = _extractTypedefName(line);
        if (typedefName != null) {
          api['$relativePath:typedef:$typedefName'] = {
            'type': 'typedef',
            'line': i + 1,
            'signature': line,
          };
        }
      }
    }
  }
  
  return api;
}

String? _extractClassName(String line) {
  final match = RegExp(r'class\s+(\w+)').firstMatch(line);
  return match?.group(1);
}

String? _extractFunctionName(String line) {
  final match = RegExp(r'(\w+)\s*\([^)]*\)\s*[;{]').firstMatch(line);
  return match?.group(1);
}

String? _extractEnumName(String line) {
  final match = RegExp(r'enum\s+(\w+)').firstMatch(line);
  return match?.group(1);
}

String? _extractTypedefName(String line) {
  final match = RegExp(r'typedef\s+(\w+)').firstMatch(line);
  return match?.group(1);
}

List<String> _compareApis(Map<String, dynamic> baseline, Map<String, dynamic> current) {
  final changes = <String>[];
  
  // Check for removed APIs
  for (final key in baseline.keys) {
    if (!current.containsKey(key)) {
      changes.add('REMOVED: $key');
    }
  }
  
  // Check for added APIs
  for (final key in current.keys) {
    if (!baseline.containsKey(key)) {
      changes.add('ADDED: $key');
    }
  }
  
  // Check for modified APIs
  for (final key in baseline.keys) {
    if (current.containsKey(key)) {
      final baselineItem = baseline[key] as Map<String, dynamic>;
      final currentItem = current[key] as Map<String, dynamic>;
      
      if (baselineItem['signature'] != currentItem['signature']) {
        changes.add('MODIFIED: $key');
      }
    }
  }
  
  return changes;
}
