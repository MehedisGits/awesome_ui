import 'package:flutter/material.dart';
import '../tokens/colors.dart';

/// Fintech-specific design tokens.
/// 
/// Provides color schemes and design tokens optimized for financial applications,
/// emphasizing trust, security, and professional appearance.
class FintechTokens {
  const FintechTokens._();

  /// Fintech light theme colors
  static AppColors get light => AppColors.light.copyWith(
    // Primary - Deep blue for trust and professionalism
    primary: Color(0xFF1E3A8A),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFDBEAFE),
    onPrimaryContainer: Color(0xFF1E40AF),
    
    // Secondary - Green for positive financial indicators
    secondary: Color(0xFF059669),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD1FAE5),
    onSecondaryContainer: Color(0xFF047857),
    
    // Tertiary - Gold for premium features
    tertiary: Color(0xFFD97706),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFEF3C7),
    onTertiaryContainer: Color(0xFFB45309),
    
    // Error - Red for financial alerts
    error: Color(0xFFDC2626),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFEE2E2),
    onErrorContainer: Color(0xFFB91C1C),
    
    // Success - Green for successful transactions
    success: Color(0xFF10B981),
    onSuccess: Color(0xFFFFFFFF),
    successContainer: Color(0xFFD1FAE5),
    onSuccessContainer: Color(0xFF047857),
    
    // Warning - Amber for caution
    warning: Color(0xFFF59E0B),
    onWarning: Color(0xFFFFFFFF),
    warningContainer: Color(0xFFFEF3C7),
    onWarningContainer: Color(0xFFD97706),
    
    // Info - Blue for information
    info: Color(0xFF3B82F6),
    onInfo: Color(0xFFFFFFFF),
    infoContainer: Color(0xFFDBEAFE),
    onInfoContainer: Color(0xFF1E40AF),
    
    // Surface - Clean white for readability
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF1F2937),
    surfaceVariant: Color(0xFFF9FAFB),
    onSurfaceVariant: Color(0xFF6B7280),
    
    // Outline - Subtle borders
    outline: Color(0xFFD1D5DB),
    outlineVariant: Color(0xFFE5E7EB),
    
    // Shadow and scrim
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    
    // Inverse
    inverseSurface: Color(0xFF1F2937),
    onInverseSurface: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF3B82F6),
    
    // Surface tint
    surfaceTint: Color(0xFF1E3A8A),
  );

  /// Fintech dark theme colors
  static AppColors get dark => AppColors.dark.copyWith(
    // Primary - Lighter blue for dark mode
    primary: Color(0xFF60A5FA),
    onPrimary: Color(0xFF1E3A8A),
    primaryContainer: Color(0xFF1E40AF),
    onPrimaryContainer: Color(0xFFDBEAFE),
    
    // Secondary - Lighter green
    secondary: Color(0xFF34D399),
    onSecondary: Color(0xFF047857),
    secondaryContainer: Color(0xFF059669),
    onSecondaryContainer: Color(0xFFD1FAE5),
    
    // Tertiary - Lighter gold
    tertiary: Color(0xFFFBBF24),
    onTertiary: Color(0xFFB45309),
    tertiaryContainer: Color(0xFFD97706),
    onTertiaryContainer: Color(0xFFFEF3C7),
    
    // Error - Lighter red
    error: Color(0xFFF87171),
    onError: Color(0xFFB91C1C),
    errorContainer: Color(0xFFDC2626),
    onErrorContainer: Color(0xFFFEE2E2),
    
    // Success - Lighter green
    success: Color(0xFF34D399),
    onSuccess: Color(0xFF047857),
    successContainer: Color(0xFF10B981),
    onSuccessContainer: Color(0xFFD1FAE5),
    
    // Warning - Lighter amber
    warning: Color(0xFFFBBF24),
    onWarning: Color(0xFFD97706),
    warningContainer: Color(0xFFF59E0B),
    onWarningContainer: Color(0xFFFEF3C7),
    
    // Info - Lighter blue
    info: Color(0xFF60A5FA),
    onInfo: Color(0xFF1E40AF),
    infoContainer: Color(0xFF3B82F6),
    onInfoContainer: Color(0xFFDBEAFE),
    
    // Surface - Dark gray for dark mode
    surface: Color(0xFF111827),
    onSurface: Color(0xFFF9FAFB),
    surfaceVariant: Color(0xFF1F2937),
    onSurfaceVariant: Color(0xFF9CA3AF),
    
    // Outline - Subtle borders
    outline: Color(0xFF374151),
    outlineVariant: Color(0xFF4B5563),
    
    // Shadow and scrim
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    
    // Inverse
    inverseSurface: Color(0xFFF9FAFB),
    onInverseSurface: Color(0xFF111827),
    inversePrimary: Color(0xFF1E3A8A),
    
    // Surface tint
    surfaceTint: Color(0xFF60A5FA),
  );

  /// Financial status colors
  static const Map<String, Color> statusColors = {
    'profit': Color(0xFF10B981),
    'loss': Color(0xFFDC2626),
    'neutral': Color(0xFF6B7280),
    'pending': Color(0xFFF59E0B),
    'completed': Color(0xFF10B981),
    'failed': Color(0xFFDC2626),
    'cancelled': Color(0xFF6B7280),
  };

  /// Account type colors
  static const Map<String, Color> accountColors = {
    'checking': Color(0xFF3B82F6),
    'savings': Color(0xFF10B981),
    'credit': Color(0xFFDC2626),
    'investment': Color(0xFF8B5CF6),
    'loan': Color(0xFFF59E0B),
  };

  /// Transaction type colors
  static const Map<String, Color> transactionColors = {
    'deposit': Color(0xFF10B981),
    'withdrawal': Color(0xFFDC2626),
    'transfer': Color(0xFF3B82F6),
    'payment': Color(0xFF8B5CF6),
    'refund': Color(0xFF10B981),
    'fee': Color(0xFFF59E0B),
  };

  /// Get colors for current theme
  static AppColors get colors => light;
}
