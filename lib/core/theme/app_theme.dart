import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/core/resources/app_colors.dart';

OutlineInputBorder _border(final Color color) => OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 3),
      borderRadius: BorderRadius.circular(10),
    );

final ThemeData primaryTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  // unselectedWidgetColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.white),
    backgroundColor: AppColors.primaryColor,
  ),
  cardTheme: const CardThemeData(color: Colors.white),
  inputDecorationTheme: InputDecorationThemeData(
    contentPadding: const EdgeInsets.all(27),
    enabledBorder: _border(AppColors.borderColor),
    focusedBorder: _border(AppColors.blackColor),
    focusedErrorBorder: _border(Colors.red),
    errorBorder: _border(Colors.red),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.primaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.blackColor,
      minimumSize: const Size(double.infinity, 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    minWidth: double.infinity,
    height: 60,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),
  colorScheme: ColorScheme(
    tertiaryContainer: AppColors.primaryColor,
    brightness: Brightness.light,
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.red,
    surface: Colors.white,
    onSurface: Colors.black,
    shadow: Colors.white.withAlpha(229),
  ),
  //primarySwatch: Colors.deepPurple,
  textTheme: TextTheme(
    //For title and subtitle used in card and container
    titleLarge: GoogleFonts.lato(
      fontSize: 25,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyLarge: GoogleFonts.lato(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.lato(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    //For Main labels like Courses, Insights, etc on HomeScreen
    labelLarge: GoogleFonts.lato(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    //For Button
    labelMedium: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    //For Bottom Nav Text
    labelSmall: GoogleFonts.lato(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    displaySmall: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  ),
  useMaterial3: true,
);

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black38,
  unselectedWidgetColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.white),
    backgroundColor: Colors.black,
  ),
  cardTheme: const CardThemeData(
    //color: cardColor,
    color: Colors.white,
  ),
  inputDecorationTheme: InputDecorationThemeData(
    contentPadding: const EdgeInsets.all(27),
    enabledBorder: _border(AppColors.borderColor),
    focusedBorder: _border(AppColors.blackColor),
    focusedErrorBorder: _border(Colors.red),
    errorBorder: _border(Colors.red),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      minimumSize: const Size(double.infinity, 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.black),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    minWidth: double.infinity,
    height: 60,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: Colors.black,
    elevation: 2,
  ),
  colorScheme: ColorScheme(
    tertiaryContainer: Colors.white,
    brightness: Brightness.dark,
    primary: Colors.black,
    onPrimary: Colors.white,
    secondary: Colors.black,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.red,
    surface: Colors.black38,
    onSurface: Colors.black,
    shadow: Colors.black.withAlpha(229),
  ),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.lato(
      fontSize: 19,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.lato(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelLarge: GoogleFonts.lato(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    labelMedium: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    labelSmall: GoogleFonts.lato(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  ),
  useMaterial3: true,
);
