import 'package:geomaks_test/src/core/gen/l10n/app_localizations.g.dart';
import 'package:geomaks_test/src/core/resources/resources.dart';
import 'package:geomaks_test/src/feature/app/presentation/app_router_builder.dart';
import 'package:geomaks_test/src/feature/app/presentation/theme_scope.dart';
import 'package:geomaks_test/src/feature/app/router/app_router.dart';
import 'package:geomaks_test/src/feature/settings/widget/settings_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AppConfiguration extends StatelessWidget {
  const AppConfiguration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final themeMode = SettingsScope.themeModeOf(context, listen: true);
    final locale = SettingsScope.localeOf(context, listen: true);

    return AppRouterBuilder(
      createRouter: (context) => AppRouter(),
      builder: (context, parser, delegate) => MaterialApp.router(
        routeInformationParser: parser,
        routerDelegate: delegate,
        // onGenerateTitle: (context) => context.localized.appTitle,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          // CountryLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.light,
       
        darkTheme: AppTheme.light,
        themeMode: themeMode,
        locale: locale,
        builder: (context, child) => ThemeScope(
          child: LoaderOverlay(
            // TODO:
            // overlayWidgetBuilder: (progress) => const CustomOverlayWidget(),
          
            overlayColor: AppColors.mainColor,
            useDefaultLoading: false,
            child: child!,
          ),
        ),
      ),
    );
  }
}
