import 'package:auto_route/auto_route.dart';
import 'package:geomaks_test/src/core/extension/extensions.dart';
import 'package:geomaks_test/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

class CustomEscButton extends StatelessWidget {
  const CustomEscButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: context.theme.base200,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            // ignore: deprecated_member_use
            context.router.pop();
          },
          child: const Icon(
            Icons.close_rounded,
            size: 20,
            color: AppColors.base700,
          ),
        ),
      ),
    );
  }
}
