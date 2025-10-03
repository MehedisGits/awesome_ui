import 'package:flutter/material.dart';

/// Lazy loading utilities for the Awesome UI library.
class LazyLoadingUtils {
  /// Create a lazy loading widget that only builds when visible
  static Widget createLazyWidget({
    required Widget child,
    required bool isVisible,
    Duration? delay,
    Widget? placeholder,
  }) {
    if (isVisible) {
      return child;
    }
    
    if (delay != null) {
      return FutureBuilder(
        future: Future.delayed(delay),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return child;
          }
          return placeholder ?? const SizedBox.shrink();
        },
      );
    }
    
    return placeholder ?? const SizedBox.shrink();
  }

  /// Create a lazy loading list view
  static Widget createLazyListView({
    required List<Widget> children,
    required ScrollController scrollController,
    double threshold = 100.0,
    Widget? placeholder,
  }) {
    return ListView.builder(
      controller: scrollController,
      itemCount: children.length,
      itemBuilder: (context, index) {
        final isVisible = _isItemVisible(
          scrollController,
          index,
          threshold,
        );
        
        return createLazyWidget(
          child: children[index],
          isVisible: isVisible,
          placeholder: placeholder,
        );
      },
    );
  }

  /// Create a lazy loading grid view
  static Widget createLazyGridView({
    required List<Widget> children,
    required ScrollController scrollController,
    required int crossAxisCount,
    double threshold = 100.0,
    Widget? placeholder,
  }) {
    return GridView.builder(
      controller: scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) {
        final isVisible = _isItemVisible(
          scrollController,
          index,
          threshold,
        );
        
        return createLazyWidget(
          child: children[index],
          isVisible: isVisible,
          placeholder: placeholder,
        );
      },
    );
  }

  /// Check if an item is visible in the viewport
  static bool _isItemVisible(
    ScrollController scrollController,
    int index,
    double threshold,
  ) {
    if (!scrollController.hasClients) return false;
    
    final position = scrollController.position;
    final viewportTop = position.pixels;
    final viewportBottom = viewportTop + position.viewportDimension;
    
    // Estimate item position (this is a simplified calculation)
    final itemTop = index * 100.0; // Assuming average item height of 100
    final itemBottom = itemTop + 100.0;
    
    return itemBottom >= viewportTop - threshold &&
           itemTop <= viewportBottom + threshold;
  }
}

/// Lazy loading widget that only builds when visible
class LazyWidget extends StatefulWidget {
  final Widget child;
  final bool isVisible;
  final Duration? delay;
  final Widget? placeholder;
  final double threshold;

  const LazyWidget({
    super.key,
    required this.child,
    required this.isVisible,
    this.delay,
    this.placeholder,
    this.threshold = 100.0,
  });

  @override
  State<LazyWidget> createState() => _LazyWidgetState();
}

class _LazyWidgetState extends State<LazyWidget> {
  bool _hasBuilt = false;
  bool _isBuilding = false;

  @override
  void didUpdateWidget(LazyWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible && !_hasBuilt && !_isBuilding) {
      _buildWithDelay();
    }
  }

  void _buildWithDelay() async {
    if (_isBuilding) return;
    
    _isBuilding = true;
    
    if (widget.delay != null) {
      await Future.delayed(widget.delay!);
    }
    
    if (mounted) {
      setState(() {
        _hasBuilt = true;
        _isBuilding = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isVisible && !_hasBuilt && !_isBuilding) {
      _buildWithDelay();
    }
    
    if (widget.isVisible && _hasBuilt) {
      return widget.child;
    }
    
    return widget.placeholder ?? const SizedBox.shrink();
  }
}

/// Lazy loading list view
class LazyListView extends StatefulWidget {
  final List<Widget> children;
  final ScrollController? scrollController;
  final double threshold;
  final Widget? placeholder;
  final EdgeInsets? padding;

  const LazyListView({
    super.key,
    required this.children,
    this.scrollController,
    this.threshold = 100.0,
    this.placeholder,
    this.padding,
  });

  @override
  State<LazyListView> createState() => _LazyListViewState();
}

class _LazyListViewState extends State<LazyListView> {
  late ScrollController _scrollController;
  final Set<int> _visibleItems = {};

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    } else {
      _scrollController.removeListener(_onScroll);
    }
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    
    final position = _scrollController.position;
    final viewportTop = position.pixels;
    final viewportBottom = viewportTop + position.viewportDimension;
    
    final newVisibleItems = <int>{};
    
    for (int i = 0; i < widget.children.length; i++) {
      // Estimate item position (simplified calculation)
      final itemTop = i * 100.0;
      final itemBottom = itemTop + 100.0;
      
      if (itemBottom >= viewportTop - widget.threshold &&
          itemTop <= viewportBottom + widget.threshold) {
        newVisibleItems.add(i);
      }
    }
    
    if (newVisibleItems != _visibleItems) {
      setState(() {
        _visibleItems.clear();
        _visibleItems.addAll(newVisibleItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: widget.padding,
      itemCount: widget.children.length,
      itemBuilder: (context, index) {
        final isVisible = _visibleItems.contains(index);
        
        return LazyWidget(
          child: widget.children[index],
          isVisible: isVisible,
          placeholder: widget.placeholder,
        );
      },
    );
  }
}

/// Lazy loading grid view
class LazyGridView extends StatefulWidget {
  final List<Widget> children;
  final ScrollController? scrollController;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final double threshold;
  final Widget? placeholder;
  final EdgeInsets? padding;

  const LazyGridView({
    super.key,
    required this.children,
    this.scrollController,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.childAspectRatio = 1.0,
    this.threshold = 100.0,
    this.placeholder,
    this.padding,
  });

  @override
  State<LazyGridView> createState() => _LazyGridViewState();
}

class _LazyGridViewState extends State<LazyGridView> {
  late ScrollController _scrollController;
  final Set<int> _visibleItems = {};

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    } else {
      _scrollController.removeListener(_onScroll);
    }
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    
    final position = _scrollController.position;
    final viewportTop = position.pixels;
    final viewportBottom = viewportTop + position.viewportDimension;
    
    final newVisibleItems = <int>{};
    
    for (int i = 0; i < widget.children.length; i++) {
      // Estimate item position (simplified calculation)
      final row = i ~/ widget.crossAxisCount;
      final col = i % widget.crossAxisCount;
      
      final itemTop = row * 100.0; // Assuming average item height of 100
      final itemBottom = itemTop + 100.0;
      
      if (itemBottom >= viewportTop - widget.threshold &&
          itemTop <= viewportBottom + widget.threshold) {
        newVisibleItems.add(i);
      }
    }
    
    if (newVisibleItems != _visibleItems) {
      setState(() {
        _visibleItems.clear();
        _visibleItems.addAll(newVisibleItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      padding: widget.padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        mainAxisSpacing: widget.mainAxisSpacing,
        crossAxisSpacing: widget.crossAxisSpacing,
        childAspectRatio: widget.childAspectRatio,
      ),
      itemCount: widget.children.length,
      itemBuilder: (context, index) {
        final isVisible = _visibleItems.contains(index);
        
        return LazyWidget(
          child: widget.children[index],
          isVisible: isVisible,
          placeholder: widget.placeholder,
        );
      },
    );
  }
}
