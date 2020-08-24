import 'package:flutter/material.dart';
import 'package:kappi_training/screens/programs_screen.dart';
import 'package:kappi_training/services/firebase_remote_config_service.dart';
import 'package:kappi_training/utilities/app_colors.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
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
        : Scaffold(
            body: SizedBox.expand(
              child: Container(
                color: AppColors.mainColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Loading app data.', style: TextStyle(color: Color(0xfff4ecd6), fontWeight: FontWeight.bold, fontSize: 16),),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
