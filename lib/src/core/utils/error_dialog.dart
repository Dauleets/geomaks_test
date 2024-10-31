import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geomaks_test/src/core/resources/resources.dart';
import 'package:geomaks_test/src/feature/app/widgets/custom_button.dart';

Future<dynamic> errorDialog(BuildContext context, String error) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            height: 230,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                // color: AppColors.base100,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Ошибка',
                      style: AppTextStyles.m22w600,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(error,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.m16w400Grey,
                        textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                  ],
                ),
                CustomButton(
                  onPressed: () {
                    context.router.popForced();
                  },
                  style: CustomButtonStyles.primaryBlueButton(),
                  child: const Text('Позжееее попробуй',
                      style: AppTextStyles.m16w600White,
                      textAlign: TextAlign.center),
                )
              ],
            ),
          ),
        );
      });
}
