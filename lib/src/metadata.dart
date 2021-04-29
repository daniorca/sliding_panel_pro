part of sliding_panel_pro;

class _PanelMetadata {
  double constrainedHeight = 0;
  double constrainedWidth = 0;

  double totalHeight;

  double closedHeight, collapsedHeight, expandedHeight;
  double providedExpandedHeight;

  bool isTwoStatePanel;
  bool isDraggable;
  bool isModal;
  final bool animatedAppearing;

  PanelSnapping snapping;

  double snappingTriggerPercentage;

  double dragMultiplier;

  SafeAreaConfig safeAreaConfig;

  final InitialPanelState initialPanelState;

  final ValueNotifier<double> _heightInternal;

  final ValueNotifier<bool> _isBodyDrag;

  final VoidCallback listener;

  _PanelMetadata({
    @required this.closedHeight = 0,
    @required this.collapsedHeight = 0,
    @required this.expandedHeight = 0,
    @required this.isTwoStatePanel = false,
    @required this.snapping = PanelSnapping.enabled,
    @required this.isDraggable = true,
    @required this.isModal = false,
    @required this.animatedAppearing = false,
    @required this.snappingTriggerPercentage = 0.0,
    @required this.dragMultiplier = 1.0,
    @required this.safeAreaConfig = const SafeAreaConfig.all(),
    @required this.initialPanelState = InitialPanelState.closed,
    required this.listener,
  })  : _heightInternal = ValueNotifier<double>((isModal ||
                initialPanelState == InitialPanelState.dismissed ||
                animatedAppearing)
            ? 0.0
            : initialPanelState == InitialPanelState.closed
                ? closedHeight
                : initialPanelState == InitialPanelState.collapsed
                    ? isTwoStatePanel
                        ? expandedHeight
                        : collapsedHeight
                    : expandedHeight)
          ..addListener(listener),
        totalHeight = double.infinity,
        _isBodyDrag = ValueNotifier<bool>(false),
        providedExpandedHeight = expandedHeight;

  bool get isClosed => _heightInternal.value <= closedHeight;

  bool get isCollapsed => _heightInternal.value == collapsedHeight;

  bool get isExpanded => _heightInternal.value >= expandedHeight;

  set currentHeight(double height) => _heightInternal.value = height;

  void _setInitialStateAgain() {
    // re-attach listener, to avoid unnecessary notify on close
    _removeHeightListener(listener);

    // modal panels ALWAYS initialize dismissed
    // dismissed panels also
    if (isModal ||
        initialPanelState == InitialPanelState.dismissed ||
        animatedAppearing)
      currentHeight = 0.0;
    else
      currentHeight = initialPanelState == InitialPanelState.closed
          ? closedHeight
          : initialPanelState == InitialPanelState.collapsed
              ? isTwoStatePanel
                  ? expandedHeight
                  : collapsedHeight
              : expandedHeight;

    _addHeightListener(listener);
  }

  void _removeHeightListener(VoidCallback listener) {
    _heightInternal.removeListener(listener);
  }

  void _addHeightListener(VoidCallback listener) {
    _heightInternal.addListener(listener);
  }

  double get currentHeight => _heightInternal.value;

  double get extraClosedHeight => isClosed ? 0.0 : 1.0;

  double get extraExpandedHeight => isExpanded ? 0.0 : 1.0;

  void addPixels(double pixels, {bool shouldMultiply = false}) {
    if (totalHeight == 0) return;

    final double toAdd = ((pixels * (shouldMultiply ? dragMultiplier : 1)) /
        totalHeight *
        expandedHeight);

    currentHeight =
        (currentHeight + toAdd)._safeClamp(closedHeight, expandedHeight).toDouble();
  }
}