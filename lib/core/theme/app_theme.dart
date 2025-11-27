import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabnews/core/theme/extensions/theme_colors_extension.dart';
import 'package:tabnews/core/theme/theme_colors.dart';
import 'package:tabnews/core/theme/theme_metrics.dart';

enum AppThemeColors { modern, classical, black }

class AppTheme {
  const AppTheme({
    required this.isDark,
    required this.colors,
  });

  final bool isDark;
  final AppThemeColors colors;

  ThemeData get() {
    final theme = isDark ? ThemeData.dark() : ThemeData.light();
    final colors = _getColorScheme();
    final metrics = ThemeMetricsImpl.get(colors);

    return theme.copyWith(
      scaffoldBackgroundColor: colors.background,
      cardColor: colors.surface,
      dividerColor: colors.border,
      extensions: [colors, metrics],
      iconTheme: IconThemeData(color: colors.text),
      brightness: isDark ? .dark : .light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.primary,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        secondary: colors.secondary,
        onSecondary: colors.onSecondary,
        tertiary: colors.tertiary,
        onTertiary: colors.onTertiary,
        surface: colors.surface,
        surfaceTint: colors.surface,
        onSurface: colors.onSurface,
        error: colors.danger,
        onError: colors.onDanger,
        outline: colors.border,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.secondary,
        surfaceTintColor: colors.secondary,
        foregroundColor: colors.onSecondary,
      ),
      textTheme: GoogleFonts.interTextTheme(theme.textTheme).copyWith(
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          color: colors.text,
          fontWeight: .normal,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          color: colors.text,
          fontWeight: .normal,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          color: colors.text,
          fontWeight: .normal,
        ),
        titleSmall: GoogleFonts.inter(
          fontSize: 12,
          color: colors.text,
          fontWeight: .bold,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 14,
          color: colors.text,
          fontWeight: .bold,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 16,
          color: colors.text,
          fontWeight: .bold,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 16,
          color: colors.text,
          fontWeight: .bold,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 18,
          color: colors.text,
          fontWeight: .bold,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: 24,
          color: colors.text,
          fontWeight: .bold,
        ),
      ),
    );
  }

  ThemeColors _getColorScheme() {
    late ThemeColors colors;
    switch (this.colors) {
      case AppThemeColors.modern:
        colors = const ThemeLightColors();
        if (isDark) colors = const ThemeDarkColors();
      case AppThemeColors.classical:
        colors = const ThemeClassicalLightColors();
        if (isDark) colors = const ThemeClassicalDarkColors();
      case AppThemeColors.black:
        colors = const ThemeBlackColors();
    }

    return colors;
  }
}
