import 'package:geomaks_test/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTabWidget extends StatelessWidget {
  final String icon;
  final String activeIcon;
  final String title;
  final int currentIndex;
  final int tabIndex;

  const CustomTabWidget({
    super.key,
    required this.icon,
    required this.activeIcon,
    required this.title,
    required this.currentIndex,
    required this.tabIndex,
  });

  @override
  Widget build(BuildContext context) {
    bool isActive = tabIndex == currentIndex;
    return Tab(
      iconMargin: const EdgeInsets.only(bottom: 8),
      icon: Stack(
        alignment: Alignment.center,
        children: [
          if (isActive)
            Container(
              width: 36, 
              height: 36,
              decoration: BoxDecoration(
                color: Colors.transparent, 
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.75), 
                    blurRadius: 24, 
                    spreadRadius: 0.4, 
                  ),
                ],
              ),
            ),
          SvgPicture.asset(
            isActive ? activeIcon : icon,
            colorFilter: ColorFilter.mode(
              isActive ? Colors.white : const Color.fromRGBO(128, 127, 130, 1),
              BlendMode.srcATop,
            ),
          ),
        ],
      ),
      child: Text(
        title,
        style: tabIndex == currentIndex
            ? AppTextStyles.m12w500.copyWith(color: Colors.white)
            : AppTextStyles.m12w500.copyWith(
                color: const Color.fromRGBO(128, 127, 130, 1),
              ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class TopIndicatorLight extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBoxLight();
  }
}

class _TopIndicatorBoxLight extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Paint paint = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0xff000000),
          Color(0xff000000),
        ],
      ).createShader(
        Rect.fromCircle(
          center: offset,
          radius: 0,
        ),
      )
      ..strokeWidth = 2
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.square;

    canvas.drawLine(
      Offset(offset.dx, 0.5),
      Offset(cfg.size!.width + offset.dx, 0.5),
      paint,
    );
  }
}

class TopIndicatorDark extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBoxDark();
  }
}

class _TopIndicatorBoxDark extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Paint paint = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0xffFFFFFF),
          Color(0xffFFFFFF),
        ],
      ).createShader(
        Rect.fromCircle(
          center: offset,
          radius: 0,
        ),
      )
      ..strokeWidth = 2
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.square;

    canvas.drawLine(
      Offset(offset.dx, 0.5),
      Offset(cfg.size!.width + offset.dx, 0.5),
      paint,
    );
  }
}

class CustomNotificationTabWidget extends StatelessWidget {
  final String icon;
  final String activeIcon;
  final String title;
  final int currentIndex;
  final int tabIndex;
  const CustomNotificationTabWidget({
    super.key,
    required this.icon,
    required this.activeIcon,
    required this.title,
    required this.currentIndex,
    required this.tabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      // text: title,

      iconMargin: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: AppTextStyles.m10w400,
        textAlign: TextAlign.center,
      ),
      // icon: ValueListenableBuilder(
      //   valueListenable:
      //   NotificationsScope.of(context).countNotifier,
      //   builder: (context, v, c) {
      //     return badges.Badge(
      //       position: badges.BadgePosition.topEnd(top: -5, end: -6),
      //       showBadge: false, // FIXME: NotificationsScope.of(context).countNotifier.value != 0,
      //       ignorePointer: true,
      //       // onTap: () {},
      //       // badgeContent: RipplesAnimation(
      //       //   size: 7,
      //       //   color: context.theme.mainColor,
      //       //   child: Text(
      //       //     '$v',
      //       //     style: const TextStyle(
      //       //       fontSize: 10,
      //       //       color: Colors.white,
      //       //     ),
      //       //   ),
      //       // ),
      //       badgeContent: Container(
      //         height: 18,
      //         width: 18,
      //         alignment: Alignment.center,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(100),
      //           color: context.theme.mainColor,
      //         ),
      //         child: Text(
      //           '$v',
      //           style: const TextStyle(
      //             fontSize: 12,
      //             color: Colors.white,
      //           ),
      //         ),
      //       ),
      //       badgeAnimation: const badges.BadgeAnimation.rotation(
      //         animationDuration: Duration(seconds: 1),
      //         colorChangeAnimationDuration: Duration(seconds: 1),
      //         // loopAnimation: true,
      //         curve: Curves.fastOutSlowIn,
      //         colorChangeAnimationCurve: Curves.easeInCubic,
      //       ),
      //       badgeStyle: badges.BadgeStyle(
      //         padding: EdgeInsets.zero,
      //         badgeColor: context.theme.mainColor.withOpacity(0.1),
      //         elevation: 0,
      //       ),
      //       child: context.theme.whenByValue(
      //         light: SvgPicture.asset(
      //           tabIndex == currentIndex ? activeIcon : icon,
      //         ),
      //         dark: SvgPicture.asset(
      //           tabIndex == currentIndex ? darkActiveIcon : darkIcon,
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
