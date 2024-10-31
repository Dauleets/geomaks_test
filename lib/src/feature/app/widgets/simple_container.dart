import 'package:geomaks_test/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

class SimpleContainer extends StatelessWidget {
  final Widget? child;
  final Border? border;
  final BorderRadius? borderRadius;
  final Color? color;
  final DecorationImage? image;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final Function()? onTap;
  final List<BoxShadow> boxShadow;
  const SimpleContainer({
    super.key,
    this.child,
    this.border,
    this.borderRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
    this.color = AppColors.base100,
    this.image,
    this.padding = const EdgeInsets.all(16),
    this.height,
    this.onTap,
    this.width,
    required this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          borderRadius: borderRadius,
          color: color,
          image: image,
          boxShadow: boxShadow,
        ),
        child: child,
      ),
    );
  }
}
