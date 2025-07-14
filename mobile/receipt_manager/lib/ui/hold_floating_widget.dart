import 'package:flutter/material.dart';

class HoldFloatingImageWidget extends StatefulWidget {
  final Widget child;
  final Widget floatingChild;

  const HoldFloatingImageWidget({
    super.key,
    required this.child,
    required this.floatingChild,
  });

  @override
  State<HoldFloatingImageWidget> createState() => _HoldFloatingImageWidgetState();
}

class _HoldFloatingImageWidgetState extends State<HoldFloatingImageWidget>
    with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  final GlobalKey _floatingKey = GlobalKey();
  bool _overlayVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
  }

  void _showOverlay(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: IgnorePointer(
          child: Center(
            child: Opacity(
              opacity: _overlayVisible ? 1.0 : 0.0,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  key: _floatingKey,
                  child: widget.floatingChild,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context)?.insert(_overlayEntry!);
    _controller.forward(from: 0);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = _floatingKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        setState(() {
          _overlayVisible = true;
        });
        _overlayEntry?.markNeedsBuild();
      }
    });
  }

  void _removeOverlay() {
    _controller.reverse().then((_) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _overlayVisible = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (_) => _showOverlay(context),
      onLongPressEnd: (_) => _removeOverlay(),
      child: widget.child,
    );
  }
}
