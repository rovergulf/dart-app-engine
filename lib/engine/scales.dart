import 'package:flutter/material.dart';

@immutable
class AppEngineTextScaleValue {
  const AppEngineTextScaleValue(this.scale, this.label);

  final double? scale;
  final String label;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is AppEngineTextScaleValue &&
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

const List<AppEngineTextScaleValue> kAllAppEngineTextScaleValues = <AppEngineTextScaleValue>[
  AppEngineTextScaleValue(null, 'System Default'),
  AppEngineTextScaleValue(0.8, 'Small'),
  AppEngineTextScaleValue(1.0, 'Normal'),
  AppEngineTextScaleValue(1.3, 'Large'),
  AppEngineTextScaleValue(2.0, 'Huge'),
];

@immutable
class AppEngineVisualDensityValue {
  const AppEngineVisualDensityValue(this.visualDensity, this.label);

  final VisualDensity visualDensity;
  final String label;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is AppEngineVisualDensityValue &&
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

const List<AppEngineVisualDensityValue> kAllAppEngineVisualDensityValues =
    <AppEngineVisualDensityValue>[
  AppEngineVisualDensityValue(VisualDensity.standard, 'System Default'),
  AppEngineVisualDensityValue(VisualDensity.comfortable, 'Comfortable'),
  AppEngineVisualDensityValue(VisualDensity.compact, 'Compact'),
  AppEngineVisualDensityValue(
      VisualDensity(horizontal: -3, vertical: -3), 'Very Compact'),
];
