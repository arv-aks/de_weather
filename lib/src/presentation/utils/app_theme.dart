import 'package:flutter/material.dart';

class AppTheme {
  static const accentColor = Color(0xff0C54BE);
  static const onPrimaryColor = Color(0xff303F60);

  static const _pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  /// Light style
  static final ThemeData light = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    // highlightColor: const Color(0xffE0E0E0),
    scaffoldBackgroundColor: const Color(0xffF5F9FD),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff0C54BE), foregroundColor: Color(0xffFAFAFA)),

    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Color(0xff0C54BE)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(accentColor),
        // Set your desired background color
        textStyle: MaterialStateProperty.all(const TextStyle(
            color: Colors.white)), // Set your desired text color
        // Add more customizations as needed
      ),
    ),
    disabledColor: const Color(0xffE0E0E0),
    primaryColor: const Color(0xff0C54BE),
    iconTheme: const IconThemeData(color: onPrimaryColor),
    pageTransitionsTheme: _pageTransitionsTheme,
    fontFamily: 'Helvetica',
    textTheme: TextTheme(
      //For Appbar
      headlineLarge: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Color(0xff757575),
      ),

      headlineMedium: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: onPrimaryColor,
      ),

      //Widgets title
      headlineSmall: const TextStyle(
        fontSize: 14.0,
        letterSpacing: 0.2,
        height: 1.25,
        fontWeight: FontWeight.w300,
        color: onPrimaryColor,
      ),

      // bodyLarge: TextStyle(
      //     fontSize: 14.0,
      //     letterSpacing: 0,
      //     fontWeight: FontWeight.w400,
      //     color: Color(0xff616161)),

      bodyMedium: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w300,
        color: onPrimaryColor,
      ),

      bodySmall: const TextStyle(
          fontSize: 12.0,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          color: Color(0xff212121)),

      titleLarge: const TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w300, color: onPrimaryColor),

      labelSmall: TextStyle(
          fontSize: 12.0,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          color: onPrimaryColor.withOpacity(0.5)),
      // Add more text styles as needed
    ),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
    colorScheme: const ColorScheme.light()
        .copyWith(
            primary: accentColor,
            secondary: accentColor,
            onSecondary: Colors.white,
            onPrimary: onPrimaryColor,
            error: const Color(0xffCA1D08))
        .copyWith(secondary: accentColor),
    dividerColor: const Color(0xffE0E0E0),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.w400,
              color: Color(0xff4368FF),
              fontSize: 14.0),
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.5)),
      checkColor: MaterialStateProperty.all(accentColor),
      fillColor: MaterialStateProperty.all(Colors.white),
      side: MaterialStateBorderSide.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const BorderSide(
            color: accentColor,
            width: 1.5,
          );
        } else {
          return const BorderSide(
            color: Color(0xffCED3DC),
            width: 1.5,
          );
        }
      }),
    ),
  );

  /// Dark style
}
