import 'package:flutter/material.dart';
import 'package:geomaks_test/src/core/resources/resources.dart';

class FieldsErrorTextWidget extends StatelessWidget {
  final String text;
  const FieldsErrorTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              text,
              style: AppTextStyles.m14w400Red,
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
