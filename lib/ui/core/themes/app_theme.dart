import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icar/ui/core/themes/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    textTheme: GoogleFonts.interTextTheme().apply(
      bodyColor: AppColors.text,
      displayColor: AppColors.text,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary600),
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: AppColors.primary600,
      foregroundColor: AppColors.white,
      titleTextStyle: GoogleFonts.inter(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.white,
      shadowColor: AppColors.black,
      indicatorColor: AppColors.primary50,
      labelTextStyle: WidgetStateProperty<TextStyle>.fromMap(
        <WidgetStatesConstraint, TextStyle>{
          WidgetState.selected: GoogleFonts.inter(
            color: AppColors.primary600,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          WidgetState.any: GoogleFonts.inter(
            color: AppColors.gray600,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        },
      ),
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.white,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.gray50),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.primary600,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.error600,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.error600,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ),
  );
}
