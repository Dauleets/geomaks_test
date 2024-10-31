import 'package:geomaks_test/src/core/extension/extensions.dart';
import 'package:geomaks_test/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@sealed
class SnackBarUtil {
  SnackBarUtil._();

  static final GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();

  static void showTopShortToast(
    BuildContext context, {
    required String message,
    double radius = 12,
    EdgeInsetsGeometry? padding = const EdgeInsets.all(14),
    Color? color,
    Widget? body,
  }) {
    FToast().removeQueuedCustomToasts();

    // final FToast fToast = FToast();
    // fToast.init(context);

    final Widget toast = Container(
      padding: padding,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      // width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.black.withOpacity(0), width: 0.5),
        color: color ?? context.theme.background50,
        boxShadow: const [
          BoxShadow(
            color: Color(0x28000000),
            blurRadius: 24,
          ),
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 2,
          ),
        ],
      ),
      child: body ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SvgPicture.asset(
              //   Assets.icons.boldCheck.path,
              //   width: 20,
              //   height: 20,
              // ),
              const SizedBox(width: 12),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
    );

    FToast().showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(milliseconds: 1500),
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: 50.0,
          left: 0,
          right: 0,
          // left: MediaQuery.of(context).size.width / 3,
          child: child,
        );
      },
    );
  }

  static void showErrorTopShortToast(
    BuildContext context,
    String message, {
    double radius = 12,
    EdgeInsetsGeometry? padding = const EdgeInsets.all(14),
    Color? color,
    Widget? body,
  }) {
    FToast().removeQueuedCustomToasts();

    final Widget toast = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: Colors.black.withOpacity(0), width: 0.5),
          color: color ?? context.theme.background50,
          boxShadow: const [
            BoxShadow(
              color: Color(0x28000000),
              blurRadius: 24,
            ),
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 2,
            ),
          ],
        ),
        child: body ??
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // SvgPicture.asset(
                //   Assets.icons.boldWarning.path,
                //   width: 20,
                //   height: 20,
                // ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
      ),
    );

    FToast().showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(milliseconds: 1500),
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: 50.0,
          left: 0,
          right: 0,
          // left: MediaQuery.of(context).size.width / 3,
          child: child,
        );
      },
    );
  }
}
