import 'package:flutter/material.dart';

/// Elevation system for awesome_ui
/// 
/// Provides a consistent elevation scale with shadow definitions,
/// z-index values, and elevation utilities.
class AuiElevation {
  const AuiElevation._();
  
  // Elevation levels (z-index values)
  static const double level0 = 0.0;
  static const double level1 = 1.0;
  static const double level2 = 2.0;
  static const double level3 = 3.0;
  static const double level4 = 4.0;
  static const double level5 = 5.0;
  static const double level6 = 6.0;
  static const double level7 = 7.0;
  static const double level8 = 8.0;
  static const double level9 = 9.0;
  static const double level10 = 10.0;
  static const double level11 = 11.0;
  static const double level12 = 12.0;
  static const double level13 = 13.0;
  static const double level14 = 14.0;
  static const double level15 = 15.0;
  static const double level16 = 16.0;
  static const double level17 = 17.0;
  static const double level18 = 18.0;
  static const double level19 = 19.0;
  static const double level20 = 20.0;
  static const double level21 = 21.0;
  static const double level22 = 22.0;
  static const double level23 = 23.0;
  static const double level24 = 24.0;
}

/// Shadow definitions for different elevation levels
class AuiShadows {
  const AuiShadows._();
  
  // Level 0 - No shadow
  static const List<BoxShadow> level0 = [];
  
  // Level 1 - Subtle shadow
  static const List<BoxShadow> level1 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
  ];
  
  // Level 2 - Small shadow
  static const List<BoxShadow> level2 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 1),
      blurRadius: 5,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 2),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];
  
  // Level 3 - Medium shadow
  static const List<BoxShadow> level3 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 1),
      blurRadius: 8,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 3),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];
  
  // Level 4 - Large shadow
  static const List<BoxShadow> level4 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 2),
      blurRadius: 10,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 4),
      blurRadius: 5,
      spreadRadius: 0,
    ),
  ];
  
  // Level 5 - Extra large shadow
  static const List<BoxShadow> level5 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 3),
      blurRadius: 14,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 6),
      blurRadius: 6,
      spreadRadius: 0,
    ),
  ];
  
  // Level 6 - Huge shadow
  static const List<BoxShadow> level6 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 4),
      blurRadius: 18,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 8),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];
  
  // Level 7 - Massive shadow
  static const List<BoxShadow> level7 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 5),
      blurRadius: 22,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 10),
      blurRadius: 10,
      spreadRadius: 0,
    ),
  ];
  
  // Level 8 - Colossal shadow
  static const List<BoxShadow> level8 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 6),
      blurRadius: 26,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 12),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];
  
  // Level 9 - Gigantic shadow
  static const List<BoxShadow> level9 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 7),
      blurRadius: 30,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 14),
      blurRadius: 14,
      spreadRadius: 0,
    ),
  ];
  
  // Level 10 - Enormous shadow
  static const List<BoxShadow> level10 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 8),
      blurRadius: 34,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 16),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ];
  
  // Level 11 - Immense shadow
  static const List<BoxShadow> level11 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 9),
      blurRadius: 38,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 18),
      blurRadius: 18,
      spreadRadius: 0,
    ),
  ];
  
  // Level 12 - Tremendous shadow
  static const List<BoxShadow> level12 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 10),
      blurRadius: 42,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 20),
      blurRadius: 20,
      spreadRadius: 0,
    ),
  ];
  
  // Level 13 - Prodigious shadow
  static const List<BoxShadow> level13 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 11),
      blurRadius: 46,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 22),
      blurRadius: 22,
      spreadRadius: 0,
    ),
  ];
  
  // Level 14 - Stupendous shadow
  static const List<BoxShadow> level14 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 12),
      blurRadius: 50,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 24),
      blurRadius: 24,
      spreadRadius: 0,
    ),
  ];
  
  // Level 15 - Phenomenal shadow
  static const List<BoxShadow> level15 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 13),
      blurRadius: 54,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 26),
      blurRadius: 26,
      spreadRadius: 0,
    ),
  ];
  
  // Level 16 - Extraordinary shadow
  static const List<BoxShadow> level16 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 14),
      blurRadius: 58,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 28),
      blurRadius: 28,
      spreadRadius: 0,
    ),
  ];
  
  // Level 17 - Remarkable shadow
  static const List<BoxShadow> level17 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 15),
      blurRadius: 62,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 30),
      blurRadius: 30,
      spreadRadius: 0,
    ),
  ];
  
  // Level 18 - Outstanding shadow
  static const List<BoxShadow> level18 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 16),
      blurRadius: 66,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 32),
      blurRadius: 32,
      spreadRadius: 0,
    ),
  ];
  
  // Level 19 - Exceptional shadow
  static const List<BoxShadow> level19 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 17),
      blurRadius: 70,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 34),
      blurRadius: 34,
      spreadRadius: 0,
    ),
  ];
  
  // Level 20 - Incredible shadow
  static const List<BoxShadow> level20 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 18),
      blurRadius: 74,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 36),
      blurRadius: 36,
      spreadRadius: 0,
    ),
  ];
  
  // Level 21 - Amazing shadow
  static const List<BoxShadow> level21 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 19),
      blurRadius: 78,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 38),
      blurRadius: 38,
      spreadRadius: 0,
    ),
  ];
  
  // Level 22 - Fantastic shadow
  static const List<BoxShadow> level22 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 20),
      blurRadius: 82,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 40),
      blurRadius: 40,
      spreadRadius: 0,
    ),
  ];
  
  // Level 23 - Magnificent shadow
  static const List<BoxShadow> level23 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 21),
      blurRadius: 86,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 42),
      blurRadius: 42,
      spreadRadius: 0,
    ),
  ];
  
  // Level 24 - Spectacular shadow
  static const List<BoxShadow> level24 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 22),
      blurRadius: 90,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 44),
      blurRadius: 44,
      spreadRadius: 0,
    ),
  ];
}

/// Elevation utilities
class AuiElevationUtils {
  const AuiElevationUtils._();
  
  /// Get shadow for elevation level
  static List<BoxShadow> getShadow(double elevation) {
    if (elevation <= 0) return AuiShadows.level0;
    if (elevation <= 1) return AuiShadows.level1;
    if (elevation <= 2) return AuiShadows.level2;
    if (elevation <= 3) return AuiShadows.level3;
    if (elevation <= 4) return AuiShadows.level4;
    if (elevation <= 5) return AuiShadows.level5;
    if (elevation <= 6) return AuiShadows.level6;
    if (elevation <= 7) return AuiShadows.level7;
    if (elevation <= 8) return AuiShadows.level8;
    if (elevation <= 9) return AuiShadows.level9;
    if (elevation <= 10) return AuiShadows.level10;
    if (elevation <= 11) return AuiShadows.level11;
    if (elevation <= 12) return AuiShadows.level12;
    if (elevation <= 13) return AuiShadows.level13;
    if (elevation <= 14) return AuiShadows.level14;
    if (elevation <= 15) return AuiShadows.level15;
    if (elevation <= 16) return AuiShadows.level16;
    if (elevation <= 17) return AuiShadows.level17;
    if (elevation <= 18) return AuiShadows.level18;
    if (elevation <= 19) return AuiShadows.level19;
    if (elevation <= 20) return AuiShadows.level20;
    if (elevation <= 21) return AuiShadows.level21;
    if (elevation <= 22) return AuiShadows.level22;
    if (elevation <= 23) return AuiShadows.level23;
    return AuiShadows.level24;
  }
  
  /// Get elevation for different component types
  static double getComponentElevation(ComponentType type) {
    switch (type) {
      case ComponentType.card:
        return AuiElevation.level1;
      case ComponentType.dialog:
        return AuiElevation.level3;
      case ComponentType.sheet:
        return AuiElevation.level2;
      case ComponentType.appBar:
        return AuiElevation.level1;
      case ComponentType.fab:
        return AuiElevation.level3;
      case ComponentType.snackbar:
        return AuiElevation.level2;
      case ComponentType.tooltip:
        return AuiElevation.level1;
      case ComponentType.menu:
        return AuiElevation.level2;
      case ComponentType.dropdown:
        return AuiElevation.level2;
      case ComponentType.modal:
        return AuiElevation.level4;
    }
  }
  
  /// Get elevation for different states
  static double getStateElevation(ComponentState state) {
    switch (state) {
      case ComponentState.disabled:
        return AuiElevation.level0;
      case ComponentState.enabled:
        return AuiElevation.level1;
      case ComponentState.hovered:
        return AuiElevation.level2;
      case ComponentState.focused:
        return AuiElevation.level2;
      case ComponentState.pressed:
        return AuiElevation.level1;
      case ComponentState.selected:
        return AuiElevation.level2;
      case ComponentState.active:
        return AuiElevation.level3;
    }
  }
}

/// Component types for elevation
enum ComponentType {
  card,
  dialog,
  sheet,
  appBar,
  fab,
  snackbar,
  tooltip,
  menu,
  dropdown,
  modal,
}

/// Component states for elevation
enum ComponentState {
  disabled,
  enabled,
  hovered,
  focused,
  pressed,
  selected,
  active,
}

/// Elevation constants for common use cases
class AuiElevationConstants {
  const AuiElevationConstants._();
  
  // Card elevations
  static const double cardElevation = AuiElevation.level1;
  static const double cardHoverElevation = AuiElevation.level2;
  static const double cardSelectedElevation = AuiElevation.level2;
  
  // Dialog elevations
  static const double dialogElevation = AuiElevation.level3;
  static const double modalElevation = AuiElevation.level4;
  
  // Sheet elevations
  static const double bottomSheetElevation = AuiElevation.level2;
  static const double sideSheetElevation = AuiElevation.level2;
  
  // App bar elevations
  static const double appBarElevation = AuiElevation.level1;
  static const double appBarScrolledElevation = AuiElevation.level2;
  
  // FAB elevations
  static const double fabElevation = AuiElevation.level3;
  static const double fabHoverElevation = AuiElevation.level4;
  static const double fabPressedElevation = AuiElevation.level2;
  
  // Snackbar elevations
  static const double snackbarElevation = AuiElevation.level2;
  
  // Tooltip elevations
  static const double tooltipElevation = AuiElevation.level1;
  
  // Menu elevations
  static const double menuElevation = AuiElevation.level2;
  static const double dropdownElevation = AuiElevation.level2;
  
  // Input elevations
  static const double inputElevation = AuiElevation.level0;
  static const double inputFocusedElevation = AuiElevation.level1;
  
  // Button elevations
  static const double buttonElevation = AuiElevation.level0;
  static const double buttonHoverElevation = AuiElevation.level1;
  static const double buttonPressedElevation = AuiElevation.level0;
  static const double buttonSelectedElevation = AuiElevation.level1;
}

/// Elevation extensions
extension AuiElevationExtension on double {
  /// Get shadow for this elevation level
  List<BoxShadow> get shadow => AuiElevationUtils.getShadow(this);
  
  /// Get elevation for component type
  double getComponentElevation(ComponentType type) {
    return AuiElevationUtils.getComponentElevation(type);
  }
  
  /// Get elevation for component state
  double getStateElevation(ComponentState state) {
    return AuiElevationUtils.getStateElevation(state);
  }
}
