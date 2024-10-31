// import 'dart:developer';

// import 'package:geomaks_test/src/core/utils/snackbar_util.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class UrlUtil {
//   UrlUtil._();

//   static Future<bool> launch(
//     BuildContext context, {
//     required String url,
//     LaunchMode mode = LaunchMode.externalApplication,
//   }) async {
//     try {
//       final uri = Uri.parse(url);

//       return launchUrl(
//         uri,
//         mode: mode,
//       );
//     } catch (e) {
//       log('$e', name: 'UrlUtil');

//       SnackBarUtil.showErrorTopShortToast(context, 'error');
//       return false;
//     }
//   }

//   static Future<bool> launchPhoneUrl(
//     BuildContext context, {
//     required String phone,
//   }) async {
//     try {
//       final Uri phoneLaunchUri = Uri(
//         scheme: 'tel',
//         path: phone,
//       );

//       return launchUrl(phoneLaunchUri);
//     } catch (e) {
//       log('$e', name: 'UrlUtil');

//       SnackBarUtil.showErrorTopShortToast(context, 'error');
//       return false;
//     }
//   }

//   static Future<bool> launchSMSUrl(
//     BuildContext context, {
//     required String phone,
//   }) async {
//     try {
//       final Uri phoneLaunchUri = Uri(
//         scheme: 'sms',
//         path: phone,
//       );

//       return launchUrl(phoneLaunchUri);
//     } catch (e) {
//       log('$e', name: 'UrlUtil');

//       SnackBarUtil.showErrorTopShortToast(context, 'error');
//       return false;
//     }
//   }

//   static Future<bool> launchEmailUrl(
//     BuildContext context, {
//     required String email,
//     String? subject,
//   }) async {
//     try {
//       final Uri phoneLaunchUri = Uri(
//         scheme: 'mailto',
//         path: email,
//         query: subject != null ? "subject=$subject" : null,
//       );
//       return launchUrl(phoneLaunchUri);
//     } catch (e) {
//       log('$e', name: 'UrlUtil');
//       SnackBarUtil.showErrorTopShortToast(context, 'error');
//       return false;
//     }
//   }

//   static Future<bool> launchWhatsappUrl(
//     BuildContext context, {
//     required String phone,
//   }) async {
//     final String whatsapp = phone;
//     final String whatappUrlIos = "https://wa.me/$whatsapp";
//     try {
//       final Uri phoneLaunchUri = Uri.parse(
//         whatappUrlIos,
//       );
//       return launchUrl(phoneLaunchUri, mode: LaunchMode.externalApplication);
//     } catch (e) {
//       log('$e', name: 'UrlUtil');
//       SnackBarUtil.showErrorTopShortToast(context, 'error');
//       return false;
//     }
//   }
// }
