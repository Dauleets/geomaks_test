import 'package:geomaks_test/src/core/extension/extensions.dart';
import 'package:geomaks_test/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final void Function()? onPressed;
  final ButtonStyle style;
  final double? width;
  final double? height;
  final String text;
  final bool isExpanded;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.style,
    required this.child,
    this.width,
    this.height,
    this.text = '',
    this.isExpanded = true,
    this.textColor = AppColors.static,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? (isExpanded ? double.infinity : null),
      height: height ?? 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: child ??
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: context.deviceSize.maybeWhenByValue(
                  orElse: 16,
                  smallPhone: 14,
                ),
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
      ),
    );
  }
}

class CustomButtonStyles {
  CustomButtonStyles._();

  static ButtonStyle primaryButtonStyle(
    BuildContext context, {
    double elevation = 0,
    double radius = 18,
    double height = 56,
    Color? backgroundColor,
    Color? foregroundColor = Colors.white,
    Color? disabledForegroundColor = Colors.white,
    Color? disabledBackgroundColor,
    Color? shadowColor,
    EdgeInsetsGeometry? padding,
    BorderSide side = BorderSide.none,
  }) {
    return ElevatedButton.styleFrom(
      // padding: EdgeInsets.all(value),
      // alignment: Alignment.center,
      fixedSize: Size.fromHeight(height),
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor ?? context.theme.buttonBackgroundGrey,
      disabledForegroundColor: disabledForegroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? context.theme.mainColor.withOpacity(0.4),
      elevation: elevation,
      shadowColor: shadowColor ?? context.theme.background50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: side,
      ),
      padding: padding,
    );
  }

  static ButtonStyle primaryButtonStyle2(
    BuildContext context, {
    double elevation = 0,
    double radius = 18,
    double height = 56,
    Color? backgroundColor,
    Color? foregroundColor = Colors.white,
    Color? disabledForegroundColor = Colors.white,
    Color? disabledBackgroundColor,
    Color? shadowColor,
    EdgeInsetsGeometry? padding,
    BorderSide side = BorderSide.none,
  }) {
    return ElevatedButton.styleFrom(
      // padding: EdgeInsets.all(value),
      // alignment: Alignment.center,
      fixedSize: Size.fromHeight(height),
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor ?? AppColors.base100,
      disabledForegroundColor: disabledForegroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? context.theme.mainColor.withOpacity(0.4),
      elevation: elevation,
      shadowColor: shadowColor ?? context.theme.background50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: side,
      ),
      padding: padding,
    );
  }

  static ButtonStyle primaryWhiteWithBorderButtonStyle({
    double elevation = 0,
    double radius = 18,
    Color? backgroundColor = AppColors.static,
    Color? borderColor,
    // Color? foregroundColor = AppColors.kWhite,
    // Color? disabledBackgroundColor = AppColors.kGrey200,
    Color? shadowColor = const Color.fromRGBO(255, 255, 255, 1),
    BorderRadiusGeometry? borderRadius,
  }) {
    return ElevatedButton.styleFrom(
      // foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      // disabledBackgroundColor: disabledBackgroundColor,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side:  BorderSide(
          width: 2,
          color: borderColor ?? AppColors.mainColor,
        ),
      ),
    );
  }

  static ButtonStyle primaryGreyButton({
    double elevation = 0,
    double radius = 18,
  }) {
    return ElevatedButton.styleFrom(
      // foregroundColor: foregroundColor,
      backgroundColor: AppColors.mainGrey,
      shadowColor: AppColors.mainGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      // disabledBackgroundColor: disabledBackgroundColor,
      elevation: elevation,
    );
  }

  static ButtonStyle primaryGrey2Button({
    double elevation = 0,
    double radius = 18,
  }) {
    return ElevatedButton.styleFrom(
      // foregroundColor: foregroundColor,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.19),
      shadowColor: AppColors.mainGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      // disabledBackgroundColor: disabledBackgroundColor,
      elevation: elevation,
    );
  }

  static ButtonStyle primaryBlueButton({
    double elevation = 0,
    double radius = 18,
    Color? backgroundColor = AppColors.blue2,
    // Color? foregroundColor = AppColors.kWhite,
    // Color? disabledBackgroundColor = AppColors.kGrey200,
    Color? shadowColor = const Color.fromRGBO(255, 255, 255, 1),
    BorderRadiusGeometry? borderRadius,
  }) {
    return ElevatedButton.styleFrom(
      // foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,

      // disabledBackgroundColor: disabledBackgroundColor,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  static ButtonStyle primaryWithBorderButtonStyle(
    BuildContext context, {
    double elevation = 0,
    double radius = 18,
    Color color = AppColors.blue2,
  }) {
    return ElevatedButton.styleFrom(
      // foregroundColor: AppColors.kYellow,
      backgroundColor: Colors.white,
      elevation: elevation,
      // shadowColor: Colors.white,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: BorderSide(
          color: color,
          width: 2,
        ),
      ),
    );
  }

  static ButtonStyle withYellowBorderButtonStyle({
    double elevation = 0,
    double height = 48,
    double radius = 4,
  }) {
    return ElevatedButton.styleFrom(
      maximumSize: const Size.fromHeight(48),
      foregroundColor: Colors.transparent,
      // backgroundColor: AppColors.kWhite,
      shadowColor: Colors.transparent,
      elevation: elevation,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      side: const BorderSide(
          // color: AppColors.kYellow,
          ),
    );
  }

// ignore: long-parameter-list
  static ButtonStyle primaryYellowButtonStyle({
    double elevation = 0,
    double radius = 18,
    // Color? backgroundColor = AppColors.kPrimary,
    // Color? foregroundColor = AppColors.kWhite,
    // Color? disabledBackgroundColor = AppColors.kGrey200,
    Color? shadowColor = const Color.fromRGBO(255, 255, 255, 1),
    BorderRadiusGeometry? borderRadius,
  }) {
    return ElevatedButton.styleFrom(
      // foregroundColor: foregroundColor,
      // backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      // disabledBackgroundColor: disabledBackgroundColor,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
        // side: const BorderSide(color: Colors.white),
      ),
    );
  }

  static ButtonStyle lightYellowButtonStyle({
    double elevation = 0,
    double height = 48,
    double radius = 18,
  }) {
    return ElevatedButton.styleFrom(
      maximumSize: Size.fromHeight(height),
      foregroundColor: Colors.white,
      // backgroundColor: AppColors.kYellow.withOpacity(0.55),
      shadowColor: Colors.white,
      elevation: elevation,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  static ButtonStyle greenWithBorderButtonStyle(
    BuildContext context, {
    double elevation = 0,
    double radius = 18,
    Color color = AppColors.green,
    Color? bgColors = AppColors.green,
  }) {
    return ElevatedButton.styleFrom(
      // foregroundColor: AppColors.kYellow,
      backgroundColor: bgColors ?? Colors.white,
      elevation: elevation,
      // shadowColor: Colors.white,
      padding: EdgeInsets.zero,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: BorderSide(
          color: color,
          width: 2,
        ),
      ),
    );
  }
}
