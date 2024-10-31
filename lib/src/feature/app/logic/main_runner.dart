// ignore_for_file: avoid-ignoring-return-values, unused_import
import 'dart:async';

// import 'package:geomaks_test/firebase_options.dart';

import 'package:geomaks_test/src/core/widget/bloc_observer.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef AsyncDependencies<D> = Future<D> Function();

typedef AppBuilder<D> = Widget Function(D dependencies);

mixin MainRunner {
  static Future<Widget> _initApp<D>(
    AsyncDependencies<D> asyncDependencies,
    AppBuilder<D> app,
  ) async {
    final dependencies = await asyncDependencies();

    return app(dependencies);
  }

  static Future<void> run<D>({
    required AsyncDependencies<D> asyncDependencies,
    required AppBuilder<D> appBuilder,
  }) async {
    ///
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = AppBlocObserver();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    try {
      // await Firebase.initializeApp(
      //   options: DefaultFirebaseOptions.currentPlatform,
      // );
      // await NotificationService().init();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }

    //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    final app = await _initApp(asyncDependencies, appBuilder);
    runApp(app);
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]).then(
    //   (value) => ,
    // );
    // }
  }
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   if (kDebugMode) {
//     print("Handling a background message: ${message.messageId}");
//   }
}
