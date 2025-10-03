/// Design tokens for the Awesome UI component library.
/// 
/// This package provides a comprehensive set of design tokens including:
/// - Color tokens with semantic naming
/// - Typography tokens with responsive scaling
/// - Spacing tokens for consistent layouts
/// - Border radius tokens for rounded corners
/// - Elevation tokens for Material 3 shadows
/// - Motion tokens for animations
/// - Brand-specific token sets
/// 
/// All tokens are designed to work seamlessly with both Material 3 and Cupertino
/// design systems, providing a unified theming experience across platforms.
library ui_tokens;

// Core token exports
export 'tokens/colors.dart';
export 'tokens/typography.dart';
export 'tokens/spacing.dart';
export 'tokens/radius.dart';
export 'tokens/elevation.dart';
export 'tokens/motion.dart';

// Brand-specific token exports
export 'brands/fintech_tokens.dart';
export 'brands/health_tokens.dart';
export 'brands/ecommerce_tokens.dart';

// Theme exports
export 'themes/light_theme.dart';
export 'themes/dark_theme.dart';
export 'themes/theme_builder.dart';
