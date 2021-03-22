import 'package:flutter/material.dart';

@immutable
class AppTextScaleValue {
  const AppTextScaleValue(this.scale, this.label);

  final double? scale;
  final String label;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is AppTextScaleValue &&
        other.scale == scale &&
        other.label == label;
  }

  @override
  int get hashCode => hashValues(scale, label);

  @override
  String toString() {
    return '$runtimeType($label)';
  }
}

const List<AppTextScaleValue> kAllAppTextScaleValues = <AppTextScaleValue>[
  AppTextScaleValue(null, 'System Default'),
  AppTextScaleValue(0.8, 'Small'),
  AppTextScaleValue(1.0, 'Normal'),
  AppTextScaleValue(1.3, 'Large'),
  AppTextScaleValue(2.0, 'Huge'),
];

@immutable
class AppVisualDensityValue {
  const AppVisualDensityValue(this.visualDensity, this.label);

  final VisualDensity visualDensity;
  final String label;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is AppVisualDensityValue &&
        other.visualDensity == visualDensity &&
        other.label == label;
  }

  @override
  int get hashCode => hashValues(visualDensity, label);

  @override
  String toString() {
    return '$runtimeType($label)';
  }
}

const List<AppVisualDensityValue> kAllAppVisualDensityValues =
    <AppVisualDensityValue>[
  AppVisualDensityValue(VisualDensity.standard, 'System Default'),
  AppVisualDensityValue(VisualDensity.comfortable, 'Comfortable'),
  AppVisualDensityValue(VisualDensity.compact, 'Compact'),
  AppVisualDensityValue(
      VisualDensity(horizontal: -3, vertical: -3), 'Very Compact'),
];
