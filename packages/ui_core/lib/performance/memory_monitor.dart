import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';

/// Memory usage monitoring utilities for the Awesome UI library.
class MemoryMonitor {
  static final MemoryMonitor _instance = MemoryMonitor._internal();
  factory MemoryMonitor() => _instance;
  MemoryMonitor._internal();

  final List<MemorySnapshot> _snapshots = [];
  Timer? _monitoringTimer;
  bool _isMonitoring = false;
  
  int _maxSnapshots = 100;
  Duration _monitoringInterval = const Duration(seconds: 5);
  int _memoryThreshold = 100 * 1024 * 1024; // 100MB
  int _criticalThreshold = 200 * 1024 * 1024; // 200MB

  /// Memory snapshot data
  List<MemorySnapshot> get snapshots => List.unmodifiable(_snapshots);
  
  /// Get current memory usage
  MemorySnapshot get currentSnapshot => MemorySnapshot.now();
  
  /// Get memory trend
  MemoryTrend get memoryTrend {
    if (_snapshots.length < 2) return MemoryTrend.stable;
    
    final recent = _snapshots.length > 5 ? _snapshots.sublist(_snapshots.length - 5) : _snapshots;
    final first = recent.first.total;
    final last = recent.last.total;
    
    if (last > first * 1.1) return MemoryTrend.increasing;
    if (last < first * 0.9) return MemoryTrend.decreasing;
    return MemoryTrend.stable;
  }
  
  /// Check if memory usage is critical
  bool get isCritical => currentSnapshot.total > _criticalThreshold;
  
  /// Check if memory usage is high
  bool get isHigh => currentSnapshot.total > _memoryThreshold;
  
  /// Get memory usage report
  Map<String, dynamic> getReport() {
    final current = currentSnapshot;
    final trend = memoryTrend;
    
    return {
      'current': {
        'rss': current.rss,
        'heap': current.heap,
        'external': current.external,
        'total': current.total,
        'rssMB': current.rssMB,
        'heapMB': current.heapMB,
        'externalMB': current.externalMB,
        'totalMB': current.totalMB,
      },
      'trend': trend.toString().split('.').last,
      'status': {
        'acceptable': !isHigh,
        'critical': isCritical,
        'monitoring': _isMonitoring,
      },
      'snapshots': _snapshots.length,
      'thresholds': {
        'memory': _memoryThreshold,
        'critical': _criticalThreshold,
      },
    };
  }
  
  /// Print memory report
  void printReport() {
    final report = getReport();
    final current = report['current'] as Map<String, dynamic>;
    
    print('=== Memory Usage Report ===');
    print('RSS: ${current['rssMB']?.toStringAsFixed(2)} MB');
    print('Heap: ${current['heapMB']?.toStringAsFixed(2)} MB');
    print('External: ${current['externalMB']?.toStringAsFixed(2)} MB');
    print('Total: ${current['totalMB']?.toStringAsFixed(2)} MB');
    print('Trend: ${report['trend']}');
    print('Snapshots: ${report['snapshots']}');
    
    final status = report['status'] as Map<String, dynamic>;
    print('Acceptable: ${status['acceptable']}');
    print('Critical: ${status['critical']}');
    print('Monitoring: ${status['monitoring']}');
  }
  
  /// Start monitoring memory usage
  void startMonitoring({
    Duration? interval,
    int? maxSnapshots,
    int? memoryThreshold,
    int? criticalThreshold,
  }) {
    if (_isMonitoring) return;

    _monitoringInterval = interval ?? _monitoringInterval;
    _maxSnapshots = maxSnapshots ?? _maxSnapshots;
    _memoryThreshold = memoryThreshold ?? _memoryThreshold;
    _criticalThreshold = criticalThreshold ?? _criticalThreshold;

    _isMonitoring = true;
    _monitoringTimer = Timer.periodic(_monitoringInterval, (_) {
      _takeSnapshot();
    });
  }

  /// Stop monitoring memory usage
  void stopMonitoring() {
    _isMonitoring = false;
    _monitoringTimer?.cancel();
    _monitoringTimer = null;
  }

  /// Take a memory snapshot
  MemorySnapshot _takeSnapshot() {
    final snapshot = MemorySnapshot.now();
    _snapshots.add(snapshot);

    // Keep only recent snapshots
    if (_snapshots.length > _maxSnapshots) {
      _snapshots.removeAt(0);
    }

    // Check for memory issues
    _checkMemoryUsage(snapshot);

    return snapshot;
  }

  /// Check memory usage and trigger warnings if needed
  void _checkMemoryUsage(MemorySnapshot snapshot) {
    if (snapshot.total > _criticalThreshold) {
      if (kDebugMode) {
        print('⚠️ CRITICAL: Memory usage is ${snapshot.totalMB.toStringAsFixed(2)} MB');
      }
    } else if (snapshot.total > _memoryThreshold) {
      if (kDebugMode) {
        print('⚠️ WARNING: Memory usage is ${snapshot.totalMB.toStringAsFixed(2)} MB');
      }
    }
  }
}

/// Memory snapshot class
class MemorySnapshot {
  final DateTime timestamp;
  final int rss;
  final int heap;
  final int external;
  final int total;

  const MemorySnapshot({
    required this.timestamp,
    required this.rss,
    required this.heap,
    required this.external,
    required this.total,
  });

  /// Create a snapshot from current memory usage
  factory MemorySnapshot.now() {
    final info = ProcessInfo.currentRss;
    return MemorySnapshot(
      timestamp: DateTime.now(),
      rss: info,
      heap: 0, // Not available in Flutter
      external: 0, // Not available in Flutter
      total: info,
    );
  }

  /// Get memory usage in MB
  double get rssMB => rss / 1024 / 1024;
  double get heapMB => heap / 1024 / 1024;
  double get externalMB => external / 1024 / 1024;
  double get totalMB => total / 1024 / 1024;
}

/// Memory trend enumeration
enum MemoryTrend {
  increasing,
  stable,
  decreasing,
}