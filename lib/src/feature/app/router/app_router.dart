import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geomaks_test/src/feature/app/presentation/launcher.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: TempRoutes.page),

        AutoRoute(
          page: LauncherRoute.page,
          initial: true,
          children: const [
            // AutoRoute(page: MainRoute.page),
            // AutoRoute(page: Second.page),
            // AutoRoute(page: Three.page),
          ],
        ),

        //  pages
      ];
}

@RoutePage(name: 'BaseMainTab')
class BaseMainPage extends AutoRouter {
  const BaseMainPage({super.key});
}

@RoutePage(name: 'BaseChatsTab')
class BaseCatalogPage extends AutoRouter {
  const BaseCatalogPage({super.key});
}

@RoutePage(name: 'BaseSavedTab')
class BaseNotificationsPage extends AutoRouter {
  const BaseNotificationsPage({super.key});
}

@RoutePage(name: 'BaseProfileTab')
class BaseProfilePage extends AutoRouter {
  const BaseProfilePage({super.key});
}
