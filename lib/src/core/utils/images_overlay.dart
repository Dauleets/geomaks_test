import 'package:geomaks_test/src/core/extension/extensions.dart';
import 'package:geomaks_test/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

@immutable
class ImagesOverlay extends StatelessWidget {
  final int length;
  final int current;

  const ImagesOverlay({
    required this.length,
    required this.current,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  color: Colors.black,
                  tooltip: 'Close',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                length,
                (index) => Container(
                  width: current == index ? 16.0 : 8.0,
                  height: 8,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    color: current == index
                        ? context.theme.mainColor
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
