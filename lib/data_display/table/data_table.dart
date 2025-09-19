import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../foundation/theme.dart';

/// Data table variants
enum AuiDataTableVariant {
  filled,
  outlined,
  elevated,
  tonal,
  minimal,
}

/// Data table sizes
enum AuiDataTableSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Data table states
enum AuiDataTableState {
  enabled,
  disabled,
  loading,
  error,
}

/// Data table selection modes
enum AuiDataTableSelectionMode {
  none,
  single,
  multiple,
  all,
}

/// Data table sort directions
enum AuiDataTableSortDirection {
  none,
  ascending,
  descending,
}

/// Data table column configuration
class AuiDataTableColumn {
  const AuiDataTableColumn({
    required this.label,
    this.key,
    this.width,
    this.minWidth,
    this.maxWidth,
    this.flex = 1,
    this.sortable = true,
    this.filterable = true,
    this.resizable = true,
    this.align = AuiDataTableAlign.start,
    this.headerAlign = AuiDataTableAlign.start,
    this.cellBuilder,
    this.headerBuilder,
    this.sortKey,
    this.filterKey,
    this.tooltip,
    this.semanticLabel,
  });

  final String label;
  final String? key;
  final double? width;
  final double? minWidth;
  final double? maxWidth;
  final int flex;
  final bool sortable;
  final bool filterable;
  final bool resizable;
  final AuiDataTableAlign align;
  final AuiDataTableAlign headerAlign;
  final Widget Function(dynamic data, int index)? cellBuilder;
  final Widget Function()? headerBuilder;
  final String? sortKey;
  final String? filterKey;
  final String? tooltip;
  final String? semanticLabel;
}

/// Data table alignment
enum AuiDataTableAlign {
  start,
  center,
  end,
  stretch,
}

/// Data table row configuration
class AuiDataTableRow {
  const AuiDataTableRow({
    required this.data,
    this.key,
    this.selected = false,
    this.disabled = false,
    this.height,
    this.minHeight,
    this.maxHeight,
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
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
  });

  final Map<String, dynamic> data;
  final Key? key;
  final bool selected;
  final bool disabled;
  final double? height;
  final double? minHeight;
  final double? maxHeight;
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
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
}

/// A comprehensive data table component
class AuiDataTable extends StatefulWidget {
  const AuiDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.variant = AuiDataTableVariant.outlined,
    this.size = AuiDataTableSize.md,
    this.state = AuiDataTableState.enabled,
    this.selectionMode = AuiDataTableSelectionMode.none,
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
    this.showHeader = true,
    this.showFooter = false,
    this.showCheckboxes = true,
    this.showSortIndicators = true,
    this.showFilters = false,
    this.showSearch = false,
    this.showPagination = false,
    this.stickyHeader = false,
    this.stickyFooter = false,
    this.horizontalScroll = false,
    this.verticalScroll = true,
    this.physics,
    this.shrinkWrap = false,
    this.reverse = false,
    this.controller,
    this.primary = false,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.none,
    this.anchor = 0.0,
    this.center,
    this.cacheExtentStyle = CacheExtentStyle.pixel,
    this.scrollBehavior,
    this.onRowTap,
    this.onRowDoubleTap,
    this.onRowLongPress,
    this.onSelectionChanged,
    this.onSort,
    this.onFilter,
    this.onSearch,
    this.onPageChanged,
    this.headerHeight,
    this.rowHeight,
    this.footerHeight,
    this.constraints,
    this.gradient,
    this.border,
    this.shape,
    this.animationDuration,
    this.animationCurve,
  });

  final List<AuiDataTableColumn> columns;
  final List<AuiDataTableRow> rows;
  final AuiDataTableVariant variant;
  final AuiDataTableSize size;
  final AuiDataTableState state;
  final AuiDataTableSelectionMode selectionMode;
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
  final bool showHeader;
  final bool showFooter;
  final bool showCheckboxes;
  final bool showSortIndicators;
  final bool showFilters;
  final bool showSearch;
  final bool showPagination;
  final bool stickyHeader;
  final bool stickyFooter;
  final bool horizontalScroll;
  final bool verticalScroll;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool reverse;
  final ScrollController? controller;
  final bool primary;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final double anchor;
  final Key? center;
  final CacheExtentStyle cacheExtentStyle;
  final ScrollBehavior? scrollBehavior;
  final ValueChanged<int>? onRowTap;
  final ValueChanged<int>? onRowDoubleTap;
  final ValueChanged<int>? onRowLongPress;
  final ValueChanged<List<int>>? onSelectionChanged;
  final ValueChanged<AuiDataTableColumn>? onSort;
  final ValueChanged<Map<String, dynamic>>? onFilter;
  final ValueChanged<String>? onSearch;
  final ValueChanged<int>? onPageChanged;
  final double? headerHeight;
  final double? rowHeight;
  final double? footerHeight;
  final BoxConstraints? constraints;
  final Gradient? gradient;
  final Border? border;
  final ShapeBorder? shape;
  final Duration? animationDuration;
  final Curve? animationCurve;

  @override
  State<AuiDataTable> createState() => _AuiDataTableState();
}

class _AuiDataTableState extends State<AuiDataTable> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _animation;
  final Set<int> _selectedRows = {};
  final Map<String, AuiDataTableSortDirection> _sortStates = {};
  final Map<String, dynamic> _filters = {};
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    _animationController = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve ?? Curves.easeInOut,
    );
    
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

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get table colors
    final tableBackgroundColor = _getTableBackgroundColor(colors);
    final tableForegroundColor = _getTableForegroundColor(colors);
    final tableBorderColor = _getTableBorderColor(colors);
    
    // Get table elevation
    final tableElevation = _getTableElevation(elevation);
    
    // Get table border radius
    final tableBorderRadius = _getTableBorderRadius(spacing);
    
    // Get table padding
    final tablePadding = _getTablePadding(spacing);
    
    // Build table
    final table = _buildTable(colors, spacing, tableBackgroundColor, tableForegroundColor, tableBorderColor, tableElevation, tableBorderRadius, tablePadding);
    
    Widget dataTable = Container(
      constraints: widget.constraints,
      padding: tablePadding,
      decoration: BoxDecoration(
        color: tableBackgroundColor,
        borderRadius: tableBorderRadius,
        border: tableBorderColor != null 
            ? Border.all(color: tableBorderColor, width: 1.0)
            : null,
        gradient: widget.gradient,
        boxShadow: _getTableShadows(colors, tableElevation),
      ),
      clipBehavior: widget.clipBehavior,
      child: table,
    );
    
    // Add margin
    if (widget.margin != null) {
      dataTable = Padding(
        padding: widget.margin!,
        child: dataTable,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      dataTable = Semantics(
        label: widget.semanticLabel,
        child: dataTable,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      dataTable = Tooltip(
        message: widget.tooltip!,
        child: dataTable,
      );
    }
    
    return dataTable;
  }
  
  /// Build table
  Widget _buildTable(
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
          child: Column(
            children: [
              if (widget.showHeader) _buildHeader(colors, spacing),
              if (widget.showSearch) _buildSearch(colors, spacing),
              if (widget.showFilters) _buildFilters(colors, spacing),
              Expanded(
                child: _buildTableBody(colors, spacing),
              ),
              if (widget.showFooter) _buildFooter(colors, spacing),
              if (widget.showPagination) _buildPagination(colors, spacing),
            ],
          ),
        );
      },
    );
  }
  
  /// Build header
  Widget _buildHeader(AuiColorScheme colors, AuiSpacingScheme spacing) {
    return Container(
      height: widget.headerHeight ?? _getHeaderHeight(),
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        border: Border(
          bottom: BorderSide(
            color: colors.outline.withValues(alpha:0.2),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          if (widget.showCheckboxes && widget.selectionMode != AuiDataTableSelectionMode.none)
            _buildHeaderCheckbox(colors),
          ...widget.columns.map((column) => _buildHeaderCell(column, colors, spacing)),
        ],
      ),
    );
  }
  
  /// Build header cell
  Widget _buildHeaderCell(AuiDataTableColumn column, AuiColorScheme colors, AuiSpacingScheme spacing) {
    Widget headerCell = Container(
      width: column.width,
      padding: EdgeInsets.all(spacing.sm),
      child: Row(
        children: [
          if (column.headerBuilder != null)
            column.headerBuilder!()
          else
            Text(
              column.label,
              style: TextStyle(
                color: colors.onSurfaceVariant,
                fontSize: _getHeaderFontSize(),
                fontWeight: FontWeight.w600,
              ),
            ),
          if (column.sortable && widget.showSortIndicators)
            _buildSortIndicator(column, colors),
        ],
      ),
    );
    
    // Add sort functionality
    if (column.sortable) {
      headerCell = GestureDetector(
        onTap: () => _onSort(column),
        child: headerCell,
      );
    }
    
    // Add tooltip
    if (column.tooltip != null) {
      headerCell = Tooltip(
        message: column.tooltip!,
        child: headerCell,
      );
    }
    
    return headerCell;
  }
  
  /// Build sort indicator
  Widget _buildSortIndicator(AuiDataTableColumn column, AuiColorScheme colors) {
    final sortDirection = _sortStates[column.sortKey ?? column.key] ?? AuiDataTableSortDirection.none;
    
    IconData iconData;
    switch (sortDirection) {
      case AuiDataTableSortDirection.ascending:
        iconData = Icons.arrow_upward;
        break;
      case AuiDataTableSortDirection.descending:
        iconData = Icons.arrow_downward;
        break;
      case AuiDataTableSortDirection.none:
        iconData = Icons.unfold_more;
        break;
    }
    
    return Icon(
      iconData,
      size: 16.0,
      color: colors.primary,
    );
  }
  
  /// Build header checkbox
  Widget _buildHeaderCheckbox(AuiColorScheme colors) {
    final allSelected = _selectedRows.length == widget.rows.length;
    
    return Checkbox(
      value: allSelected,
      tristate: true,
      onChanged: (value) {
        if (value == true) {
          _selectedRows.addAll(List.generate(widget.rows.length, (index) => index));
        } else {
          _selectedRows.clear();
        }
        setState(() {});
        if (widget.onSelectionChanged != null) {
          widget.onSelectionChanged!(_selectedRows.toList());
        }
      },
    );
  }
  
  /// Build search
  Widget _buildSearch(AuiColorScheme colors, AuiSpacingScheme spacing) {
    return Container(
      padding: EdgeInsets.all(spacing.sm),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
          if (widget.onSearch != null) {
            widget.onSearch!(value);
          }
        },
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(spacing.sm),
          ),
        ),
      ),
    );
  }
  
  /// Build filters
  Widget _buildFilters(AuiColorScheme colors, AuiSpacingScheme spacing) {
    return Container(
      padding: EdgeInsets.all(spacing.sm),
      child: Row(
        children: widget.columns
            .where((column) => column.filterable)
            .map((column) => _buildFilterChip(column, colors, spacing))
            .toList(),
      ),
    );
  }
  
  /// Build filter chip
  Widget _buildFilterChip(AuiDataTableColumn column, AuiColorScheme colors, AuiSpacingScheme spacing) {
    return Padding(
      padding: EdgeInsets.only(right: spacing.sm),
      child: FilterChip(
        label: Text(column.label),
        selected: _filters.containsKey(column.filterKey ?? column.key),
        onSelected: (selected) {
          setState(() {
            if (selected) {
              _filters[column.filterKey ?? column.key!] = true;
            } else {
              _filters.remove(column.filterKey ?? column.key);
            }
          });
          if (widget.onFilter != null) {
            widget.onFilter!(_filters);
          }
        },
      ),
    );
  }
  
  /// Build table body
  Widget _buildTableBody(AuiColorScheme colors, AuiSpacingScheme spacing) {
    final filteredRows = _getFilteredRows();
    
    return ListView.builder(
      controller: _scrollController,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      reverse: widget.reverse,
      itemCount: filteredRows.length,
      itemBuilder: (context, index) {
        final row = filteredRows[index];
        return _buildTableRow(row, index, colors, spacing);
      },
    );
  }
  
  /// Build table row
  Widget _buildTableRow(AuiDataTableRow row, int index, AuiColorScheme colors, AuiSpacingScheme spacing) {
    final isSelected = _selectedRows.contains(index);
    
    Widget tableRow = Container(
      height: widget.rowHeight ?? _getRowHeight(),
      decoration: BoxDecoration(
        color: isSelected ? colors.primaryContainer : row.backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: colors.outline.withValues(alpha:0.1),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          if (widget.showCheckboxes && widget.selectionMode != AuiDataTableSelectionMode.none)
            _buildRowCheckbox(index, colors),
          ...widget.columns.map((column) => _buildTableCell(row, column, index, colors, spacing)),
        ],
      ),
    );
    
    // Add tap functionality
    if (row.onTap != null || widget.onRowTap != null) {
      tableRow = GestureDetector(
        onTap: () {
          if (row.onTap != null) row.onTap!();
          if (widget.onRowTap != null) widget.onRowTap!(index);
        },
        onDoubleTap: row.onDoubleTap,
        onLongPress: row.onLongPress,
        child: tableRow,
      );
    }
    
    // Add semantics
    if (row.semanticLabel != null) {
      tableRow = Semantics(
        label: row.semanticLabel,
        child: tableRow,
      );
    }
    
    // Add tooltip
    if (row.tooltip != null) {
      tableRow = Tooltip(
        message: row.tooltip!,
        child: tableRow,
      );
    }
    
    return tableRow;
  }
  
  /// Build table cell
  Widget _buildTableCell(AuiDataTableRow row, AuiDataTableColumn column, int index, AuiColorScheme colors, AuiSpacingScheme spacing) {
    Widget cellContent;
    
    if (column.cellBuilder != null) {
      cellContent = column.cellBuilder!(row.data, index);
    } else {
      final value = row.data[column.key];
      cellContent = Text(
        value?.toString() ?? '',
        style: TextStyle(
          color: colors.onSurface,
          fontSize: _getCellFontSize(),
        ),
      );
    }
    
    return Container(
      width: column.width,
      padding: EdgeInsets.all(spacing.sm),
      child: cellContent,
    );
  }
  
  /// Build row checkbox
  Widget _buildRowCheckbox(int index, AuiColorScheme colors) {
    return Checkbox(
      value: _selectedRows.contains(index),
      onChanged: (value) {
        setState(() {
          if (value == true) {
            _selectedRows.add(index);
          } else {
            _selectedRows.remove(index);
          }
        });
        if (widget.onSelectionChanged != null) {
          widget.onSelectionChanged!(_selectedRows.toList());
        }
      },
    );
  }
  
  /// Build footer
  Widget _buildFooter(AuiColorScheme colors, AuiSpacingScheme spacing) {
    return Container(
      height: widget.footerHeight ?? _getFooterHeight(),
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        border: Border(
          top: BorderSide(
            color: colors.outline.withValues(alpha:0.2),
            width: 1.0,
          ),
        ),
      ),
      child: Center(
        child: Text(
          '${widget.rows.length} rows',
          style: TextStyle(
            color: colors.onSurfaceVariant,
            fontSize: _getFooterFontSize(),
          ),
        ),
      ),
    );
  }
  
  /// Build pagination
  Widget _buildPagination(AuiColorScheme colors, AuiSpacingScheme spacing) {
    return Container(
      padding: EdgeInsets.all(spacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.chevron_left),
          ),
          Text('1 of 1'),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
  
  /// Get filtered rows
  List<AuiDataTableRow> _getFilteredRows() {
    List<AuiDataTableRow> filteredRows = widget.rows;
    
    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filteredRows = filteredRows.where((row) {
        return row.data.values.any((value) =>
            value.toString().toLowerCase().contains(_searchQuery.toLowerCase()));
      }).toList();
    }
    
    // Apply column filters
    for (final entry in _filters.entries) {
      filteredRows = filteredRows.where((row) {
        return row.data.containsKey(entry.key) && row.data[entry.key] == entry.value;
      }).toList();
    }
    
    return filteredRows;
  }
  
  /// Handle sort
  void _onSort(AuiDataTableColumn column) {
    final currentDirection = _sortStates[column.sortKey ?? column.key] ?? AuiDataTableSortDirection.none;
    
    AuiDataTableSortDirection newDirection;
    switch (currentDirection) {
      case AuiDataTableSortDirection.none:
        newDirection = AuiDataTableSortDirection.ascending;
        break;
      case AuiDataTableSortDirection.ascending:
        newDirection = AuiDataTableSortDirection.descending;
        break;
      case AuiDataTableSortDirection.descending:
        newDirection = AuiDataTableSortDirection.none;
        break;
    }
    
    setState(() {
      _sortStates[column.sortKey ?? column.key!] = newDirection;
    });
    
    if (widget.onSort != null) {
      widget.onSort!(column);
    }
  }
  
  /// Get table background color
  Color _getTableBackgroundColor(AuiColorScheme colors) {
    if (widget.state == AuiDataTableState.disabled) {
      return colors.surfaceVariant;
    }
    
    switch (widget.variant) {
      case AuiDataTableVariant.filled:
        return widget.backgroundColor ?? colors.surface;
      case AuiDataTableVariant.outlined:
        return widget.backgroundColor ?? colors.surface;
      case AuiDataTableVariant.elevated:
        return widget.backgroundColor ?? colors.surface;
      case AuiDataTableVariant.tonal:
        return widget.backgroundColor ?? colors.surfaceVariant;
      case AuiDataTableVariant.minimal:
        return Colors.transparent;
    }
  }
  
  /// Get table foreground color
  Color _getTableForegroundColor(AuiColorScheme colors) {
    if (widget.state == AuiDataTableState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    return widget.foregroundColor ?? colors.onSurface;
  }
  
  /// Get table border color
  Color? _getTableBorderColor(AuiColorScheme colors) {
    if (widget.state == AuiDataTableState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    switch (widget.variant) {
      case AuiDataTableVariant.filled:
        return null;
      case AuiDataTableVariant.outlined:
        return widget.borderColor ?? colors.outline;
      case AuiDataTableVariant.elevated:
        return null;
      case AuiDataTableVariant.tonal:
        return null;
      case AuiDataTableVariant.minimal:
        return null;
    }
  }
  
  /// Get table elevation
  double _getTableElevation(AuiElevationScheme elevation) {
    if (widget.elevation != null) return widget.elevation!;
    
    switch (widget.variant) {
      case AuiDataTableVariant.filled:
        return elevation.level0;
      case AuiDataTableVariant.outlined:
        return elevation.level0;
      case AuiDataTableVariant.elevated:
        return elevation.level1;
      case AuiDataTableVariant.tonal:
        return elevation.level0;
      case AuiDataTableVariant.minimal:
        return elevation.level0;
    }
  }
  
  /// Get table border radius
  BorderRadius? _getTableBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius;
    
    switch (widget.size) {
      case AuiDataTableSize.xs:
        return BorderRadius.circular(spacing.xs);
      case AuiDataTableSize.sm:
        return BorderRadius.circular(spacing.sm);
      case AuiDataTableSize.md:
        return BorderRadius.circular(spacing.md);
      case AuiDataTableSize.lg:
        return BorderRadius.circular(spacing.lg);
      case AuiDataTableSize.xl:
        return BorderRadius.circular(spacing.xl);
    }
  }
  
  /// Get table padding
  EdgeInsets _getTablePadding(AuiSpacingScheme spacing) {
    if (widget.padding != null) return widget.padding!;
    
    switch (widget.size) {
      case AuiDataTableSize.xs:
        return EdgeInsets.all(spacing.xs);
      case AuiDataTableSize.sm:
        return EdgeInsets.all(spacing.sm);
      case AuiDataTableSize.md:
        return EdgeInsets.all(spacing.md);
      case AuiDataTableSize.lg:
        return EdgeInsets.all(spacing.lg);
      case AuiDataTableSize.xl:
        return EdgeInsets.all(spacing.xl);
    }
  }
  
  /// Get header height
  double _getHeaderHeight() {
    switch (widget.size) {
      case AuiDataTableSize.xs:
        return 32.0;
      case AuiDataTableSize.sm:
        return 40.0;
      case AuiDataTableSize.md:
        return 48.0;
      case AuiDataTableSize.lg:
        return 56.0;
      case AuiDataTableSize.xl:
        return 64.0;
    }
  }
  
  /// Get row height
  double _getRowHeight() {
    switch (widget.size) {
      case AuiDataTableSize.xs:
        return 32.0;
      case AuiDataTableSize.sm:
        return 40.0;
      case AuiDataTableSize.md:
        return 48.0;
      case AuiDataTableSize.lg:
        return 56.0;
      case AuiDataTableSize.xl:
        return 64.0;
    }
  }
  
  /// Get footer height
  double _getFooterHeight() {
    switch (widget.size) {
      case AuiDataTableSize.xs:
        return 32.0;
      case AuiDataTableSize.sm:
        return 40.0;
      case AuiDataTableSize.md:
        return 48.0;
      case AuiDataTableSize.lg:
        return 56.0;
      case AuiDataTableSize.xl:
        return 64.0;
    }
  }
  
  /// Get header font size
  double _getHeaderFontSize() {
    switch (widget.size) {
      case AuiDataTableSize.xs:
        return 12.0;
      case AuiDataTableSize.sm:
        return 14.0;
      case AuiDataTableSize.md:
        return 16.0;
      case AuiDataTableSize.lg:
        return 18.0;
      case AuiDataTableSize.xl:
        return 20.0;
    }
  }
  
  /// Get cell font size
  double _getCellFontSize() {
    switch (widget.size) {
      case AuiDataTableSize.xs:
        return 12.0;
      case AuiDataTableSize.sm:
        return 14.0;
      case AuiDataTableSize.md:
        return 16.0;
      case AuiDataTableSize.lg:
        return 18.0;
      case AuiDataTableSize.xl:
        return 20.0;
    }
  }
  
  /// Get footer font size
  double _getFooterFontSize() {
    switch (widget.size) {
      case AuiDataTableSize.xs:
        return 12.0;
      case AuiDataTableSize.sm:
        return 14.0;
      case AuiDataTableSize.md:
        return 16.0;
      case AuiDataTableSize.lg:
        return 18.0;
      case AuiDataTableSize.xl:
        return 20.0;
    }
  }
  
  /// Get table shadows
  List<BoxShadow> _getTableShadows(AuiColorScheme colors, double elevation) {
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

/// Data table utilities
class AuiDataTableUtils {
  const AuiDataTableUtils._();
  
  /// Calculate column width
  static double calculateColumnWidth(double availableWidth, int totalColumns, double gap) {
    return (availableWidth - (gap * (totalColumns - 1))) / totalColumns;
  }
  
  /// Calculate row height
  static double calculateRowHeight(AuiDataTableSize size) {
    switch (size) {
      case AuiDataTableSize.xs:
        return 32.0;
      case AuiDataTableSize.sm:
        return 40.0;
      case AuiDataTableSize.md:
        return 48.0;
      case AuiDataTableSize.lg:
        return 56.0;
      case AuiDataTableSize.xl:
        return 64.0;
    }
  }
  
  /// Sort data
  static List<Map<String, dynamic>> sortData(
    List<Map<String, dynamic>> data,
    String key,
    AuiDataTableSortDirection direction,
  ) {
    if (direction == AuiDataTableSortDirection.none) return data;
    
    final sortedData = List<Map<String, dynamic>>.from(data);
    sortedData.sort((a, b) {
      final aValue = a[key];
      final bValue = b[key];
      
      if (aValue == null && bValue == null) return 0;
      if (aValue == null) return 1;
      if (bValue == null) return -1;
      
      final comparison = aValue.toString().compareTo(bValue.toString());
      return direction == AuiDataTableSortDirection.ascending ? comparison : -comparison;
    });
    
    return sortedData;
  }
  
  /// Filter data
  static List<Map<String, dynamic>> filterData(
    List<Map<String, dynamic>> data,
    Map<String, dynamic> filters,
  ) {
    return data.where((row) {
      return filters.entries.every((entry) {
        return row.containsKey(entry.key) && row[entry.key] == entry.value;
      });
    }).toList();
  }
  
  /// Search data
  static List<Map<String, dynamic>> searchData(
    List<Map<String, dynamic>> data,
    String query,
  ) {
    if (query.isEmpty) return data;
    
    return data.where((row) {
      return row.values.any((value) =>
          value.toString().toLowerCase().contains(query.toLowerCase()));
    }).toList();
  }
}
