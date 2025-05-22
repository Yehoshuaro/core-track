import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_theme.dart';

enum ThemeType {
  dark,
  light,
  brutal,
  elegant,
  cute,
  nature,
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(AppTheme.darkTheme);

  void setTheme(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.dark:
        state = AppTheme.darkTheme;
        break;
      case ThemeType.light:
        state = AppTheme.lightTheme;
        break;
      case ThemeType.brutal:
        state = AppTheme.brutalTheme;
        break;
      case ThemeType.elegant:
        state = AppTheme.elegantTheme;
        break;
      case ThemeType.cute:
        state = AppTheme.cuteTheme;
        break;
      case ThemeType.nature:
        state = AppTheme.natureTheme;
        break;
    }
  }
} 