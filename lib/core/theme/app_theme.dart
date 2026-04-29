import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFF6C63FF);
  static const Color secondary = Color(0xFF3EC6E0);
  static const Color error = Color(0xFFFF5C6C);
  static const Color success = Color(0xFF4CAF50);
  
  // Dark colors
  static const Color darkBackground = Color(0xFF0F0F1A);
  static const Color darkSurface = Color(0xFF1C1C2E);
  static const Color darkOnSurface = Color(0xFFE0E0FF);

  // Light colors
  static const Color lightBackground = Color(0xFFF4F6F9);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF1A1A24);

  static ThemeData get darkTheme => _buildTheme(
        brightness: Brightness.dark,
        background: darkBackground,
        surface: darkSurface,
        onSurface: darkOnSurface,
        borderColor: const Color(0xFF2A2A45),
        hintColor: const Color(0xFF55556A),
      );

  static ThemeData get lightTheme => _buildTheme(
        brightness: Brightness.light,
        background: lightBackground,
        surface: lightSurface,
        onSurface: lightOnSurface,
        borderColor: const Color(0xFFE0E0E0),
        hintColor: const Color(0xFF9E9E9E),
      );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color background,
    required Color surface,
    required Color onSurface,
    required Color borderColor,
    required Color hintColor,
  }) {
    final baseTextTheme = brightness == Brightness.dark 
        ? ThemeData.dark().textTheme 
        : ThemeData.light().textTheme;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: brightness,
        primary: primary,
        secondary: secondary,
        error: error,
        surface: surface,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(baseTextTheme),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: error, width: 2),
        ),
        labelStyle: TextStyle(color: hintColor),
        hintStyle: TextStyle(color: hintColor),
        prefixIconColor: hintColor,
        errorStyle: const TextStyle(color: error, fontSize: 12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Backwards compatibility with the rest of the app
  static ThemeData get theme => darkTheme;
}
