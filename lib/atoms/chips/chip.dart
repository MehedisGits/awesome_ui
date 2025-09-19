import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Chip variants for different use cases
enum AuiChipVariant {
  filled,
  outlined,
  elevated,
  tonal,
}

/// Chip sizes
enum AuiChipSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Chip emphasis levels
enum AuiChipEmphasis {
  primary,
  secondary,
  success,
  warning,
  error,
  info,
  neutral,
}

/// Chip states
enum AuiChipState {
  enabled,
  disabled,
  selected,
  pressed,
  hovered,
  focused,
}

/// A comprehensive chip component with multiple variants and states
class AuiChip extends StatefulWidget {
  const AuiChip({
    super.key,
    required this.label,
    this.leading,
    this.trailing,
    this.onPressed,
    this.onDeleted,
    this.variant = AuiChipVariant.filled,
    this.size = AuiChipSize.md,
    this.emphasis = AuiChipEmphasis.primary,
    this.state = AuiChipState.enabled,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.tooltip,
    this.autofocus = false,
    this.focusNode,
    this.mouseCursor,
    this.clipBehavior = Clip.none,
    this.visualDensity,
    this.materialTapTargetSize,
    this.pressElevation,
    this.disabledColor,
    this.selectedColor,
    this.deleteIconColor,
    this.deleteIcon,
    this.avatar,
    this.labelStyle,
    this.side,
    this.shape,
    this.isSelected = false,
    this.selectedIcon,
    this.showCheckmark = false,
    this.checkmarkColor,
    this.canTapBody = true,
    this.tapEnabled = true,
  });

  final Widget label;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final VoidCallback? onDeleted;
  final AuiChipVariant variant;
  final AuiChipSize size;
  final AuiChipEmphasis emphasis;
  final AuiChipState state;
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final String? tooltip;
  final bool autofocus;
  final FocusNode? focusNode;
  final MouseCursor? mouseCursor;
  final Clip clipBehavior;
  final VisualDensity? visualDensity;
  final MaterialTapTargetSize? materialTapTargetSize;
  final double? pressElevation;
  final Color? disabledColor;
  final Color? selectedColor;
  final Color? deleteIconColor;
  final Widget? deleteIcon;
  final Widget? avatar;
  final TextStyle? labelStyle;
  final BorderSide? side;
  final OutlinedBorder? shape;
  final bool isSelected;
  final Widget? selectedIcon;
  final bool showCheckmark;
  final Color? checkmarkColor;
  final bool canTapBody;
  final bool tapEnabled;

  @override
  State<AuiChip> createState() => _AuiChipState();
}

class _AuiChipState extends State<AuiChip> {
  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    
    // Get chip content
    final chipContent = _buildChipContent(colors, spacing);
    
    Widget chip = ActionChip(
      onPressed: widget.onPressed,
      label: chipContent,
      avatar: widget.leading,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      mouseCursor: widget.mouseCursor,
      clipBehavior: widget.clipBehavior,
      visualDensity: widget.visualDensity,
      materialTapTargetSize: widget.materialTapTargetSize,
      pressElevation: widget.pressElevation,
      disabledColor: widget.disabledColor,
      labelStyle: widget.labelStyle,
      side: widget.side,
      shape: widget.shape,
    );
    
    if (widget.tooltip != null) {
      chip = Tooltip(
        message: widget.tooltip!,
        child: chip,
      );
    }
    
    if (widget.margin != null) {
      chip = Padding(
        padding: widget.margin!,
        child: chip,
      );
    }
    
    return chip;
  }
  
  /// Build chip content
  Widget _buildChipContent(AuiColorScheme colors, AuiSpacingScheme spacing) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.leading != null) ...[
          widget.leading!,
          SizedBox(width: spacing.xs),
        ],
        widget.label,
        if (widget.trailing != null) ...[
          SizedBox(width: spacing.xs),
          widget.trailing!,
        ],
      ],
    );
  }
  
}

/// Filter chip component
class AuiFilterChip extends AuiChip {
  const AuiFilterChip({
    super.key,
    required super.label,
    super.leading,
    super.trailing,
    super.onPressed,
    super.variant = AuiChipVariant.filled,
    super.size = AuiChipSize.md,
    super.emphasis = AuiChipEmphasis.primary,
    super.state = AuiChipState.enabled,
    super.color,
    super.backgroundColor,
    super.borderColor,
    super.borderRadius,
    super.padding,
    super.margin,
    super.elevation,
    super.shadowColor,
    super.surfaceTintColor,
    super.semanticLabel,
    super.tooltip,
    super.autofocus = false,
    super.focusNode,
    super.mouseCursor,
    super.clipBehavior = Clip.none,
    super.visualDensity,
    super.materialTapTargetSize,
    super.pressElevation,
    super.disabledColor,
    super.selectedColor,
    super.deleteIconColor,
    super.deleteIcon,
    super.avatar,
    super.labelStyle,
    super.side,
    super.shape,
    super.isSelected = false,
    super.selectedIcon,
    super.showCheckmark = false,
    super.checkmarkColor,
    super.canTapBody = true,
    super.tapEnabled = true,
  });
}

/// Choice chip component
class AuiChoiceChip extends AuiChip {
  const AuiChoiceChip({
    super.key,
    required super.label,
    super.leading,
    super.trailing,
    super.onPressed,
    super.variant = AuiChipVariant.filled,
    super.size = AuiChipSize.md,
    super.emphasis = AuiChipEmphasis.primary,
    super.state = AuiChipState.enabled,
    super.color,
    super.backgroundColor,
    super.borderColor,
    super.borderRadius,
    super.padding,
    super.margin,
    super.elevation,
    super.shadowColor,
    super.surfaceTintColor,
    super.semanticLabel,
    super.tooltip,
    super.autofocus = false,
    super.focusNode,
    super.mouseCursor,
    super.clipBehavior = Clip.none,
    super.visualDensity,
    super.materialTapTargetSize,
    super.pressElevation,
    super.disabledColor,
    super.selectedColor,
    super.deleteIconColor,
    super.deleteIcon,
    super.avatar,
    super.labelStyle,
    super.side,
    super.shape,
    super.isSelected = false,
    super.selectedIcon,
    super.showCheckmark = false,
    super.checkmarkColor,
    super.canTapBody = true,
    super.tapEnabled = true,
  });
}

/// Input chip component
class AuiInputChip extends AuiChip {
  const AuiInputChip({
    super.key,
    required super.label,
    super.leading,
    super.trailing,
    super.onPressed,
    super.onDeleted,
    super.variant = AuiChipVariant.filled,
    super.size = AuiChipSize.md,
    super.emphasis = AuiChipEmphasis.primary,
    super.state = AuiChipState.enabled,
    super.color,
    super.backgroundColor,
    super.borderColor,
    super.borderRadius,
    super.padding,
    super.margin,
    super.elevation,
    super.shadowColor,
    super.surfaceTintColor,
    super.semanticLabel,
    super.tooltip,
    super.autofocus = false,
    super.focusNode,
    super.mouseCursor,
    super.clipBehavior = Clip.none,
    super.visualDensity,
    super.materialTapTargetSize,
    super.pressElevation,
    super.disabledColor,
    super.selectedColor,
    super.deleteIconColor,
    super.deleteIcon,
    super.avatar,
    super.labelStyle,
    super.side,
    super.shape,
    super.isSelected = false,
    super.selectedIcon,
    super.showCheckmark = false,
    super.checkmarkColor,
    super.canTapBody = true,
    super.tapEnabled = true,
  });
}

/// Chip utilities
class AuiChipUtils {
  const AuiChipUtils._();
  
  /// Get chip size from enum
  static double getChipSize(AuiChipSize size) {
    switch (size) {
      case AuiChipSize.xs:
        return 24.0;
      case AuiChipSize.sm:
        return 28.0;
      case AuiChipSize.md:
        return 32.0;
      case AuiChipSize.lg:
        return 36.0;
      case AuiChipSize.xl:
        return 40.0;
    }
  }
  
  /// Get chip padding
  static EdgeInsets getChipPadding(AuiChipSize size, AuiSpacingScheme spacing) {
    switch (size) {
      case AuiChipSize.xs:
        return EdgeInsets.symmetric(horizontal: spacing.xs, vertical: spacing.micro);
      case AuiChipSize.sm:
        return EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.nano);
      case AuiChipSize.md:
        return EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.xs);
      case AuiChipSize.lg:
        return EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.sm);
      case AuiChipSize.xl:
        return EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.sm);
    }
  }
  
  /// Get chip border radius
  static double getChipBorderRadius(AuiChipSize size, AuiSpacingScheme spacing) {
    switch (size) {
      case AuiChipSize.xs:
        return spacing.xs;
      case AuiChipSize.sm:
        return spacing.sm;
      case AuiChipSize.md:
        return spacing.sm;
      case AuiChipSize.lg:
        return spacing.md;
      case AuiChipSize.xl:
        return spacing.md;
    }
  }
}
