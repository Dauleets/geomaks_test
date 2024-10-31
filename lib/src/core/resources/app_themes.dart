part of 'resources.dart';

mixin AppTheme {
  static ThemeData get light => ThemeData(
        // fontFamily: FontFamily.inter,
        scaffoldBackgroundColor: AppColors.background,
        brightness: Brightness.light,
        primaryColor: AppColors.mainColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          // systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: AppColors.background,
          titleTextStyle: TextStyle(color: Colors.black),
        ),

        // useMaterial3: true,
        // colorSchemeSeed: AppColors.kPrimary,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.base50,
          modalBarrierColor: Color.fromRGBO(0, 0, 0, 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.mainColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.base200,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: AppColors.base500,
          ),
          errorStyle: const TextStyle(
            fontSize: 13,
            color: AppColors.red,
          ),
          counterStyle: const TextStyle(
            fontSize: 11,
            color: AppColors.base500,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey2),
            borderRadius: BorderRadius.circular(12),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey2),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.mainColor,
            ),
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black,
          labelStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelColor: AppColors.base300,
          unselectedLabelStyle: TextStyle(
            fontSize: 11,
          ),
        ),
        dialogTheme: const DialogTheme(),
        dialogBackgroundColor: AppColors.base50,
      );

  static ThemeData get dark => ThemeData(
        // fontFamily: FontFamily.inter,
        scaffoldBackgroundColor: AppDarkColors.base100,
        brightness: Brightness.dark,
        primaryColor: AppDarkColors.mainColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          // systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: AppDarkColors.base50,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        // useMaterial3: true,
        // colorSchemeSeed: AppColors.kPrimary,
        bottomSheetTheme: const BottomSheetThemeData(
          modalBarrierColor: Color.fromRGBO(0, 0, 0, 0.6),
          backgroundColor: AppDarkColors.base50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppDarkColors.mainColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppDarkColors.base200,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: AppDarkColors.base500,
          ),
          errorStyle: const TextStyle(
            fontSize: 13,
            color: AppDarkColors.red,
          ),
          counterStyle: const TextStyle(
            fontSize: 11,
            color: AppDarkColors.base500,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(16),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppDarkColors.red),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppDarkColors.red),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(16),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppDarkColors.mainColor,
            ),
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelColor: AppDarkColors.base200,
          unselectedLabelStyle: TextStyle(
            fontSize: 11,
          ),
        ),
        dialogTheme: const DialogTheme(),
        dialogBackgroundColor: AppDarkColors.base50,
      );
}

mixin AppDecorations {
  static const List<Color> gradientColors = [
    Color(0xff4296F8),
    Color(0xff0055DD),
  ];

  static const List<BoxShadow> accountTabDropShadow = [
    BoxShadow(
      blurRadius: 4,
      offset: Offset(0, 4),
      color: Color.fromRGBO(0, 0, 0, 0.25),
    ),
  ];

  static const List<BoxShadow> appBarButtonShadows = [
    BoxShadow(
      blurRadius: 5,
      color: Color.fromRGBO(0, 0, 0, 0.05),
    ),
    BoxShadow(
      blurRadius: 35,
      offset: Offset(0, 25),
      color: Color.fromRGBO(0, 0, 0, 0.07),
    ),
  ];
}
