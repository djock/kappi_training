import 'package:flutter/material.dart';
import 'package:kappi_training/screens/programs_screen.dart';
import 'package:kappi_training/services/firebase_remote_config_service.dart';
import 'package:kappi_training/utilities/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseRemoteConfigService.init();

    return MaterialApp(
      title: 'Kappi',
      theme: appTheme(),
      home: ProgramsScreen(),
    );
  }
}
