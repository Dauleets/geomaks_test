import 'package:geomaks_test/src/feature/app/presentation/widgets/circle_paint.dart';
import 'package:geomaks_test/src/feature/app/presentation/widgets/curve_wave.dart';
import 'package:flutter/material.dart';

class RipplesAnimation extends StatefulWidget {
  const RipplesAnimation({
    super.key,
    this.size = 40.0,
    this.onPressed,
    required this.child,
    required this.color,
  });
  final double size;
  final Color color;
  final Widget child;
  final VoidCallback? onPressed;
  @override
  State<RipplesAnimation> createState() => _RipplesAnimationState();
}

class _RipplesAnimationState extends State<RipplesAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(
        _controller,
        color: widget.color,
      ),
      child: SizedBox(
        width: widget.size * 4.125,
        height: widget.size * 4.125,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.size),
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: <Color>[
                    widget.color,
                    Color.lerp(widget.color, Colors.black, .05)!,
                  ],
                ),
              ),
              child: ScaleTransition(
                scale: Tween(begin: 0.95, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: const CurveWave(),
                  ),
                ),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
