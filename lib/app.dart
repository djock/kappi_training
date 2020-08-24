import 'package:flutter/material.dart';
import 'package:kappi_training/screens/loading_screen.dart';
import 'package:kappi_training/screens/programs_screen.dart';
import 'package:kappi_training/services/firebase_remote_config_service.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool hasFinishedLoading = false;

  @override
  void initState() {
    FirebaseRemoteConfigService.init().then((value) => {
        if (this.mounted)
        {
          setState(() {
            hasFinishedLoading = true;
          })
        }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return hasFinishedLoading
        ? ProgramsScreen()
        : LoadingScreen();
  }
}
