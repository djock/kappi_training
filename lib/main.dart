import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kappi_training/app.dart';
import 'package:kappi_training/utilities/app_theme.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kappi',
      theme: appTheme(),
      home: App(),
    );
  }
}