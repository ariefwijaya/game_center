import 'package:flutter/material.dart';
import 'package:game_center/config/themes/dark_theme.dart';
import 'package:google_fonts/google_fonts.dart';

import 'light_theme.dart';

/// Enumeration of available themes in the app
///
/// [AppTheme.primaryLight] for Light Theme
/// or [AppTheme.primaryDark] for Dark/Night Theme
enum AppTheme {
  /// Key of light theme apps
  primaryLight,

  /// Key of Dark theme apps
  primaryDark
}

// The array of Theme Data that keep Available themes
final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.primaryLight: ThemeData(
      scaffoldBackgroundColor: LightTheme.neutralWhite,
      backgroundColor: LightTheme.neutralWhite,
      primaryColor: LightTheme.tiger,
      focusColor: LightTheme.tiger,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: LightTheme.tiger,
        selectionColor: LightTheme.ashGrey,
        selectionHandleColor: LightTheme.tiger,
      ),
      brightness: Brightness.light,
      primaryColorDark: LightTheme.doffBlack,
      primaryColorLight: LightTheme.neutralWhite,
      splashColor: LightTheme.neutralWhite,
      errorColor: LightTheme.raspberry,
      disabledColor: LightTheme.ashGrey,
      canvasColor: Colors.white,
      colorScheme: ColorScheme.light(
          secondary: LightTheme.doffBlack, primary: LightTheme.tiger),
      unselectedWidgetColor: LightTheme.borderShade,
      hintColor: LightTheme.borderShade,
      dividerColor: LightTheme.borderShade,
      switchTheme: SwitchThemeData(
          overlayColor: MaterialStateProperty.resolveWith((states) =>
              (states.contains(MaterialState.disabled))
                  ? LightTheme.torque
                  : LightTheme.ashGrey),
          trackColor: MaterialStateProperty.resolveWith((states) =>
              (states.contains(MaterialState.disabled))
                  ? LightTheme.doffBlack.withOpacity(0.5)
                  : Colors.white)),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) => (states.contains(MaterialState.disabled))
              ? LightTheme.ashGrey
              : LightTheme.tiger),
          checkColor: MaterialStateProperty.all(Colors.white),
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1.5, color: LightTheme.ashGrey),
              borderRadius: BorderRadius.circular(4))),
      appBarTheme: const AppBarTheme(
        backgroundColor: LightTheme.neutralWhite,
        elevation: 0,
        iconTheme: IconThemeData(color: LightTheme.doffBlack),
        titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: LightTheme.doffBlack),
      ),
      textTheme: GoogleFonts.montserratAlternatesTextTheme(const TextTheme(button: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: LightTheme.doffBlack), headline1: TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color: LightTheme.doffBlack), headline2: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: LightTheme.doffBlack), headline3: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: LightTheme.doffBlack), headline4: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: LightTheme.doffBlack), headline5: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: LightTheme.doffBlack), bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: LightTheme.doffBlack), bodyText2: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: LightTheme.doffBlack), caption: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: LightTheme.doffBlack), subtitle1: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: LightTheme.doffBlack), subtitle2: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: LightTheme.doffBlack)))),
  // Dark Theme Data that will be used in the future. Still not used.
  AppTheme.primaryDark: ThemeData(
      scaffoldBackgroundColor: DarkTheme.neutralBlack,
      backgroundColor: DarkTheme.neutralBlack,
      primaryColor: DarkTheme.tiger,
      focusColor: DarkTheme.tiger,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: DarkTheme.tiger,
        selectionColor: DarkTheme.ashGrey,
        selectionHandleColor: DarkTheme.tiger,
      ),
      brightness: Brightness.dark,
      primaryColorDark: DarkTheme.neutralBlack,
      primaryColorLight: DarkTheme.doffWhite,
      splashColor: DarkTheme.neutralBlack,
      errorColor: DarkTheme.raspberry,
      disabledColor: DarkTheme.ashGrey,
      canvasColor: Colors.white,
      colorScheme: ColorScheme.dark(
          secondary: DarkTheme.doffWhite, primary: DarkTheme.tiger),
      unselectedWidgetColor: DarkTheme.borderShade,
      hintColor: DarkTheme.borderShade,
      dividerColor: DarkTheme.borderShade,
      switchTheme: SwitchThemeData(
          overlayColor: MaterialStateProperty.resolveWith((states) =>
              (states.contains(MaterialState.disabled))
                  ? DarkTheme.torque
                  : DarkTheme.ashGrey),
          trackColor: MaterialStateProperty.resolveWith((states) =>
              (states.contains(MaterialState.disabled))
                  ? DarkTheme.doffWhite.withOpacity(0.5)
                  : Colors.white)),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) => (states.contains(MaterialState.disabled))
              ? LightTheme.ashGrey
              : LightTheme.tiger),
          checkColor: MaterialStateProperty.all(Colors.white),
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1.5, color: LightTheme.ashGrey),
              borderRadius: BorderRadius.circular(4))),
      appBarTheme: const AppBarTheme(
        backgroundColor: DarkTheme.neutralBlack,
        elevation: 0,
        iconTheme: IconThemeData(color: DarkTheme.doffWhite),
        titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: DarkTheme.doffWhite),
      ),
      textTheme: GoogleFonts.montserratAlternatesTextTheme(const TextTheme(button: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, 
      color:  DarkTheme.doffWhite), headline1: TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color:  DarkTheme.doffWhite), headline2: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color:  DarkTheme.doffWhite), headline3: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color:  DarkTheme.doffWhite), headline4: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color:  DarkTheme.doffWhite), headline5: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color:  DarkTheme.doffWhite), bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color:  DarkTheme.doffWhite), bodyText2: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color:  DarkTheme.doffWhite), caption: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color:  DarkTheme.doffWhite), subtitle1: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color:  DarkTheme.doffWhite), subtitle2: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color:  DarkTheme.doffWhite)))),
};

extension ColorSchemeExtension on ThemeData {
  MaterialColor get primaryMaterialColor => LightTheme.tiger;

  Color get success =>
      brightness == Brightness.light ? LightTheme.torque : LightTheme.torque;
  Color get successLight =>
      brightness == Brightness.light ? LightTheme.tango : LightTheme.tango;

  Color get error => brightness == Brightness.light
      ? LightTheme.raspberry
      : LightTheme.raspberry;

  Color get warning =>
      brightness == Brightness.light ? LightTheme.sunglow : LightTheme.sunglow;

  Color get successLow => brightness == Brightness.light
      ? const Color(0xFFDFFFFD)
      : const Color(0xFFDFFFFD);

  Color get errorLow => brightness == Brightness.light
      ? const Color(0xFFFFDDEA)
      : const Color(0xFFFFDDEA);

  Color get warningLow => brightness == Brightness.light
      ? const Color(0xFFFAF4E1)
      : const Color(0xFFFAF4E1);
  Color get subheadingColor => brightness == Brightness.light
      ? LightTheme.textGrey
      : LightTheme.textGrey;

  BoxShadow get shadow1 => brightness == Brightness.light
      ? const BoxShadow(
          offset: Offset(2, 2), blurRadius: 4, color: Color(0xff231f20))
      : const BoxShadow();

  BoxShadow get shadow2 => brightness == Brightness.light
      ? const BoxShadow(
          offset: Offset(4, 4), blurRadius: 16, color: Color(0xff000000))
      : const BoxShadow();

  BoxShadow get shadow3 => brightness == Brightness.light
      ? const BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 8,
          spreadRadius: 1,
          color: Color(0xFF000000))
      : const BoxShadow();
}
