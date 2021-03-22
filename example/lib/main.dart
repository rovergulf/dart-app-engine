import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

import 'package:dapp_example/routes/home/home.dart';

void main() {
  runApp(DappExample());
}

class DappExample extends StatefulWidget {
  @override
  _DappExampleState createState() => _DappExampleState();
}

class _DappExampleState extends State<DappExample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeRoute,
    );
  }
}
