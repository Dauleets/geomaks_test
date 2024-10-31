import 'package:geomaks_test/src/core/model/dependencies_storage.dart';
import 'package:geomaks_test/src/core/model/repository_storage.dart';
import 'package:geomaks_test/src/core/widget/dependencies_scope.dart';
import 'package:geomaks_test/src/core/widget/repository_scope.dart';
import 'package:geomaks_test/src/feature/app/bloc/app_restart_bloc.dart';
import 'package:geomaks_test/src/feature/app/presentation/app_configuration.dart';
import 'package:geomaks_test/src/feature/settings/widget/settings_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeomaksTestApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  final PackageInfo packageInfo;

  const GeomaksTestApp({
    super.key,
    required this.sharedPreferences,
    required this.packageInfo,
  });

  @override
  Widget build(BuildContext context) => DependenciesScope(
        create: (context) => DependenciesStorage(
          // databaseName: 'digital_bridge_db',
          sharedPreferences: sharedPreferences,
          packageInfo: packageInfo,
        ),
        child: RepositoryScope(
          create: (context) => RepositoryStorage(
            // appDatabase: DependenciesScope.of(context).database,
            sharedPreferences: sharedPreferences,
            networkExecuter: DependenciesScope.of(context).networkExecuter,
          ),
          child: BlocProvider<AppRestartBloc>(
            create: (context) => AppRestartBloc(),
            child: const _App(),
          ),
        ),
      );
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppRestartBloc, AppRestartState>(
      listener: (context, state) {},
      builder: (context, state) => state.maybeWhen(
        // loading: () => const SettingsScope(
        //   child: AppConfiguration(),
        // ),
        loadedState: (key) => KeyedSubtree(
          key: key,
          child: const SettingsScope(
            child: AppConfiguration(),
          ),
        ),
        orElse: () => const SettingsScope(
          child: AppConfiguration(),
        ),
      ),
    );
  }
}
