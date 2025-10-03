import 'package:flutter/material.dart';
import '../tokens/colors.dart';

/// Health and fitness-specific design tokens.
/// 
/// Provides color schemes and design tokens optimized for health and fitness applications,
/// emphasizing wellness, vitality, and medical professionalism.
class HealthTokens {
  const HealthTokens._();

  /// Health light theme colors
  static AppColors get light => AppColors.light.copyWith(
    // Primary - Medical blue for trust and professionalism
    primary: Color(0xFF2563EB),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFDBEAFE),
    onPrimaryContainer: Color(0xFF1E40AF),
    
    // Secondary - Health green for vitality
    secondary: Color(0xFF16A34A),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFDCFCE7),
    onSecondaryContainer: Color(0xFF15803D),
    
    // Tertiary - Orange for energy and activity
    tertiary: Color(0xFFEA580C),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFED7AA),
    onTertiaryContainer: Color(0xFFC2410C),
    
    // Error - Red for medical alerts
    error: Color(0xFFDC2626),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFEE2E2),
    onErrorContainer: Color(0xFFB91C1C),
    
    // Success - Green for healthy status
    success: Color(0xFF16A34A),
    onSuccess: Color(0xFFFFFFFF),
    successContainer: Color(0xFFDCFCE7),
    onSuccessContainer: Color(0xFF15803D),
    
    // Warning - Amber for caution
    warning: Color(0xFFF59E0B),
    onWarning: Color(0xFFFFFFFF),
    warningContainer: Color(0xFFFEF3C7),
    onWarningContainer: Color(0xFFD97706),
    
    // Info - Blue for information
    info: Color(0xFF0EA5E9),
    onInfo: Color(0xFFFFFFFF),
    infoContainer: Color(0xFFE0F2FE),
    onInfoContainer: Color(0xFF0284C7),
    
    // Surface - Clean white for medical clarity
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF1F2937),
    surfaceVariant: Color(0xFFF8FAFC),
    onSurfaceVariant: Color(0xFF64748B),
    
    // Outline - Subtle borders
    outline: Color(0xFFCBD5E1),
    outlineVariant: Color(0xFFE2E8F0),
    
    // Shadow and scrim
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    
    // Inverse
    inverseSurface: Color(0xFF1F2937),
    onInverseSurface: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF60A5FA),
    
    // Surface tint
    surfaceTint: Color(0xFF2563EB),
  );

  /// Health dark theme colors
  static AppColors get dark => AppColors.dark.copyWith(
    // Primary - Lighter blue for dark mode
    primary: Color(0xFF60A5FA),
    onPrimary: Color(0xFF1E40AF),
    primaryContainer: Color(0xFF1E40AF),
    onPrimaryContainer: Color(0xFFDBEAFE),
    
    // Secondary - Lighter green
    secondary: Color(0xFF4ADE80),
    onSecondary: Color(0xFF15803D),
    secondaryContainer: Color(0xFF16A34A),
    onSecondaryContainer: Color(0xFFDCFCE7),
    
    // Tertiary - Lighter orange
    tertiary: Color(0xFFFB923C),
    onTertiary: Color(0xFFC2410C),
    tertiaryContainer: Color(0xFFEA580C),
    onTertiaryContainer: Color(0xFFFED7AA),
    
    // Error - Lighter red
    error: Color(0xFFF87171),
    onError: Color(0xFFB91C1C),
    errorContainer: Color(0xFFDC2626),
    onErrorContainer: Color(0xFFFEE2E2),
    
    // Success - Lighter green
    success: Color(0xFF4ADE80),
    onSuccess: Color(0xFF15803D),
    successContainer: Color(0xFF16A34A),
    onSuccessContainer: Color(0xFFDCFCE7),
    
    // Warning - Lighter amber
    warning: Color(0xFFFBBF24),
    onWarning: Color(0xFFD97706),
    warningContainer: Color(0xFFF59E0B),
    onWarningContainer: Color(0xFFFEF3C7),
    
    // Info - Lighter blue
    info: Color(0xFF38BDF8),
    onInfo: Color(0xFF0284C7),
    infoContainer: Color(0xFF0EA5E9),
    onInfoContainer: Color(0xFFE0F2FE),
    
    // Surface - Dark gray for dark mode
    surface: Color(0xFF0F172A),
    onSurface: Color(0xFFF8FAFC),
    surfaceVariant: Color(0xFF1E293B),
    onSurfaceVariant: Color(0xFF94A3B8),
    
    // Outline - Subtle borders
    outline: Color(0xFF334155),
    outlineVariant: Color(0xFF475569),
    
    // Shadow and scrim
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    
    // Inverse
    inverseSurface: Color(0xFFF8FAFC),
    onInverseSurface: Color(0xFF0F172A),
    inversePrimary: Color(0xFF2563EB),
    
    // Surface tint
    surfaceTint: Color(0xFF60A5FA),
  );

  /// Health status colors
  static const Map<String, Color> statusColors = {
    'excellent': Color(0xFF16A34A),
    'good': Color(0xFF22C55E),
    'fair': Color(0xFFF59E0B),
    'poor': Color(0xFFEF4444),
    'critical': Color(0xFFDC2626),
    'unknown': Color(0xFF6B7280),
  };

  /// Vital signs colors
  static const Map<String, Color> vitalColors = {
    'heart_rate': Color(0xFFDC2626),
    'blood_pressure': Color(0xFF2563EB),
    'temperature': Color(0xFFEA580C),
    'oxygen_saturation': Color(0xFF0EA5E9),
    'respiratory_rate': Color(0xFF16A34A),
    'weight': Color(0xFF8B5CF6),
    'height': Color(0xFF059669),
  };

  /// Activity type colors
  static const Map<String, Color> activityColors = {
    'cardio': Color(0xFFDC2626),
    'strength': Color(0xFF8B5CF6),
    'flexibility': Color(0xFF0EA5E9),
    'balance': Color(0xFF16A34A),
    'endurance': Color(0xFFEA580C),
    'recovery': Color(0xFF6B7280),
  };

  /// Medical urgency colors
  static const Map<String, Color> urgencyColors = {
    'emergency': Color(0xFFDC2626),
    'urgent': Color(0xFFEA580C),
    'normal': Color(0xFF16A34A),
    'routine': Color(0xFF2563EB),
    'scheduled': Color(0xFF6B7280),
  };

  /// Get colors for current theme
  static AppColors get colors => light;
}
