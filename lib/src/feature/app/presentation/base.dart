// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:geomaks_test/src/core/extension/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: unused_element
const _tag = 'Base';

class Base extends StatefulWidget {
  final int? initialTabIndex;
  const Base({super.key, this.initialTabIndex});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> with TickerProviderStateMixin {
  late TabController tabController;
  int? previousIndex;

  @override
  void initState() {
    tabController = TabController(
      initialIndex: widget.initialTabIndex ?? 0,
      length: 3,
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [
        // BlocProvider<AppBloc>(
        //   create: (context) => AppBloc(context.repository.authRepository),
        // ),
      ],
      child:
          // BlocBuilder<AppBloc, AppState>(
          //   builder: (context, appState) {
          // return
          WillPopScope(
        onWillPop: () async => false,
        child: AutoTabsScaffold(
          routes: const [
            // Container(),

            // SavedRoute(),

            // ProfileRoute(),
            // BasketRoute(isCleaning: false),
            // const ProfileRoute(),
          ],
          transitionBuilder: (context, child, animation) {
            return child;
          },
          bottomNavigationBuilder: (context, tabsRouter) {
            return BaseBottomNavbar(
              tabsRouter: tabsRouter,
              tabController: tabController,
            );
          },
        ),
      ),
      //     );
      //   },
      // ),
    );
  }
}

class BaseBottomNavbar extends StatefulWidget {
  final TabsRouter tabsRouter;
  final TabController tabController;
  const BaseBottomNavbar({
    super.key,
    required this.tabsRouter,
    required this.tabController,
  });

  @override
  State<BaseBottomNavbar> createState() => _BaseBottomNavbarState();
}

class _BaseBottomNavbarState extends State<BaseBottomNavbar> {
  @override
  void initState() {
    super.initState();

    widget.tabsRouter.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    widget.tabController.animateTo(widget.tabsRouter.activeIndex);
    // if (widget.tabsRouter.activeIndex == 1) {
    //   BlocProvider.of<BasketBloc>(context).add(BasketEvent.getBasketDryCleanClothes());
    // }
  }

  @override
  void dispose() {
    widget.tabsRouter.removeListener(_onTabChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      padding: EdgeInsets.only(bottom: Platform.isAndroid ? 1 : 20),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(25, 26, 31, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            spreadRadius: 0.1,
            blurRadius: 10,
          ),
        ],
      ),
      child: TabBar(
        onTap: (value) {
          if (widget.tabsRouter.activeIndex == value) {
            
            widget.tabsRouter.popTop();
          } else {
            if (value == 0) {
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle.light,
              );
            } else {
              SystemChrome.setSystemUIOverlayStyle(
                context.theme.whenByValue(
                  light: SystemUiOverlayStyle.dark,
                ),
              );
            }
            widget.tabsRouter.setActiveIndex(value);
          }
        },
        indicatorColor: const Color.fromRGBO(25, 26, 31, 1),
        dividerColor: const Color.fromRGBO(25, 26, 31, 1),
        labelColor: const Color.fromRGBO(25, 26, 31, 1),
        indicatorSize: TabBarIndicatorSize.tab,
        splashBorderRadius: BorderRadius.circular(23),
        controller: widget.tabController,
        labelPadding: EdgeInsets.zero,
        tabs: const [
          // CustomTabWidget(
          //   icon: Assets.icons.home.path,
          //   activeIcon: Assets.icons.home.path,
          //   currentIndex: widget.tabsRouter.activeIndex,
          //   tabIndex: 0,
          //   title: 'Home',
          // ),
          
        ],
      ),
    );
  }
}
