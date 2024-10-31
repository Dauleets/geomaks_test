import 'package:geomaks_test/src/core/extension/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeScope extends StatefulWidget {
  final Widget child;

  const ThemeScope({required this.child, super.key});

  @override
  State<ThemeScope> createState() => _ThemeScopeState();
}

class _ThemeScopeState extends State<ThemeScope> with WidgetsBindingObserver {
  @override
  void didChangeDependencies() {
    // context.deviceSize.maybeWhen(
    //   phone: () async {
    //     await SystemChrome.setPreferredOrientations([
    //       DeviceOrientation.portraitUp,
    //       DeviceOrientation.portraitDown,
    //       DeviceOrientation.landscapeLeft,
    //       DeviceOrientation.landscapeRight,
    //     ]);
    //   },
    //   orElse: () {},
    // );
    final style = context.theme.whenByValue(
      light: SystemUiOverlayStyle.dark,
    );

    SystemChrome.setSystemUIOverlayStyle(style);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // ignore: avoid-ignoring-return-values
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
