import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Performance monitoring utilities for the Awesome UI library.
class PerformanceMonitor {
  static final PerformanceMonitor _instance = PerformanceMonitor._internal();
  factory PerformanceMonitor() => _instance;
  PerformanceMonitor._internal();

  final Map<String, Stopwatch> _timers = {};
  final Map<String, List<Duration>> _measurements = {};
  final Map<String, int> _memorySnapshots = {};
  
  bool _isEnabled = kDebugMode;
  Duration _maxMeasurementTime = const Duration(seconds: 5);
  int _maxMemoryUsage = 100 * 1024 * 1024; // 100MB

  /// Enable or disable performance monitoring
  void setEnabled(bool enabled) {
    _isEnabled = enabled;
  }

  /// Set maximum measurement time
  void setMaxMeasurementTime(Duration duration) {
    _maxMeasurementTime = duration;
  }

  /// Set maximum memory usage threshold
  void setMaxMemoryUsage(int bytes) {
    _maxMemoryUsage = bytes;
  }

  /// Start timing a performance measurement
  void startTimer(String key) {
    if (!_isEnabled) return;
    
    _timers[key] = Stopwatch()..start();
  }

  /// Stop timing and record the measurement
  Duration? stopTimer(String key) {
    if (!_isEnabled) return null;
    
    final timer = _timers.remove(key);
    if (timer == null) return null;
    
    timer.stop();
    final duration = timer.elapsed;
    
    _measurements.putIfAbsent(key, () => []).add(duration);
    
    // Keep only recent measurements
    final measurements = _measurements[key]!;
    if (measurements.length > 100) {
      measurements.removeAt(0);
    }
    
    return duration;
  }

  /// Measure memory usage
  int measureMemoryUsage() {
    if (!_isEnabled) return 0;
    
    final memory = ProcessInfo.currentRss;
    _memorySnapshots[DateTime.now().millisecondsSinceEpoch.toString()] = memory;
    
    // Keep only recent snapshots
    if (_memorySnapshots.length > 50) {
      final oldestKey = _memorySnapshots.keys.first;
      _memorySnapshots.remove(oldestKey);
    }
    
    return memory;
  }

  /// Get average duration for a measurement key
  Duration? getAverageDuration(String key) {
    final measurements = _measurements[key];
    if (measurements == null || measurements.isEmpty) return null;
    
    final total = measurements.fold<Duration>(
      Duration.zero,
      (sum, duration) => sum + duration,
    );
    
    return Duration(
      microseconds: total.inMicroseconds ~/ measurements.length,
    );
  }

  /// Get maximum duration for a measurement key
  Duration? getMaxDuration(String key) {
    final measurements = _measurements[key];
    if (measurements == null || measurements.isEmpty) return null;
    
    return measurements.reduce((a, b) => a > b ? a : b);
  }

  /// Get minimum duration for a measurement key
  Duration? getMinDuration(String key) {
    final measurements = _measurements[key];
    if (measurements == null || measurements.isEmpty) return null;
    
    return measurements.reduce((a, b) => a < b ? a : b);
  }

  /// Get current memory usage
  int getCurrentMemoryUsage() {
    return ProcessInfo.currentRss;
  }

  /// Get average memory usage
  int getAverageMemoryUsage() {
    if (_memorySnapshots.isEmpty) return 0;
    
    final total = _memorySnapshots.values.fold<int>(0, (sum, usage) => sum + usage);
    return total ~/ _memorySnapshots.length;
  }

  /// Get maximum memory usage
  int getMaxMemoryUsage() {
    if (_memorySnapshots.isEmpty) return 0;
    
    return _memorySnapshots.values.reduce((a, b) => a > b ? a : b);
  }

  /// Check if performance is within acceptable limits
  bool isPerformanceAcceptable(String key) {
    final average = getAverageDuration(key);
    if (average == null) return true;
    
    return average <= _maxMeasurementTime;
  }

  /// Check if memory usage is within acceptable limits
  bool isMemoryUsageAcceptable() {
    return getCurrentMemoryUsage() <= _maxMemoryUsage;
  }

  /// Get performance report
  Map<String, dynamic> getPerformanceReport() {
    final report = <String, dynamic>{};
    
    for (final key in _measurements.keys) {
      final measurements = _measurements[key]!;
      if (measurements.isEmpty) continue;
      
      report[key] = {
        'count': measurements.length,
        'average': getAverageDuration(key)?.inMilliseconds,
        'min': getMinDuration(key)?.inMilliseconds,
        'max': getMaxDuration(key)?.inMilliseconds,
        'acceptable': isPerformanceAcceptable(key),
      };
    }
    
    report['memory'] = {
      'current': getCurrentMemoryUsage(),
      'average': getAverageMemoryUsage(),
      'max': getMaxMemoryUsage(),
      'acceptable': isMemoryUsageAcceptable(),
    };
    
    return report;
  }

  /// Clear all measurements
  void clearMeasurements() {
    _timers.clear();
    _measurements.clear();
    _memorySnapshots.clear();
  }

  /// Print performance report to console
  void printPerformanceReport() {
    if (!_isEnabled) return;
    
    final report = getPerformanceReport();
    print('📊 Performance Report:');
    print('====================');
    
    for (final entry in report.entries) {
      if (entry.key == 'memory') continue;
      
      final data = entry.value as Map<String, dynamic>;
      print('${entry.key}:');
      print('  Count: ${data['count']}');
      print('  Average: ${data['average']}ms');
      print('  Min: ${data['min']}ms');
      print('  Max: ${data['max']}ms');
      print('  Acceptable: ${data['acceptable']}');
      print('');
    }
    
    final memory = report['memory'] as Map<String, dynamic>;
    print('Memory:');
    print('  Current: ${(memory['current'] as int) ~/ 1024 ~/ 1024}MB');
    print('  Average: ${(memory['average'] as int) ~/ 1024 ~/ 1024}MB');
    print('  Max: ${(memory['max'] as int) ~/ 1024 ~/ 1024}MB');
    print('  Acceptable: ${memory['acceptable']}');
  }
}

/// Performance monitoring widget
class PerformanceMonitorWidget extends StatefulWidget {
  final Widget child;
  final bool enabled;
  final Duration updateInterval;
  final VoidCallback? onPerformanceIssue;

  const PerformanceMonitorWidget({
    super.key,
    required this.child,
    this.enabled = true,
    this.updateInterval = const Duration(seconds: 1),
    this.onPerformanceIssue,
  });

  @override
  State<PerformanceMonitorWidget> createState() => _PerformanceMonitorWidgetState();
}

class _PerformanceMonitorWidgetState extends State<PerformanceMonitorWidget> {
  Timer? _timer;
  final PerformanceMonitor _monitor = PerformanceMonitor();

  @override
  void initState() {
    super.initState();
    if (widget.enabled) {
      _startMonitoring();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startMonitoring() {
    _timer = Timer.periodic(widget.updateInterval, (_) {
      _monitor.measureMemoryUsage();
      
      if (!_monitor.isMemoryUsageAcceptable()) {
        widget.onPerformanceIssue?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

/// Performance measurement mixin
mixin PerformanceMeasurementMixin<T extends StatefulWidget> on State<T> {
  final PerformanceMonitor _monitor = PerformanceMonitor();

  /// Measure widget build time
  void measureBuildTime(String key, VoidCallback buildFunction) {
    _monitor.startTimer('build_$key');
    buildFunction();
    _monitor.stopTimer('build_$key');
  }

  /// Measure widget render time
  void measureRenderTime(String key, VoidCallback renderFunction) {
    _monitor.startTimer('render_$key');
    renderFunction();
    _monitor.stopTimer('render_$key');
  }

  /// Measure animation time
  void measureAnimationTime(String key, VoidCallback animationFunction) {
    _monitor.startTimer('animation_$key');
    animationFunction();
    _monitor.stopTimer('animation_$key');
  }

  /// Get performance report
  Map<String, dynamic> getPerformanceReport() {
    return _monitor.getPerformanceReport();
  }

  /// Print performance report
  void printPerformanceReport() {
    _monitor.printPerformanceReport();
  }
}
