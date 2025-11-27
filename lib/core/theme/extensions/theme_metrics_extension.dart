import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
base class ThemeMetrics extends ThemeExtension<ThemeMetrics> {
  const ThemeMetrics({
    required this.small,
    required this.medium,
    required this.large,
    required this.icon,
    required this.blur,
    required this.border,
    required this.radius,
    required this.shadow,
    required this.header,
    required this.footer,
    required this.button,
    required this.card,
    required this.buttonPadding,
    required this.field,
    required this.fieldPadding,
    required this.curve,
    required this.duration,
  });

  final double small;
  final double medium;
  final double large;
  final double icon;
  final double blur;
  final BorderSide border;
  final Radius radius;
  final BoxShadow shadow;
  final Size header;
  final Size footer;
  final Size button;
  final EdgeInsets buttonPadding;
  final ThemeCardMetrics card;
  final Size field;
  final EdgeInsets fieldPadding;
  final Curve curve;
  final Duration duration;

  @override
  ThemeExtension<ThemeMetrics> copyWith({
    double? small,
    double? medium,
    double? large,
    double? icon,
    double? blur,
    BorderSide? border,
    Radius? radius,
    BoxShadow? shadow,
    Size? header,
    Size? footer,
    Size? button,
    EdgeInsets? buttonPadding,
    ThemeCardMetrics? card,
    Size? field,
    EdgeInsets? fieldPadding,
    Curve? curve,
    Duration? duration,
  }) {
    return ThemeMetrics(
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      icon: icon ?? this.icon,
      blur: blur ?? this.blur,
      border: border ?? this.border,
      radius: radius ?? this.radius,
      shadow: shadow ?? this.shadow,
      header: header ?? this.header,
      footer: footer ?? this.footer,
      button: button ?? this.button,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      card: card ?? this.card,
      field: field ?? this.field,
      fieldPadding: fieldPadding ?? this.fieldPadding,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
    );
  }

  @override
  ThemeExtension<ThemeMetrics> lerp(
    covariant ThemeExtension<ThemeMetrics>? other,
    double t,
  ) {
    if (other is! ThemeMetrics) return this;

    return ThemeMetrics(
      small: lerpDouble(small, other.small, t)!,
      medium: lerpDouble(medium, other.medium, t)!,
      large: lerpDouble(large, other.large, t)!,
      icon: lerpDouble(icon, other.icon, t)!,
      blur: lerpDouble(blur, other.blur, t)!,
      border: t < 0.5 ? border : other.border,
      radius: .lerp(radius, other.radius, t)!,
      shadow: .lerp(shadow, other.shadow, t)!,
      header: .lerp(header, other.header, t)!,
      footer: .lerp(footer, other.footer, t)!,
      button: .lerp(button, other.button, t)!,
      buttonPadding: .lerp(buttonPadding, other.buttonPadding, t)!,
      card: card.copyWith(padding: .lerp(card.padding, other.card.padding, t)),
      field: .lerp(field, other.field, t)!,
      fieldPadding: .lerp(fieldPadding, other.fieldPadding, t)!,
      curve: t < 0.5 ? curve : other.curve,
      duration: lerpDuration(duration, other.duration, t),
    );
  }
}

class ThemeCardMetrics {
  const ThemeCardMetrics({
    required this.padding,
    required this.haveBorder,
  });

  final bool haveBorder;
  final EdgeInsets padding;

  ThemeCardMetrics copyWith({
    bool? haveBorder,
    EdgeInsets? padding,
  }) {
    return ThemeCardMetrics(
      haveBorder: haveBorder ?? this.haveBorder,
      padding: padding ?? this.padding,
    );
  }
}
