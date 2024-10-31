import 'package:flutter/material.dart';
import 'package:geomaks_test/src/core/resources/resources.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle style;
  final List<Widget>? actions;
  final bool leadingExist;
  final bool? centerTitle;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.style,
    this.centerTitle,
    this.actions,
    required this.leadingExist,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize, // here the desired height
      child: AppBar(
        
        scrolledUnderElevation: 0,
        centerTitle: centerTitle ?? true,
        elevation: 0,
        backgroundColor: AppColors.base900,
        title: Text(
          title,
          style: style,
        ),
        // leading: leadingExist
        //     ? GestureDetector(
        //         onTap: () {
        //           context.router.maybePop(context);
        //         },
        //         child: Padding(
        //           padding: const EdgeInsets.all(13),
        //           child: SvgPicture.asset(Assets.icons.back.path)),
        //       )
        //     : Container(),
        actions: actions,
      ),
    );
  }
}
