import 'package:flutter/material.dart';

@immutable
base class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.tertiary,
    required this.onTertiary,
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.danger,
    required this.onDanger,
    required this.surface,
    required this.onSurface,
    required this.border,
    required this.text,
    required this.textAlt,
    required this.background,
  });

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color tertiary;
  final Color onTertiary;
  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color danger;
  final Color onDanger;
  final Color surface;
  final Color onSurface;
  final Color border;
  final Color text;
  final Color textAlt;
  final Color background;

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? tertiary,
    Color? onTertiary,
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
    Color? danger,
    Color? onDanger,
    Color? surface,
    Color? onSurface,
    Color? border,
    Color? text,
    Color? textAlt,
    Color? background,
  }) {
    return ThemeColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      danger: danger ?? this.danger,
      onDanger: onDanger ?? this.onDanger,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      border: border ?? this.border,
      text: text ?? this.text,
      textAlt: textAlt ?? this.textAlt,
      background: background ?? this.background,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    covariant ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) return this;

    return ThemeColors(
      primary: .lerp(primary, other.primary, t)!,
      onPrimary: .lerp(onPrimary, other.onPrimary, t)!,
      secondary: .lerp(secondary, other.secondary, t)!,
      onSecondary: .lerp(onSecondary, other.onSecondary, t)!,
      tertiary: .lerp(tertiary, other.tertiary, t)!,
      onTertiary: .lerp(onTertiary, other.onTertiary, t)!,
      success: .lerp(success, other.success, t)!,
      onSuccess: .lerp(onSuccess, other.onSuccess, t)!,
      warning: .lerp(warning, other.warning, t)!,
      onWarning: .lerp(onWarning, other.onWarning, t)!,
      danger: .lerp(danger, other.danger, t)!,
      onDanger: .lerp(onDanger, other.onDanger, t)!,
      surface: .lerp(surface, other.surface, t)!,
      onSurface: .lerp(onSurface, other.onSurface, t)!,
      border: .lerp(border, other.border, t)!,
      text: .lerp(text, other.text, t)!,
      textAlt: .lerp(textAlt, other.textAlt, t)!,
      background: .lerp(background, other.background, t)!,
    );
  }
}
