import 'package:flutter/material.dart';

class BouncingWidget extends StatefulWidget {
  final VoidCallback? onTap;
  final void Function(TapUpDetails)? onTapUp;
  final void Function(TapDownDetails)? onTapDown;
  final VoidCallback? onTapCancel;
  final double scaleFactor;
  final Duration? duration;
  final Widget child;

  const BouncingWidget({
    Key? key,
    required this.onTap,
    required this.child,
    this.onTapUp,
    this.duration,
    this.onTapDown,
    this.onTapCancel,
    this.scaleFactor = 0.8,
  })  : assert(
          scaleFactor >= 0.0 && scaleFactor <= 1.0,
          "The valid range of scaleFactor is from 0.0 to 1.0.",
        ),
        super(key: key);

  @override
  State<BouncingWidget> createState() => _BouncingWidgetState();
}

class _BouncingWidgetState extends State<BouncingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration ?? const Duration(milliseconds: 200),
    reverseDuration: widget.duration ?? const Duration(milliseconds: 200),
    value: 1.0,
    upperBound: 1.0,
    lowerBound: widget.scaleFactor,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
    reverseCurve: Curves.decelerate,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  void _onTap() {
    if (widget.onTap != null) widget.onTap!();

    _controller.reverse().then((_) {
      _controller.forward();
    });
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.onTapUp != null) widget.onTapUp!(details);
    _controller.forward();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.onTapDown != null) widget.onTapDown!(details);
    _controller.reverse();
  }

  void _onTapCancel() {
    if (widget.onTapCancel != null) widget.onTapCancel!();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapCancel: widget.onTap != null ? _onTapCancel : null,
        onTapDown: widget.onTap != null ? _onTapDown : null,
        onTapUp: widget.onTap != null ? _onTapUp : null,
        onTap: widget.onTap != null ? _onTap : null,
        child: ScaleTransition(
          scale: _animation,
          child: widget.child,
        ),
      ),
    );
  }
}
