import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
    buildSuccessCustomSnackBar(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 6.0,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.greenAccent,
    ),
  );
}

// ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
//     buildErrorCustomSnackBar(BuildContext context, String message) {
//   return ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       elevation: 6.0,
//       behavior: SnackBarBehavior.floating,
//       content: Text(
//         message,
//         textAlign: TextAlign.center,
//       ),
//       backgroundColor: Colors.red,
//     ),
//   );
// }

// void showErrorToast(String message) {
//   Fluttertoast.showToast(
//     msg: message,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.TOP,
//     backgroundColor: Colors.white,
//     textColor: Color.fromRGBO(61, 60, 60, 1),
//     fontSize: 14,
//     fontAsset: 'Golos',
//   );
// }

// void showSuccessToast(String message) {
//   Fluttertoast.showToast(
//     msg: message,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.BOTTOM,
//     backgroundColor: Colors.green,
//     textColor: Colors.white,
//     fontSize: 16.0,
//   );
// }

void showToast(String message) {
  AnimatedSnackBar.material(
    message, type: AnimatedSnackBarType.error,
    borderRadius: BorderRadius.circular(12),
    duration: const Duration(seconds: 2),
   


    // toastLength: Toast.LENGTH_SHORT,
    // gravity: ToastGravity.BOTTOM,
    // backgroundColor: Colors.black.withOpacity(50),
    // textColor: Colors.white,
    // fontSize: 16.0,
  );
}

ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>
    buildTopBanner(
  BuildContext context,
  String message, {
  Color color = Colors.red,
}) {
  return ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      content: Row(
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      overflowAlignment: OverflowBarAlignment.start,
      // leading: const Icon(Icons.info),
      // padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
      backgroundColor: color,
      actions: [
        TextButton(
          child: const Text(
            'Закрыть',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () =>
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
        ),
      ],
    ),
  );
}
