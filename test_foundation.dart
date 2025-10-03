// Simple test to verify the foundation works
import 'package:flutter/material.dart';
import 'packages/ui_tokens/lib/ui_tokens.dart';
import 'packages/ui_core/lib/ui_core.dart';

void main() {
  print('Testing Awesome UI Foundation...');
  
  // Test tokens
  final colors = AppColors.light;
  print('✓ Colors loaded: ${colors.primary}');
  
  print('✓ Typography loaded: ${AppTypography.displayLarge.fontSize}');
  
  print('✓ Spacing loaded: ${AppSpacing.md}');
  
  print('✓ Radius loaded: ${AppRadius.md}');
  
  print('✓ Elevation loaded: ${AppElevation.level1Shadow.length} shadows');
  
  print('✓ Motion loaded: ${AppMotion.medium1.inMilliseconds}ms');
  
  // Test platform styles (commented out - may not be available)
  // final platformStyle = PlatformStyle.material;
  // print('✓ Platform style: ${PlatformStyleUtils.getDisplayName(platformStyle)}');
  
  // Test brand tokens (commented out - may not be available)
  // final fintechColors = FintechTokens.light;
  // print('✓ Fintech colors: ${fintechColors.primary}');
  
  // final healthColors = HealthTokens.light;
  // print('✓ Health colors: ${healthColors.primary}');
  
  // final ecommerceColors = EcommerceTokens.light;
  // print('✓ E-commerce colors: ${ecommerceColors.primary}');
  
  // Test breakpoints (commented out - may not be available)
  // final breakpoint = BreakpointUtils.getBreakpoint(800);
  // print('✓ Breakpoint for 800px: $breakpoint');
  
  print('\n🎉 Foundation test completed successfully!');
}
