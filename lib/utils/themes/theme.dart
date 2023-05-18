import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData agriplantLight = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    shadowColor: Colors.black12,
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),

  textTheme: GoogleFonts.interTextTheme(
    TextTheme(
      displayLarge: GoogleFonts.inter(fontWeight: FontWeight.w600),
      displayMedium: GoogleFonts.inter(fontWeight: FontWeight.w600),
      displaySmall: GoogleFonts.inter(fontWeight: FontWeight.w600),
      //--------------
      headlineLarge: GoogleFonts.inter(fontWeight: FontWeight.w600),
      headlineMedium: GoogleFonts.inter(fontWeight: FontWeight.w600),
      headlineSmall: GoogleFonts.inter(fontWeight: FontWeight.w600),
      //--------------
      titleLarge: GoogleFonts.inter(fontWeight: FontWeight.w400),
      titleMedium: GoogleFonts.inter(fontWeight: FontWeight.w400),
      titleSmall: GoogleFonts.inter(fontWeight: FontWeight.w400),
      //--------------
      labelLarge: GoogleFonts.inter(fontWeight: FontWeight.w600),
      labelMedium: GoogleFonts.inter(fontWeight: FontWeight.w600),
      labelSmall: GoogleFonts.inter(fontWeight: FontWeight.w600),
      //--------------
      bodyLarge: GoogleFonts.inter(fontWeight: FontWeight.w400),
      bodyMedium: GoogleFonts.inter(fontWeight: FontWeight.w400),
      bodySmall: GoogleFonts.inter(fontWeight: FontWeight.w400),
    ),
  ),

  // fontFamily: GoogleFonts.openSans().fontFamily,
);
