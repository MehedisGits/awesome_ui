/// Core platform adapters and utilities for the Awesome UI component library.
/// 
/// This package provides:
/// - Platform style adapters (Material 3 ↔ Cupertino ↔ Web)
/// - Accessibility utilities and semantic helpers
/// - Responsive breakpoint utilities
/// - Base mixins for components
/// - Cross-platform theming support
library ui_core;

// Platform adapters
export 'adapters/platform_style.dart';
export 'adapters/material_adapter.dart';
export 'adapters/cupertino_adapter.dart';
export 'adapters/web_adapter.dart';

// Accessibility utilities
export 'accessibility/semantic_helpers.dart';
export 'accessibility/contrast_utils.dart';
export 'accessibility/focus_utils.dart';

// Responsive utilities
export 'responsive/breakpoint_utils.dart';
export 'responsive/responsive_builder.dart';

// Base mixins
export 'mixins/component_mixin.dart';
export 'mixins/accessibility_mixin.dart';
export 'mixins/responsive_mixin.dart';

// Theme scope
export 'theme/app_style_scope.dart';

// Performance utilities
export 'performance/performance_monitor.dart';
export 'performance/lazy_loading.dart';
export 'performance/memory_monitor.dart';
