// ignore: unused_import
// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geomaks_test/src/core/utils/snackbar_util.dart';
import 'package:geomaks_test/src/feature/app/bloc/app_bloc.dart';
import 'package:geomaks_test/src/feature/app/presentation/base.dart';
import 'package:geomaks_test/src/feature/app/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// ignore: unused_element
const _tag = 'Launcher';

@RoutePage(name: 'LauncherRoute')
class Launcher extends StatefulWidget {
  final int? initialTabIndex;
  const Launcher({super.key, this.initialTabIndex});

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> with WidgetsBindingObserver {
  @override
  void initState() {
    FToast().init(context);

    BlocProvider.of<AppBloc>(context).add(const AppEvent.checkAuth());

    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // TODO
    // BlocProvider.of<CityCubit>(context).getCities(
    //   city: context.currentCity,
    // );
    // NotificationService.getUserId(
    //     context.repository.authDao, context.packageInfo);
    // NotificationService.oneSignalSetup(context);
    ff();
  }

  void ff() async {
    // NotificationService.pushSetup(context);
    // await NotificationService().init();
    // NotificationService().getDeviceToken(authDao: context.repository.authDao);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log('MyApp state = $state');
    if (state == AppLifecycleState.inactive) {
      // app transitioning to other state.
    } else if (state == AppLifecycleState.paused) {
      // app is on the background.
    } else if (state == AppLifecycleState.detached) {
      // flutter engine is running but detached from views
    } else if (state == AppLifecycleState.resumed) {
      // app is visible and running.
      // runApp(App()); // run your App class again
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {
        state.whenOrNull(
          inAppState: () {
            
            // BlocProvider.of<ProfileCubit>(context).getProfileInfo();

            //  BlocProvider.of<ProfileBLoC>(context).add(const ProfileEvent.getProfile());
            // BlocProvider.of<AppBloc>(context)
            //     .add(const AppEvent.sendDeviceToken());
          },
          errorState: (message) {
            SnackBarUtil.showErrorTopShortToast(context, 'AppBloc => $message');
          },
        );
      },
      builder: (context, state) {
        //  return Base();

        return state.maybeWhen(
          // TODO
          notAuthorizedState: () =>   const Base(),
          inAppState: () => const Base(),
          loadingState: () => const _Scaffold(
            child: CustomLoadingWidget(),
          ),
          orElse: () => const Base(),
        );
      },
    ); // OnBoardingPage();
  }
}

class _Scaffold extends StatelessWidget {
  final Widget child;
  const _Scaffold({
    required this.child,
    // super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
    );
  }
}
