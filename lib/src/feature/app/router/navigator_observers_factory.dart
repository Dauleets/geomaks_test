import 'package:geomaks_test/src/feature/app/router/router_observer.dart';
import 'package:flutter/material.dart';

class NavigatorObserversFactory {
  const NavigatorObserversFactory();

  List<NavigatorObserver> call() => [
        // SentryNavigatorObserver(),
        RouterObserver(),
      ];
}
