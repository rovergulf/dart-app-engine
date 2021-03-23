import 'package:dapp_example/pages/home.dart';
import 'package:dapp_example/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/dapp_example_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeRoute(),
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => AppLocalizations.of(context).appTitle,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      localeResolutionCallback:
          (locale, supportedLocales) {
        return locale;
      },
    );
  }
}