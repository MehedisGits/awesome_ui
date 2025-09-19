import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../foundation/theme.dart';

/// Tree view variants
enum AuiTreeViewVariant {
  filled,
  outlined,
  elevated,
  tonal,
  minimal,
}

/// Tree view sizes
enum AuiTreeViewSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Tree view states
enum AuiTreeViewState {
  enabled,
  disabled,
  loading,
  error,
}

/// Tree view node configuration
class AuiTreeViewNode {
  const AuiTreeViewNode({
    required this.content,
    this.children = const [],
    this.expanded = false,
    this.selected = false,
    this.disabled = false,
    this.icon,
    this.expandedIcon,
    this.collapsedIcon,
    this.selectedIcon,
    this.disabledIcon,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderRadius,
    this.border,
    this.elevation,
    this.shadowColor,
    this.padding,
    this.margin,
    this.semanticLabel,
    this.tooltip,
    this.data,
    this.key,
  });

  final Widget content;
  final List<AuiTreeViewNode> children;
  final bool expanded;
  final bool selected;
  final bool disabled;
  final Widget? icon;
  final Widget? expandedIcon;
  final Widget? collapsedIcon;
  final Widget? selectedIcon;
  final Widget? disabledIcon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? elevation;
  final Color? shadowColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String? semanticLabel;
  final String? tooltip;
  final dynamic data;
  final Key? key;
}

/// A comprehensive tree view component
class AuiTreeView extends StatefulWidget {
  const AuiTreeView({
    super.key,
    required this.children,
    this.variant = AuiTreeViewVariant.outlined,
    this.size = AuiTreeViewSize.md,
    this.state = AuiTreeViewState.enabled,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.tooltip,
    this.showIcons = true,
    this.showExpandCollapse = true,
    this.showSelection = true,
    this.showCheckboxes = false,
    this.animate = true,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.indentSize = 24.0,
    this.lineThickness = 1.0,
    this.lineColor,
    this.lineStyle = AuiTreeViewLineStyle.solid,
    this.physics,
    this.shrinkWrap = false,
    this.reverse = false,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.primary = false,
    this.cacheExtent,
    this.semanticChildCount,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.none,
    this.anchor = 0.0,
    this.center,
    this.scrollBehavior,
    this.onNodeTap,
    this.onNodeDoubleTap,
    this.onNodeLongPress,
    this.onNodeExpand,
    this.onNodeCollapse,
    this.onNodeSelect,
    this.onNodeDeselect,
    this.onSelectionChanged,
    this.constraints,
    this.gradient,
    this.border,
    this.shape,
  });

  final List<AuiTreeViewNode> children;
  final AuiTreeViewVariant variant;
  final AuiTreeViewSize size;
  final AuiTreeViewState state;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final String? tooltip;
  final bool showIcons;
  final bool showExpandCollapse;
  final bool showSelection;
  final bool showCheckboxes;
  final bool animate;
  final Duration animationDuration;
  final Curve animationCurve;
  final double indentSize;
  final double lineThickness;
  final Color? lineColor;
  final AuiTreeViewLineStyle lineStyle;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool reverse;
  final Axis scrollDirection;
  final ScrollController? controller;
  final bool primary;
  final double? cacheExtent;
  final int? semanticChildCount;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final double anchor;
  final Key? center;
  final ScrollBehavior? scrollBehavior;
  final ValueChanged<AuiTreeViewNode>? onNodeTap;
  final ValueChanged<AuiTreeViewNode>? onNodeDoubleTap;
  final ValueChanged<AuiTreeViewNode>? onNodeLongPress;
  final ValueChanged<AuiTreeViewNode>? onNodeExpand;
  final ValueChanged<AuiTreeViewNode>? onNodeCollapse;
  final ValueChanged<AuiTreeViewNode>? onNodeSelect;
  final ValueChanged<AuiTreeViewNode>? onNodeDeselect;
  final ValueChanged<List<AuiTreeViewNode>>? onSelectionChanged;
  final BoxConstraints? constraints;
  final Gradient? gradient;
  final Border? border;
  final ShapeBorder? shape;

  @override
  State<AuiTreeView> createState() => _AuiTreeViewState();
}

class _AuiTreeViewState extends State<AuiTreeView> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _animation;
  final Set<AuiTreeViewNode> _selectedNodes = {};
  final Set<AuiTreeViewNode> _expandedNodes = {};

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve,
    );
    
    _initializeNodes();
    _animationController.forward();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _scrollController.dispose();
    }
    _animationController.dispose();
    super.dispose();
  }

  void _initializeNodes() {
    for (final node in widget.children) {
      if (node.expanded) {
        _expandedNodes.add(node);
      }
      if (node.selected) {
        _selectedNodes.add(node);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get tree view colors
    final treeViewBackgroundColor = _getTreeViewBackgroundColor(colors);
    final treeViewForegroundColor = _getTreeViewForegroundColor(colors);
    final treeViewBorderColor = _getTreeViewBorderColor(colors);
    
    // Get tree view elevation
    final treeViewElevation = _getTreeViewElevation(elevation);
    
    // Get tree view border radius
    final treeViewBorderRadius = _getTreeViewBorderRadius(spacing);
    
    // Get tree view padding
    final treeViewPadding = _getTreeViewPadding(spacing);
    
    // Build tree view
    final treeView = _buildTreeView(colors, spacing, treeViewBackgroundColor!, treeViewForegroundColor, treeViewBorderColor, treeViewElevation, treeViewBorderRadius, treeViewPadding);
    
    Widget treeViewWidget = Container(
      constraints: widget.constraints,
      padding: treeViewPadding,
      decoration: BoxDecoration(
        color: treeViewBackgroundColor,
        borderRadius: treeViewBorderRadius,
        border: treeViewBorderColor != null 
            ? Border.all(color: treeViewBorderColor, width: 1.0)
            : null,
        gradient: widget.gradient,
        boxShadow: _getTreeViewShadows(colors, treeViewElevation),
      ),
      clipBehavior: widget.clipBehavior,
      child: treeView,
    );
    
    // Add margin
    if (widget.margin != null) {
      treeViewWidget = Padding(
        padding: widget.margin!,
        child: treeViewWidget,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      treeViewWidget = Semantics(
        label: widget.semanticLabel,
        child: treeViewWidget,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      treeViewWidget = Tooltip(
        message: widget.tooltip!,
        child: treeViewWidget,
      );
    }
    
    return treeViewWidget;
  }
  
  /// Build tree view
  Widget _buildTreeView(
    AuiColorScheme colors,
    AuiSpacingScheme spacing,
    Color backgroundColor,
    Color foregroundColor,
    Color? borderColor,
    double elevation,
    BorderRadius? borderRadius,
    EdgeInsets padding,
  ) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: ListView.builder(
            controller: _scrollController,
            physics: widget.physics,
            shrinkWrap: widget.shrinkWrap,
            reverse: widget.reverse,
            scrollDirection: widget.scrollDirection,
            primary: widget.primary,
            cacheExtent: widget.cacheExtent,
            semanticChildCount: widget.semanticChildCount,
            keyboardDismissBehavior: widget.keyboardDismissBehavior,
            restorationId: widget.restorationId,
            clipBehavior: widget.clipBehavior,
            itemCount: _getTotalNodeCount(),
            itemBuilder: (context, index) {
              return _buildTreeNode(index, colors, spacing, 0);
            },
          ),
        );
      },
    );
  }
  
  /// Build tree node
  Widget _buildTreeNode(int index, AuiColorScheme colors, AuiSpacingScheme spacing, int level) {
    final node = _getNodeAtIndex(index);
    if (node == null) return const SizedBox.shrink();
    
    final isExpanded = _expandedNodes.contains(node);
    final isSelected = _selectedNodes.contains(node);
    final hasChildren = node.children.isNotEmpty;
    
    return Column(
      children: [
        _buildNodeContent(node, level, colors, spacing, isExpanded, isSelected, hasChildren),
        if (hasChildren && isExpanded)
          ...node.children.map((child) => _buildTreeNode(_getNodeIndex(child), colors, spacing, level + 1)),
      ],
    );
  }
  
  /// Build node content
  Widget _buildNodeContent(
    AuiTreeViewNode node,
    int level,
    AuiColorScheme colors,
    AuiSpacingScheme spacing,
    bool isExpanded,
    bool isSelected,
    bool hasChildren,
  ) {
    // Get node colors
    final nodeBackgroundColor = _getNodeBackgroundColor(node, colors, isSelected);
    final nodeBorderColor = _getNodeBorderColor(node, colors);
    
    // Get node elevation
    final nodeElevation = _getNodeElevation(node);
    
    // Get node border radius
    final nodeBorderRadius = _getNodeBorderRadius(node, spacing);
    
    // Get node padding
    final nodePadding = _getNodePadding(node, spacing);
    
    Widget nodeContent = Container(
      key: node.key,
      padding: nodePadding,
      decoration: BoxDecoration(
        color: nodeBackgroundColor,
        borderRadius: nodeBorderRadius,
        border: nodeBorderColor != null 
            ? Border.all(color: nodeBorderColor, width: 1.0)
            : null,
        boxShadow: _getNodeShadows(node, nodeElevation),
      ),
      child: Row(
        children: [
          // Indent
          SizedBox(width: level * widget.indentSize),
          
          // Expand/collapse button
          if (hasChildren && widget.showExpandCollapse)
            _buildExpandCollapseButton(node, colors, spacing, isExpanded),
          
          // Checkbox
          if (widget.showCheckboxes)
            _buildCheckbox(node, colors, spacing),
          
          // Icon
          if (widget.showIcons)
            _buildNodeIcon(node, colors, spacing, isExpanded, isSelected),
          
          SizedBox(width: spacing.sm),
          
          // Content
          Expanded(
            child: node.content,
          ),
        ],
      ),
    );
    
    // Add margin
    if (node.margin != null) {
      nodeContent = Padding(
        padding: node.margin!,
        child: nodeContent,
      );
    }
    
    // Add semantics
    if (node.semanticLabel != null) {
      nodeContent = Semantics(
        label: node.semanticLabel,
        child: nodeContent,
      );
    }
    
    // Add tooltip
    if (node.tooltip != null) {
      nodeContent = Tooltip(
        message: node.tooltip!,
        child: nodeContent,
      );
    }
    
    // Add tap functionality
    if (widget.onNodeTap != null || widget.onNodeDoubleTap != null || widget.onNodeLongPress != null) {
      nodeContent = GestureDetector(
        onTap: () => widget.onNodeTap?.call(node),
        onDoubleTap: () => widget.onNodeDoubleTap?.call(node),
        onLongPress: () => widget.onNodeLongPress?.call(node),
        child: nodeContent,
      );
    }
    
    return nodeContent;
  }
  
  /// Build expand/collapse button
  Widget _buildExpandCollapseButton(AuiTreeViewNode node, AuiColorScheme colors, AuiSpacingScheme spacing, bool isExpanded) {
    return IconButton(
      onPressed: () => _toggleNode(node),
      icon: isExpanded
          ? (node.expandedIcon ?? Icon(Icons.expand_less))
          : (node.collapsedIcon ?? Icon(Icons.expand_more)),
      iconSize: _getIconSize(),
      color: colors.onSurfaceVariant,
    );
  }
  
  /// Build checkbox
  Widget _buildCheckbox(AuiTreeViewNode node, AuiColorScheme colors, AuiSpacingScheme spacing) {
    return Checkbox(
      value: _selectedNodes.contains(node),
      onChanged: (value) => _toggleSelection(node),
    );
  }
  
  /// Build node icon
  Widget _buildNodeIcon(AuiTreeViewNode node, AuiColorScheme colors, AuiSpacingScheme spacing, bool isExpanded, bool isSelected) {
    Widget icon;
    
    if (node.disabled && node.disabledIcon != null) {
      icon = node.disabledIcon!;
    } else if (isSelected && node.selectedIcon != null) {
      icon = node.selectedIcon!;
    } else if (isExpanded && node.expandedIcon != null) {
      icon = node.expandedIcon!;
    } else if (node.icon != null) {
      icon = node.icon!;
    } else {
      icon = Icon(Icons.folder);
    }
    
    return Icon(
      icon is Icon ? icon.icon : Icons.folder,
      size: _getIconSize(),
      color: node.disabled ? colors.outline.withValues(alpha:0.38) : colors.onSurfaceVariant,
    );
  }
  
  /// Toggle node expansion
  void _toggleNode(AuiTreeViewNode node) {
    setState(() {
      if (_expandedNodes.contains(node)) {
        _expandedNodes.remove(node);
        if (widget.onNodeCollapse != null) {
          widget.onNodeCollapse!(node);
        }
      } else {
        _expandedNodes.add(node);
        if (widget.onNodeExpand != null) {
          widget.onNodeExpand!(node);
        }
      }
    });
  }
  
  /// Toggle node selection
  void _toggleSelection(AuiTreeViewNode node) {
    setState(() {
      if (_selectedNodes.contains(node)) {
        _selectedNodes.remove(node);
        if (widget.onNodeDeselect != null) {
          widget.onNodeDeselect!(node);
        }
      } else {
        _selectedNodes.add(node);
        if (widget.onNodeSelect != null) {
          widget.onNodeSelect!(node);
        }
      }
    });
    
    if (widget.onSelectionChanged != null) {
      widget.onSelectionChanged!(_selectedNodes.toList());
    }
  }
  
  /// Get node at index
  AuiTreeViewNode? _getNodeAtIndex(int index) {
    int currentIndex = 0;
    return _getNodeAtIndexRecursive(widget.children, index, currentIndex);
  }
  
  /// Get node at index recursively
  AuiTreeViewNode? _getNodeAtIndexRecursive(List<AuiTreeViewNode> nodes, int targetIndex, int currentIndex) {
    for (final node in nodes) {
      if (currentIndex == targetIndex) {
        return node;
      }
      currentIndex++;
      
      if (_expandedNodes.contains(node) && node.children.isNotEmpty) {
        final result = _getNodeAtIndexRecursive(node.children, targetIndex, currentIndex);
        if (result != null) return result;
        currentIndex += _getNodeCount(node.children);
      }
    }
    return null;
  }
  
  /// Get node index
  int _getNodeIndex(AuiTreeViewNode targetNode) {
    int currentIndex = 0;
    return _getNodeIndexRecursive(widget.children, targetNode, currentIndex);
  }
  
  /// Get node index recursively
  int _getNodeIndexRecursive(List<AuiTreeViewNode> nodes, AuiTreeViewNode targetNode, int currentIndex) {
    for (final node in nodes) {
      if (node == targetNode) {
        return currentIndex;
      }
      currentIndex++;
      
      if (_expandedNodes.contains(node) && node.children.isNotEmpty) {
        final result = _getNodeIndexRecursive(node.children, targetNode, currentIndex);
        if (result != -1) return result;
        currentIndex += _getNodeCount(node.children);
      }
    }
    return -1;
  }
  
  /// Get total node count
  int _getTotalNodeCount() {
    return _getNodeCount(widget.children);
  }
  
  /// Get node count
  int _getNodeCount(List<AuiTreeViewNode> nodes) {
    int count = nodes.length;
    for (final node in nodes) {
      if (_expandedNodes.contains(node) && node.children.isNotEmpty) {
        count += _getNodeCount(node.children);
      }
    }
    return count;
  }
  
  /// Get node background color
  Color? _getNodeBackgroundColor(AuiTreeViewNode node, AuiColorScheme colors, bool isSelected) {
    if (node.backgroundColor != null) return node.backgroundColor;
    
    if (isSelected) {
      return colors.primaryContainer;
    }
    
    switch (widget.variant) {
      case AuiTreeViewVariant.filled:
        return colors.surface;
      case AuiTreeViewVariant.outlined:
        return colors.surface;
      case AuiTreeViewVariant.elevated:
        return colors.surface;
      case AuiTreeViewVariant.tonal:
        return colors.surfaceVariant;
      case AuiTreeViewVariant.minimal:
        return Colors.transparent;
    }
  }
  
  /// Get node foreground color
  
  /// Get node border color
  Color? _getNodeBorderColor(AuiTreeViewNode node, AuiColorScheme colors) {
    if (node.borderColor != null) return node.borderColor;
    
    switch (widget.variant) {
      case AuiTreeViewVariant.filled:
        return null;
      case AuiTreeViewVariant.outlined:
        return colors.outline;
      case AuiTreeViewVariant.elevated:
        return null;
      case AuiTreeViewVariant.tonal:
        return null;
      case AuiTreeViewVariant.minimal:
        return null;
    }
  }
  
  /// Get node elevation
  double _getNodeElevation(AuiTreeViewNode node) {
    if (node.elevation != null) return node.elevation!;
    
    switch (widget.variant) {
      case AuiTreeViewVariant.filled:
        return 0.0;
      case AuiTreeViewVariant.outlined:
        return 0.0;
      case AuiTreeViewVariant.elevated:
        return 2.0;
      case AuiTreeViewVariant.tonal:
        return 0.0;
      case AuiTreeViewVariant.minimal:
        return 0.0;
    }
  }
  
  /// Get node border radius
  BorderRadius? _getNodeBorderRadius(AuiTreeViewNode node, AuiSpacingScheme spacing) {
    if (node.borderRadius != null) return node.borderRadius;
    
    switch (widget.size) {
      case AuiTreeViewSize.xs:
        return BorderRadius.circular(spacing.xs);
      case AuiTreeViewSize.sm:
        return BorderRadius.circular(spacing.sm);
      case AuiTreeViewSize.md:
        return BorderRadius.circular(spacing.md);
      case AuiTreeViewSize.lg:
        return BorderRadius.circular(spacing.lg);
      case AuiTreeViewSize.xl:
        return BorderRadius.circular(spacing.xl);
    }
  }
  
  /// Get node padding
  EdgeInsets _getNodePadding(AuiTreeViewNode node, AuiSpacingScheme spacing) {
    if (node.padding != null) return node.padding!;
    
    switch (widget.size) {
      case AuiTreeViewSize.xs:
        return EdgeInsets.all(spacing.xs);
      case AuiTreeViewSize.sm:
        return EdgeInsets.all(spacing.sm);
      case AuiTreeViewSize.md:
        return EdgeInsets.all(spacing.md);
      case AuiTreeViewSize.lg:
        return EdgeInsets.all(spacing.lg);
      case AuiTreeViewSize.xl:
        return EdgeInsets.all(spacing.xl);
    }
  }
  
  /// Get node shadows
  List<BoxShadow> _getNodeShadows(AuiTreeViewNode node, double elevation) {
    if (elevation == 0) return [];
    
    return [
      BoxShadow(
        color: node.shadowColor ?? Colors.black.withValues(alpha:0.1),
        offset: Offset(0, elevation * 0.5),
        blurRadius: elevation * 2,
        spreadRadius: elevation * 0.1,
      ),
    ];
  }
  
  /// Get tree view background color
  Color? _getTreeViewBackgroundColor(AuiColorScheme colors) {
    return widget.backgroundColor ?? Colors.transparent;
  }
  
  /// Get tree view foreground color
  Color _getTreeViewForegroundColor(AuiColorScheme colors) {
    return widget.foregroundColor ?? colors.onSurface;
  }
  
  /// Get tree view border color
  Color? _getTreeViewBorderColor(AuiColorScheme colors) {
    return widget.borderColor;
  }
  
  /// Get tree view elevation
  double _getTreeViewElevation(AuiElevationScheme elevation) {
    return widget.elevation ?? elevation.level0;
  }
  
  /// Get tree view border radius
  BorderRadius? _getTreeViewBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius;
    return null;
  }
  
  /// Get tree view padding
  EdgeInsets _getTreeViewPadding(AuiSpacingScheme spacing) {
    if (widget.padding != null) return widget.padding!;
    
    switch (widget.size) {
      case AuiTreeViewSize.xs:
        return EdgeInsets.all(spacing.xs);
      case AuiTreeViewSize.sm:
        return EdgeInsets.all(spacing.sm);
      case AuiTreeViewSize.md:
        return EdgeInsets.all(spacing.md);
      case AuiTreeViewSize.lg:
        return EdgeInsets.all(spacing.lg);
      case AuiTreeViewSize.xl:
        return EdgeInsets.all(spacing.xl);
    }
  }
  
  /// Get icon size
  double _getIconSize() {
    switch (widget.size) {
      case AuiTreeViewSize.xs:
        return 16.0;
      case AuiTreeViewSize.sm:
        return 20.0;
      case AuiTreeViewSize.md:
        return 24.0;
      case AuiTreeViewSize.lg:
        return 28.0;
      case AuiTreeViewSize.xl:
        return 32.0;
    }
  }
  
  /// Get tree view shadows
  List<BoxShadow> _getTreeViewShadows(AuiColorScheme colors, double elevation) {
    if (elevation == 0) return [];
    
    return [
      BoxShadow(
        color: widget.shadowColor ?? colors.shadow.withValues(alpha:0.1),
        offset: Offset(0, elevation * 0.5),
        blurRadius: elevation * 2,
        spreadRadius: elevation * 0.1,
      ),
    ];
  }
}

/// Tree view line style
enum AuiTreeViewLineStyle {
  solid,
  dashed,
  dotted,
}

/// Tree view utilities
class AuiTreeViewUtils {
  const AuiTreeViewUtils._();
  
  /// Calculate node height
  static double calculateNodeHeight(AuiTreeViewSize size) {
    switch (size) {
      case AuiTreeViewSize.xs:
        return 32.0;
      case AuiTreeViewSize.sm:
        return 40.0;
      case AuiTreeViewSize.md:
        return 48.0;
      case AuiTreeViewSize.lg:
        return 56.0;
      case AuiTreeViewSize.xl:
        return 64.0;
    }
  }
  
  /// Calculate indent size
  static double calculateIndentSize(AuiTreeViewSize size) {
    switch (size) {
      case AuiTreeViewSize.xs:
        return 16.0;
      case AuiTreeViewSize.sm:
        return 20.0;
      case AuiTreeViewSize.md:
        return 24.0;
      case AuiTreeViewSize.lg:
        return 28.0;
      case AuiTreeViewSize.xl:
        return 32.0;
    }
  }
  
  /// Get all nodes recursively
  static List<AuiTreeViewNode> getAllNodes(List<AuiTreeViewNode> nodes) {
    final List<AuiTreeViewNode> allNodes = [];
    for (final node in nodes) {
      allNodes.add(node);
      allNodes.addAll(getAllNodes(node.children));
    }
    return allNodes;
  }
  
  /// Find node by data
  static AuiTreeViewNode? findNodeByData(List<AuiTreeViewNode> nodes, dynamic data) {
    for (final node in nodes) {
      if (node.data == data) return node;
      final result = findNodeByData(node.children, data);
      if (result != null) return result;
    }
    return null;
  }
  
  /// Get node depth
  static int getNodeDepth(AuiTreeViewNode targetNode, List<AuiTreeViewNode> nodes, int currentDepth) {
    for (final node in nodes) {
      if (node == targetNode) return currentDepth;
      final result = getNodeDepth(targetNode, node.children, currentDepth + 1);
      if (result != -1) return result;
    }
    return -1;
  }
}
