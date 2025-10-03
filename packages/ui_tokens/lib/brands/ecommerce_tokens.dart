import 'package:flutter/material.dart';
import '../tokens/colors.dart';

/// E-commerce specific design tokens.
/// 
/// Provides color schemes and design tokens optimized for e-commerce applications,
/// emphasizing conversion, trust, and shopping experience.
class EcommerceTokens {
  const EcommerceTokens._();

  /// E-commerce light theme colors
  static AppColors get light => AppColors.light.copyWith(
    // Primary - Brand color for trust and recognition
    primary: Color(0xFF7C3AED),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFEDE9FE),
    onPrimaryContainer: Color(0xFF5B21B6),
    
    // Secondary - Orange for call-to-action
    secondary: Color(0xFFF97316),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFFED7AA),
    onSecondaryContainer: Color(0xFFEA580C),
    
    // Tertiary - Green for success and positive actions
    tertiary: Color(0xFF10B981),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFD1FAE5),
    onTertiaryContainer: Color(0xFF047857),
    
    // Error - Red for errors and warnings
    error: Color(0xFFDC2626),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFEE2E2),
    onErrorContainer: Color(0xFFB91C1C),
    
    // Success - Green for successful actions
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
    
    // Surface - Clean white for product display
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
    inversePrimary: Color(0xFFA78BFA),
    
    // Surface tint
    surfaceTint: Color(0xFF7C3AED),
  );

  /// E-commerce dark theme colors
  static AppColors get dark => AppColors.dark.copyWith(
    // Primary - Lighter purple for dark mode
    primary: Color(0xFFA78BFA),
    onPrimary: Color(0xFF5B21B6),
    primaryContainer: Color(0xFF7C3AED),
    onPrimaryContainer: Color(0xFFEDE9FE),
    
    // Secondary - Lighter orange
    secondary: Color(0xFFFB923C),
    onSecondary: Color(0xFFEA580C),
    secondaryContainer: Color(0xFFF97316),
    onSecondaryContainer: Color(0xFFFED7AA),
    
    // Tertiary - Lighter green
    tertiary: Color(0xFF34D399),
    onTertiary: Color(0xFF047857),
    tertiaryContainer: Color(0xFF10B981),
    onTertiaryContainer: Color(0xFFD1FAE5),
    
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
    inversePrimary: Color(0xFF7C3AED),
    
    // Surface tint
    surfaceTint: Color(0xFFA78BFA),
  );

  /// Product category colors
  static const Map<String, Color> categoryColors = {
    'electronics': Color(0xFF3B82F6),
    'clothing': Color(0xFF8B5CF6),
    'home': Color(0xFF10B981),
    'beauty': Color(0xFFEC4899),
    'sports': Color(0xFFF59E0B),
    'books': Color(0xFF6B7280),
    'toys': Color(0xFFEF4444),
    'automotive': Color(0xFF1F2937),
  };

  /// Order status colors
  static const Map<String, Color> orderStatusColors = {
    'pending': Color(0xFFF59E0B),
    'confirmed': Color(0xFF3B82F6),
    'processing': Color(0xFF8B5CF6),
    'shipped': Color(0xFF0EA5E9),
    'delivered': Color(0xFF10B981),
    'cancelled': Color(0xFFDC2626),
    'returned': Color(0xFF6B7280),
  };

  /// Payment status colors
  static const Map<String, Color> paymentStatusColors = {
    'pending': Color(0xFFF59E0B),
    'paid': Color(0xFF10B981),
    'failed': Color(0xFFDC2626),
    'refunded': Color(0xFF6B7280),
    'partially_refunded': Color(0xFFF59E0B),
  };

  /// Product condition colors
  static const Map<String, Color> conditionColors = {
    'new': Color(0xFF10B981),
    'like_new': Color(0xFF22C55E),
    'good': Color(0xFF3B82F6),
    'fair': Color(0xFFF59E0B),
    'poor': Color(0xFFDC2626),
  };

  /// Sale type colors
  static const Map<String, Color> saleTypeColors = {
    'regular': Color(0xFF6B7280),
    'sale': Color(0xFFDC2626),
    'clearance': Color(0xFF8B5CF6),
    'flash': Color(0xFFEF4444),
    'bundle': Color(0xFF10B981),
  };

  /// Get colors for current theme
  static AppColors get colors => light;
}
