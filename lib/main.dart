import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kappi_training/screens/loading_screen.dart';
import 'package:kappi_training/utilities/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Kappi',
      theme: appTheme(),
      home: LoadingScreen(),
    );
  }
}
