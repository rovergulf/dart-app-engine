import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/dapp_example_localizations.dart';

class HomeRoute extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {

    if (!mounted) return;

    setState(() {
      _platformVersion = 'Unknown';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).homePageTitle),
      ),
      body: Center(
        child: Text('Running on: $_platformVersion\n'),
      ),
    );
  }
}
