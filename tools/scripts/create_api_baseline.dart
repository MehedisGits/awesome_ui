#!/usr/bin/env dart

import 'dart:io';
import 'dart:convert';
// import 'dart:mirrors'; // Disabled as mirrors are not available in all environments

/// Script to create API baseline snapshots for the Awesome UI library.
/// 
/// This script analyzes all public APIs in the library and creates
/// baseline snapshots that can be used to detect breaking changes.
void main(List<String> args) async {
  print('📊 Creating API Baseline Snapshots...\n');

  final packages = [
    'packages/ui_tokens',
    'packages/ui_core',
    'packages/ui_controls_button',
    'packages/ui_controls_text_field',
    'packages/ui_controls_card',
    'packages/ui_showcase',
  ];

  final baselineDir = Directory('api_baselines');
  if (baselineDir.existsSync() == false) {
    baselineDir.createSync(recursive: true);
  }

  for (final package in packages) {
    print('📦 Analyzing $package...');
    
    try {
      final baseline = await _createPackageBaseline(package);
      final baselineFile = File('api_baselines/${package.split('/').last}_baseline.json');
      await baselineFile.writeAsString(jsonEncode(baseline));
      
      print('✅ Created baseline for $package');
    } catch (e) {
      print('❌ Failed to create baseline for $package: $e');
    }
  }

  print('\n🎉 API baseline snapshots created successfully!');
  print('📁 Baselines saved to: api_baselines/');
}

/// Create API baseline for a package
Future<Map<String, dynamic>> _createPackageBaseline(String packagePath) async {
  final packageName = packagePath.split('/').last;
  final libDir = Directory('$packagePath/lib');
  
  if (libDir.existsSync() == false) {
    throw Exception('Library directory not found: $libDir');
  }

  final baseline = <String, dynamic>{
    'package': packageName,
    'timestamp': DateTime.now().toIso8601String(),
    'version': await _getPackageVersion(packagePath),
    'apis': <String, dynamic>{},
  };

  // Analyze all Dart files in the lib directory
  await for (final entity in libDir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      final relativePath = entity.path.substring('$packagePath/lib/'.length);
      final apiInfo = await _analyzeDartFile(entity, relativePath);
      
      if (apiInfo.isNotEmpty) {
        baseline['apis'][relativePath] = apiInfo;
      }
    }
  }

  return baseline;
}

/// Get package version from pubspec.yaml
Future<String> _getPackageVersion(String packagePath) async {
  try {
    final pubspecFile = File('$packagePath/pubspec.yaml');
    final content = await pubspecFile.readAsString();
    
    for (final line in content.split('\n')) {
      if (line.startsWith('version:')) {
        return line.split(':')[1].trim();
      }
    }
    
    return 'unknown';
  } catch (e) {
    return 'unknown';
  }
}

/// Analyze a Dart file for public APIs
Future<Map<String, dynamic>> _analyzeDartFile(File file, String relativePath) async {
  final content = await file.readAsString();
  final lines = content.split('\n');
  
  final apiInfo = <String, dynamic>{
    'classes': <String, dynamic>{},
    'functions': <String, dynamic>{},
    'enums': <String, dynamic>{},
    'mixins': <String, dynamic>{},
    'typedefs': <String, dynamic>{},
    'constants': <String, dynamic>{},
  };

  for (int i = 0; i < lines.length; i++) {
    final line = lines[i].trim();
    
    // Skip comments and empty lines
    if (line.isEmpty || line.startsWith('//') || line.startsWith('/*')) {
      continue;
    }

    // Analyze class definitions
    if (line.startsWith('class ') && line.contains('_') == false) {
      final className = _extractClassName(line);
      if (className != null) {
        apiInfo['classes'][className] = _analyzeClass(lines, i);
      }
    }

    // Analyze function definitions
    if (line.startsWith('void ') || line.startsWith('Future<') || 
        line.startsWith('Widget ') || line.startsWith('String ') ||
        line.startsWith('int ') || line.startsWith('double ') ||
        line.startsWith('bool ') || line.startsWith('Color ') ||
        line.startsWith('Duration ') || line.startsWith('EdgeInsets ') ||
        line.startsWith('TextStyle ') || line.startsWith('BorderRadius ') ||
        line.startsWith('BoxShadow ') || line.startsWith('Curve ') ||
        line.startsWith('AnimationController ') || line.startsWith('Animation<')) {
      
      if (!line.contains('_') && !line.contains('(')) {
        final functionName = _extractFunctionName(line);
        if (functionName != null) {
          apiInfo['functions'][functionName] = _analyzeFunction(lines, i);
        }
      }
    }

    // Analyze enum definitions
    if (line.startsWith('enum ') && !line.contains('_')) {
      final enumName = _extractEnumName(line);
      if (enumName != null) {
        apiInfo['enums'][enumName] = _analyzeEnum(lines, i);
      }
    }

    // Analyze mixin definitions
    if (line.startsWith('mixin ') && !line.contains('_')) {
      final mixinName = _extractMixinName(line);
      if (mixinName != null) {
        apiInfo['mixins'][mixinName] = _analyzeMixin(lines, i);
      }
    }

    // Analyze typedef definitions
    if (line.startsWith('typedef ') && !line.contains('_')) {
      final typedefName = _extractTypedefName(line);
      if (typedefName != null) {
        apiInfo['typedefs'][typedefName] = _analyzeTypedef(lines, i);
      }
    }

    // Analyze constant definitions
    if (line.startsWith('static const ') && !line.contains('_')) {
      final constantName = _extractConstantName(line);
      if (constantName != null) {
        apiInfo['constants'][constantName] = _analyzeConstant(lines, i);
      }
    }
  }

  // Remove empty sections
  apiInfo.removeWhere((key, value) => (value as Map).isEmpty);

  return apiInfo;
}

/// Extract class name from class definition
String? _extractClassName(String line) {
  final match = RegExp(r'class\s+(\w+)').firstMatch(line);
  return match?.group(1);
}

/// Extract function name from function definition
String? _extractFunctionName(String line) {
  final match = RegExp(r'(\w+)\s*\(').firstMatch(line);
  return match?.group(1);
}

/// Extract enum name from enum definition
String? _extractEnumName(String line) {
  final match = RegExp(r'enum\s+(\w+)').firstMatch(line);
  return match?.group(1);
}

/// Extract mixin name from mixin definition
String? _extractMixinName(String line) {
  final match = RegExp(r'mixin\s+(\w+)').firstMatch(line);
  return match?.group(1);
}

/// Extract typedef name from typedef definition
String? _extractTypedefName(String line) {
  final match = RegExp(r'typedef\s+(\w+)').firstMatch(line);
  return match?.group(1);
}

/// Extract constant name from constant definition
String? _extractConstantName(String line) {
  final match = RegExp(r'static\s+const\s+(\w+)').firstMatch(line);
  return match?.group(1);
}

/// Analyze a class definition
Map<String, dynamic> _analyzeClass(List<String> lines, int startIndex) {
  final classInfo = <String, dynamic>{
    'constructors': <String, dynamic>{},
    'methods': <String, dynamic>{},
    'properties': <String, dynamic>{},
    'isAbstract': false,
    'isFinal': false,
  };

  // Check if abstract or final
  final classLine = lines[startIndex];
  classInfo['isAbstract'] = classLine.contains('abstract');
  classInfo['isFinal'] = classLine.contains('final');

  // Analyze class content
  int braceCount = 0;
  bool inClass = false;
  
  for (int i = startIndex; i < lines.length; i++) {
    final line = lines[i].trim();
    
    if (line.contains('{')) {
      braceCount++;
      inClass = true;
    }
    
    if (line.contains('}')) {
      braceCount--;
      if (braceCount == 0 && inClass) {
        break;
      }
    }
    
    if (inClass && !line.startsWith('//') && !line.isEmpty) {
      // Analyze constructors
      if (line.contains('(') && !line.contains('=') && !line.contains(':')) {
        final constructorName = _extractConstructorName(line);
        if (constructorName != null) {
          classInfo['constructors'][constructorName] = _analyzeConstructor(lines, i);
        }
      }
      
      // Analyze methods
      if ((line.startsWith('void ') || line.startsWith('Future<') || 
           line.startsWith('Widget ') || line.startsWith('String ') ||
           line.startsWith('int ') || line.startsWith('double ') ||
           line.startsWith('bool ') || line.startsWith('Color ') ||
           line.startsWith('Duration ') || line.startsWith('EdgeInsets ') ||
           line.startsWith('TextStyle ') || line.startsWith('BorderRadius ') ||
           line.startsWith('BoxShadow ') || line.startsWith('Curve ') ||
           line.startsWith('AnimationController ') || line.startsWith('Animation<')) &&
          line.contains('(') && !line.contains('=') && !line.contains(':')) {
        
        final methodName = _extractMethodName(line);
        if (methodName != null) {
          classInfo['methods'][methodName] = _analyzeMethod(lines, i);
        }
      }
      
      // Analyze properties
      if (line.startsWith('final ') || line.startsWith('static final ') ||
          line.startsWith('static const ')) {
        final propertyName = _extractPropertyName(line);
        if (propertyName != null) {
          classInfo['properties'][propertyName] = _analyzeProperty(lines, i);
        }
      }
    }
  }

  return classInfo;
}

/// Extract constructor name
String? _extractConstructorName(String line) {
  final match = RegExp(r'(\w+)\s*\(').firstMatch(line);
  return match?.group(1);
}

/// Extract method name
String? _extractMethodName(String line) {
  final match = RegExp(r'(\w+)\s*\(').firstMatch(line);
  return match?.group(1);
}

/// Extract property name
String? _extractPropertyName(String line) {
  final match = RegExp(r'(?:final|static\s+(?:final|const))\s+(\w+)').firstMatch(line);
  return match?.group(1);
}

/// Analyze constructor
Map<String, dynamic> _analyzeConstructor(List<String> lines, int index) {
  return {
    'parameters': _extractParameters(lines[index]),
    'isPrivate': lines[index].contains('_'),
  };
}

/// Analyze method
Map<String, dynamic> _analyzeMethod(List<String> lines, int index) {
  return {
    'parameters': _extractParameters(lines[index]),
    'isPrivate': lines[index].contains('_'),
    'isStatic': lines[index].contains('static'),
    'isAsync': lines[index].contains('async'),
  };
}

/// Analyze property
Map<String, dynamic> _analyzeProperty(List<String> lines, int index) {
  return {
    'type': _extractPropertyType(lines[index]),
    'isPrivate': lines[index].contains('_'),
    'isStatic': lines[index].contains('static'),
    'isConst': lines[index].contains('const'),
  };
}

/// Analyze function
Map<String, dynamic> _analyzeFunction(List<String> lines, int index) {
  return {
    'parameters': _extractParameters(lines[index]),
    'isPrivate': lines[index].contains('_'),
    'isAsync': lines[index].contains('async'),
  };
}

/// Analyze enum
Map<String, dynamic> _analyzeEnum(List<String> lines, int index) {
  final enumInfo = <String, dynamic>{
    'values': <String>[],
  };

  // Extract enum values
  int braceCount = 0;
  bool inEnum = false;
  
  for (int i = index; i < lines.length; i++) {
    final line = lines[i].trim();
    
    if (line.contains('{')) {
      braceCount++;
      inEnum = true;
    }
    
    if (line.contains('}')) {
      braceCount--;
      if (braceCount == 0 && inEnum) {
        break;
      }
    }
    
    if (inEnum && line.contains(',')) {
      final value = line.split(',')[0].trim();
      if (value.isNotEmpty) {
        enumInfo['values'].add(value);
      }
    }
  }

  return enumInfo;
}

/// Analyze mixin
Map<String, dynamic> _analyzeMixin(List<String> lines, int index) {
  return {
    'methods': <String, dynamic>{},
    'properties': <String, dynamic>{},
  };
}

/// Analyze typedef
Map<String, dynamic> _analyzeTypedef(List<String> lines, int index) {
  return {
    'definition': lines[index],
  };
}

/// Analyze constant
Map<String, dynamic> _analyzeConstant(List<String> lines, int index) {
  return {
    'type': _extractPropertyType(lines[index]),
    'value': _extractConstantValue(lines[index]),
  };
}

/// Extract parameters from function/method signature
List<Map<String, dynamic>> _extractParameters(String line) {
  final parameters = <Map<String, dynamic>>[];
  
  // Simple parameter extraction (this is a simplified version)
  final paramMatch = RegExp(r'\(([^)]*)\)').firstMatch(line);
  if (paramMatch != null) {
    final paramString = paramMatch.group(1);
    if (paramString != null && paramString.isNotEmpty) {
      final paramList = paramString.split(',');
      for (final param in paramList) {
        final trimmed = param.trim();
        if (trimmed.isNotEmpty) {
          parameters.add({
            'name': _extractParameterName(trimmed),
            'type': _extractParameterType(trimmed),
            'isRequired': trimmed.contains('required'),
            'isOptional': trimmed.contains('?'),
          });
        }
      }
    }
  }
  
  return parameters;
}

/// Extract parameter name
String? _extractParameterName(String param) {
  final match = RegExp(r'(\w+)(?:\s*[=,])').firstMatch(param);
  return match?.group(1);
}

/// Extract parameter type
String? _extractParameterType(String param) {
  final match = RegExp(r'(\w+(?:<[^>]*>)?)\s+\w+').firstMatch(param);
  return match?.group(1);
}

/// Extract property type
String? _extractPropertyType(String line) {
  final match = RegExp(r'(?:final|static\s+(?:final|const))\s+(\w+(?:<[^>]*>)?)').firstMatch(line);
  return match?.group(1);
}

/// Extract constant value
String? _extractConstantValue(String line) {
  final match = RegExp(r'=\s*(.+?)(?:\s*;|\s*$)').firstMatch(line);
  return match?.group(1);
}
