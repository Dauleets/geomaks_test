import 'package:flutter/material.dart';
import 'package:geomaks_test/src/core/resources/resources.dart';
import 'package:geomaks_test/src/feature/app/widgets/simple_container.dart';

Future<T?> bottomSheet<T>(
  BuildContext context,
  Widget widget, {
  bool? enableDrag = true,
  bool? isDismissible = false,
  Color? barrierColor = Colors.white,
  bool? isScrollControlled = true,
  double? height = 200,
  Color? color = AppColors.static,
}) {
  return showModalBottomSheet<T>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    context: context,
    barrierColor: barrierColor?.withOpacity(0.5),
    // ignore: avoid_redundant_argument_values
    enableDrag: true,
    // isDismissible: true,
    isScrollControlled: true,
    builder: (context) {
      return SimpleContainer(
        color: color,
        height: height,
        width: double.infinity,
        boxShadow: const [],
        child: widget,
      );
    },
  );
}
