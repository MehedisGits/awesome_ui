/// A comprehensive Flutter UI component library with 99% UI/UX coverage
/// for SaaS, CRM, E-commerce, and more.
library;

// Foundation - Centralized Systems
export 'foundation/theme.dart';
export 'foundation/colors.dart';
export 'foundation/typography.dart';
export 'foundation/spacing.dart';
export 'foundation/elevation.dart';
export 'foundation/motion.dart';
export 'foundation/responsive.dart';

// Atoms
export 'atoms/buttons/button.dart' hide AuiIconPosition;
export 'atoms/text/text.dart';
export 'atoms/icons/icon.dart' hide AuiIconPosition;
export 'atoms/chips/chip.dart';
export 'atoms/progress/progress.dart';
export 'atoms/skeleton/skeleton.dart';
export 'atoms/divider/divider.dart';
export 'atoms/tooltip/tooltip.dart';

// Molecules - Inputs
export 'molecules/inputs/text_field.dart';
export 'molecules/inputs/checkbox.dart';
export 'molecules/inputs/switch.dart';

// Molecules - Cards
export 'molecules/cards/card.dart';
export 'molecules/cards/list_tile.dart';

// Molecules - Avatars
export 'molecules/avatars/avatar.dart';

// Molecules - Empty State
export 'molecules/empty_state/empty_state.dart';

// Molecules - Stat Tile
export 'molecules/stat_tile/stat_tile.dart';

// Navigation
export 'navigation/app_bar/app_bar.dart';
export 'navigation/bottom_nav/bottom_nav.dart';
export 'navigation/tabs/tabs.dart';
export 'navigation/breadcrumbs/breadcrumbs.dart';

// Feedback
export 'feedback/dialogs/dialog.dart';
export 'feedback/sheets/bottom_sheet.dart';
export 'feedback/snackbars/snackbar.dart';

// Layout
export 'layout/grid/responsive_grid.dart';
export 'layout/masonry/masonry_grid.dart';
export 'layout/split_view/split_view.dart';
export 'layout/scaffold/safe_area_scaffold.dart';
export 'layout/sticky_headers/sticky_headers.dart';

// Data Display
export 'data_display/table/data_table.dart';
export 'data_display/timeline/timeline.dart';
export 'data_display/tree_view/tree_view.dart';

// Responsive
export 'responsive/breakpoints/responsive_breakpoints.dart' hide AuiBreakpoint;
export 'responsive/wrappers/responsive_wrapper.dart' hide AuiResponsive, AuiResponsiveValue, AuiResponsiveGrid, AuiResponsiveSpacing;
export 'responsive/utilities/responsive_utilities.dart';
export 'responsive/responsive_extensions.dart' hide AuiResponsiveContext, AuiBreakpointExtension;

// Animation & Motion
export 'animation/micro_interactions/micro_interactions.dart';
export 'animation/page_transitions/page_transitions.dart' hide AuiPageTransitionType, AuiPageTransition;
export 'animation/animations/animations.dart';
export 'animation/gestures/gesture_animations.dart';

// Accessibility
export 'accessibility/semantics/accessibility_semantics.dart' hide AuiAccessibilityUtils;
export 'accessibility/contrast/contrast_checker.dart';
export 'accessibility/utilities/accessibility_utilities.dart';
