import 'package:flutter/material.dart';

class AppTheme {
  static const _primaryDark = Color(0xFF1E1E1E);
  static const _primaryLight = Color(0xFFF5F5F5);

  // Dark Theme (Default)
  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: _primaryDark,
    scaffoldBackgroundColor: _primaryDark,
    colorScheme: ColorScheme.dark(
      primary: Colors.red.shade700,
      secondary: Colors.red.shade300,
      surface: _primaryDark,
      background: _primaryDark,
    ),
  );

  // Light Theme
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: _primaryLight,
    scaffoldBackgroundColor: _primaryLight,
    colorScheme: ColorScheme.light(
      primary: Colors.blue.shade700,
      secondary: Colors.blue.shade300,
      surface: _primaryLight,
      background: _primaryLight,
    ),
  );

  // Brutal Theme
  static final brutalTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1A1A1A),
    scaffoldBackgroundColor: const Color(0xFF1A1A1A),
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFFFF3D00),
      secondary: const Color(0xFFFF6E40),
      surface: const Color(0xFF1A1A1A),
      background: const Color(0xFF1A1A1A),
    ),
  );

  // Elegant Theme
  static final elegantTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1A237E),
    scaffoldBackgroundColor: const Color(0xFF1A237E),
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF1A237E),
      secondary: const Color(0xFFFFD700),
      surface: const Color(0xFF1A237E),
      background: const Color(0xFF1A237E),
    ),
  );

  // Cute Theme
  static final cuteTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: const Color(0xFFFFE4E1),
    scaffoldBackgroundColor: const Color(0xFFFFE4E1),
    colorScheme: ColorScheme.light(
      primary: const Color(0xFFFF69B4),
      secondary: const Color(0xFFFFB6C1),
      surface: const Color(0xFFFFE4E1),
      background: const Color(0xFFFFE4E1),
    ),
  );

  // Nature Theme
  static final natureTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: const Color(0xFFE8F5E9),
    scaffoldBackgroundColor: const Color(0xFFE8F5E9),
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF2E7D32),
      secondary: const Color(0xFF8D6E63),
      surface: const Color(0xFFE8F5E9),
      background: const Color(0xFFE8F5E9),
    ),
  );
} 