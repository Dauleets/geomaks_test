// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:geomaks_test/src/core/gen/assets.gen.dart';
// import 'package:geomaks_test/src/core/resources/resources.dart';

// ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
//     buildSuccessCustomSnackBar(
//   BuildContext context,
//   String message,
// ) {
//   return ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       elevation: 6.0,
//       behavior: SnackBarBehavior.floating,
//       content: Text(
//         message,
//         textAlign: TextAlign.center,
//       ),
//       backgroundColor: Colors.greenAccent,
//     ),
//   );
// }

// ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
//     buildErrorCustomSnackBar(
//   BuildContext context,
//   String message,
// ) {
//   return ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       elevation: 6.0,
//       content: Text(
//         message,
//         textAlign: TextAlign.center,
//       ),
//       backgroundColor: Colors.red,
//     ),
//   );
// }

// ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>
//     buildTopBanner(
//   BuildContext context,
//   String message, {
//   Color color = Colors.red,
// }) {
//   return ScaffoldMessenger.of(context).showMaterialBanner(
//     MaterialBanner(
//       content: Row(
//         children: [
//           Text(
//             message,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//       overflowAlignment: OverflowBarAlignment.start,
//       // leading: const Icon(Icons.info),
//       // padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
//       backgroundColor: color,
//       actions: [
//         TextButton(
//           child: const Text(
//             'Закрыть',
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//           onPressed: () =>
//               ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
//         ),
//       ],
//     ),
//   );
// }

// void showTopShortToast(
//   BuildContext context, {
//   required String message,
//   double radius = 12,
//   EdgeInsetsGeometry? padding =
//       const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//   Color color = Colors.greenAccent,
//   Widget? body,
// }) {
//   final FToast fToast = FToast();
//   fToast.init(context);

//   final Widget toast = Container(
//     padding: padding,
//     margin: const EdgeInsets.symmetric(horizontal: 32),
//     width: MediaQuery.of(context).size.width,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(radius),
//       color: color,
//     ),
//     child: body ??
//         Text(
//           message,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//           ),
//         ),
//   );

//   fToast.showToast(
//     child: toast,
//     gravity: ToastGravity.TOP,
//     toastDuration: const Duration(seconds: 4),
//     positionedToastBuilder: (context, child) {
//       return Positioned(
//         top: 50.0,
//         left: 0,
//         right: 0,
//         // left: MediaQuery.of(context).size.width / 3,
//         child: child,
//       );
//     },
//   );
// }

// void showErrorToast(
//   BuildContext context, {
//   required String message,
//   double radius = 12,
//   EdgeInsetsGeometry? padding =
//       const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
//   Color color = Colors.white,
//   Widget? body,
// }) {
//   final FToast fToast = FToast();
//   fToast.init(context);

//   final Widget toast = Container(
//     padding: padding,
//     margin: message.length > 15  ? const EdgeInsets.symmetric(horizontal: 70) : const EdgeInsets.symmetric(horizontal: 110),
//     width: MediaQuery.of(context).size.width,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(radius),
//       color: color,
//     ),
//     child: Row(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SvgPicture.asset(Assets.icons.errorClose.path),
//         const SizedBox(width: 9),
//         Flexible(child: Text(message, style: AppTextStyles.m14w500, textAlign: TextAlign.center,),
//         ),
//       ],
//     ),
//   );

//   fToast.showToast(
//     child: toast,
//     gravity: ToastGravity.TOP,
//     toastDuration: const Duration(seconds: 4),
//     positionedToastBuilder: (context, child) {
//       return Positioned(
//         top: 64.0,
//         left: 0,
//         right: 0,
//         // left: MediaQuery.of(context).size.width / 3,
//         child: child,
//       );
//     },
//   );
// }


// void showSuccesToast(
//   BuildContext context, {
//   required String message,
//   double radius = 12,
//   EdgeInsetsGeometry? padding =
//       const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
//   Color color = Colors.white,
//   Widget? body,
// }) {
//   final FToast fToast = FToast();
//   fToast.init(context);

//   final Widget toast = Container(
//     padding: padding,
//     margin: message.length > 15  ? const EdgeInsets.symmetric(horizontal: 70) : const EdgeInsets.symmetric(horizontal: 110),
//     width: MediaQuery.of(context).size.width,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(radius),
//       color: Color.fromRGBO(47, 44, 60, 1),
//     ),
//     child: Row(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SvgPicture.asset(Assets.icons.succes.path, color: AppColors.base100,width: 21,height: 21,),
//         const SizedBox(width: 9),
//         Flexible(child: Text(message, style: AppTextStyles.m14w500White, textAlign: TextAlign.center,),
//         ),
//       ],
//     ),
//   );

//   fToast.showToast(
//     child: toast,
//     gravity: ToastGravity.TOP,
//     toastDuration: const Duration(seconds: 4),
//     positionedToastBuilder: (context, child) {
//       return Positioned(
//         top: 64.0,
//         left: 0,
//         right: 0,
//         // left: MediaQuery.of(context).size.width / 3,
//         child: child,
//       );
//     },
//   );
// }
