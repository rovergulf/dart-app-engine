import 'package:flutter/material.dart';
import 'package:dapp/scales.dart';

class AppOptions {
  const AppOptions({
    this.themeMode,
    this.textScaleFactor,
    this.visualDensity,
    this.textDirection = TextDirection.ltr,
    this.timeDilation = 1.0,
    this.platform,
    this.showOffscreenLayersCheckerboard = false,
    this.showRasterCacheImagesCheckerboard = false,
    this.showPerformanceOverlay = false,
  });

  final ThemeMode? themeMode;
  final AppTextScaleValue? textScaleFactor;
  final AppVisualDensityValue? visualDensity;
  final TextDirection textDirection;
  final double timeDilation;
  final TargetPlatform? platform;
  final bool showPerformanceOverlay;
  final bool showRasterCacheImagesCheckerboard;
  final bool showOffscreenLayersCheckerboard;

  AppOptions copyWith({
    ThemeMode? themeMode,
    AppTextScaleValue? textScaleFactor,
    AppVisualDensityValue? visualDensity,
    TextDirection? textDirection,
    double? timeDilation,
    TargetPlatform? platform,
    bool? showPerformanceOverlay,
    bool? showRasterCacheImagesCheckerboard,
    bool? showOffscreenLayersCheckerboard,
  }) {
    return AppOptions(
      themeMode: themeMode ?? this.themeMode,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      visualDensity: visualDensity ?? this.visualDensity,
      textDirection: textDirection ?? this.textDirection,
      timeDilation: timeDilation ?? this.timeDilation,
      platform: platform ?? this.platform,
      showPerformanceOverlay: showPerformanceOverlay ?? this.showPerformanceOverlay,
      showOffscreenLayersCheckerboard: showOffscreenLayersCheckerboard ?? this.showOffscreenLayersCheckerboard,
      showRasterCacheImagesCheckerboard: showRasterCacheImagesCheckerboard ?? this.showRasterCacheImagesCheckerboard,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType)
      return false;
    return other is AppOptions
        && other.themeMode == themeMode
        && other.textScaleFactor == textScaleFactor
        && other.visualDensity == visualDensity
        && other.textDirection == textDirection
        && other.platform == platform
        && other.showPerformanceOverlay == showPerformanceOverlay
        && other.showRasterCacheImagesCheckerboard == showRasterCacheImagesCheckerboard
        && other.showOffscreenLayersCheckerboard == showRasterCacheImagesCheckerboard;
  }

  @override
  int get hashCode => hashValues(
    themeMode,
    textScaleFactor,
    visualDensity,
    textDirection,
    timeDilation,
    platform,
    showPerformanceOverlay,
    showRasterCacheImagesCheckerboard,
    showOffscreenLayersCheckerboard,
  );

  @override
  String toString() {
    return '$runtimeType($themeMode)';
  }
}

const double _kItemHeight = 48.0;
const EdgeInsetsDirectional _kItemPadding = EdgeInsetsDirectional.only(start: 56.0);

class _OptionsItem extends StatelessWidget {
  const _OptionsItem({ Key? key, this.child }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final double textScaleFactor = MediaQuery.textScaleFactorOf(context);

    return MergeSemantics(
      child: Container(
        constraints: BoxConstraints(minHeight: _kItemHeight * textScaleFactor),
        padding: _kItemPadding,
        alignment: AlignmentDirectional.centerStart,
        child: DefaultTextStyle(
          style: DefaultTextStyle.of(context).style,
          maxLines: 2,
          overflow: TextOverflow.fade,
          child: IconTheme(
            data: Theme.of(context).primaryIconTheme,
            child: child!,
          ),
        ),
      ),
    );
  }
}

class _ThemeModeItem extends StatelessWidget {
  const _ThemeModeItem(this.options, this.onOptionsChanged);

  final AppOptions? options;
  final ValueChanged<AppOptions>? onOptionsChanged;

  static final Map<ThemeMode, String> modeLabels = <ThemeMode, String>{
    ThemeMode.system: 'System Default',
    ThemeMode.light: 'Light',
    ThemeMode.dark: 'Dark',
  };

  @override
  Widget build(BuildContext context) {
    return _OptionsItem(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Theme'),
                Text(
                  modeLabels[options!.themeMode!]!,
                  style: Theme.of(context).primaryTextTheme.bodyText2,
                ),
              ],
            ),
          ),
          PopupMenuButton<ThemeMode>(
            padding: const EdgeInsetsDirectional.only(end: 16.0),
            icon: const Icon(Icons.arrow_drop_down),
            initialValue: options!.themeMode,
            itemBuilder: (BuildContext context) {
              return ThemeMode.values.map<PopupMenuItem<ThemeMode>>((ThemeMode mode) {
                return PopupMenuItem<ThemeMode>(
                  value: mode,
                  child: Text(modeLabels[mode]!),
                );
              }).toList();
            },
            onSelected: (ThemeMode mode) {
              onOptionsChanged!(
                options!.copyWith(themeMode: mode),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TextScaleFactorItem extends StatelessWidget {
  const _TextScaleFactorItem(this.options, this.onOptionsChanged);

  final AppOptions? options;
  final ValueChanged<AppOptions>? onOptionsChanged;

  @override
  Widget build(BuildContext context) {
    return _OptionsItem(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Text size'),
                Text(
                  options!.textScaleFactor!.label,
                  style: Theme.of(context).primaryTextTheme.bodyText2,
                ),
              ],
            ),
          ),
          PopupMenuButton<AppTextScaleValue>(
            padding: const EdgeInsetsDirectional.only(end: 16.0),
            icon: const Icon(Icons.arrow_drop_down),
            itemBuilder: (BuildContext context) {
              return kAllAppTextScaleValues.map<PopupMenuItem<AppTextScaleValue>>((AppTextScaleValue scaleValue) {
                return PopupMenuItem<AppTextScaleValue>(
                  value: scaleValue,
                  child: Text(scaleValue.label),
                );
              }).toList();
            },
            onSelected: (AppTextScaleValue scaleValue) {
              onOptionsChanged!(
                options!.copyWith(textScaleFactor: scaleValue),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _VisualDensityItem extends StatelessWidget {
  const _VisualDensityItem(this.options, this.onOptionsChanged);

  final AppOptions? options;
  final ValueChanged<AppOptions>? onOptionsChanged;

  @override
  Widget build(BuildContext context) {
    return _OptionsItem(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Visual density'),
                Text(
                  options!.visualDensity!.label,
                  style: Theme.of(context).primaryTextTheme.bodyText2,
                ),
              ],
            ),
          ),
          PopupMenuButton<AppVisualDensityValue>(
            padding: const EdgeInsetsDirectional.only(end: 16.0),
            icon: const Icon(Icons.arrow_drop_down),
            itemBuilder: (BuildContext context) {
              return kAllAppVisualDensityValues.map<PopupMenuItem<AppVisualDensityValue>>((AppVisualDensityValue densityValue) {
                return PopupMenuItem<AppVisualDensityValue>(
                  value: densityValue,
                  child: Text(densityValue.label),
                );
              }).toList();
            },
            onSelected: (AppVisualDensityValue densityValue) {
              onOptionsChanged!(
                options!.copyWith(visualDensity: densityValue),
              );
            },
          ),
        ],
      ),
    );
  }
}
