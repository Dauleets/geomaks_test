import 'package:geomaks_test/src/feature/app/logic/main_runner.dart';
import 'package:geomaks_test/src/feature/app/model/async_app_dependencies.dart';
import 'package:geomaks_test/src/feature/app/presentation/etalon_app.dart';

Future<void> main() => MainRunner.run<AsyncAppDependencies>(
      asyncDependencies: AsyncAppDependencies.obtain,
      appBuilder: (dependencies) => GeomaksTestApp(
        sharedPreferences: dependencies.sharedPreferences,
        packageInfo: dependencies.packageInfo,
      ),
    );

 // TODO : custom widgets in app