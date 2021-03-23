import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/dapp_example_localizations.dart';

class SettingsRoute extends StatefulWidget {
  static const routeName = '/';

  @override
  _SettingsRouteState createState() => _SettingsRouteState();
}

class _SettingsRouteState extends State<SettingsRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [Text('Hello world')]));
  }
}
