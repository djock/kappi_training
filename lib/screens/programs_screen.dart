import 'package:flutter/material.dart';
import 'package:kappi_training/services/firebase_remote_config_service.dart';
import 'package:kappi_training/utilities/safe_screen.dart';

class ProgramsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeScreen(
      appBar: AppBar(
        title: Text('Programs'),
        centerTitle: true,
      ),
      body: Container(
          child: ListView.builder(
              itemCount: FirebaseRemoteConfigService.programs.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    leading: SizedBox(
                        child: IconButton(
                      icon: Icon(Icons.fitness_center, color: Colors.red),

                      onPressed: null, // null disables the button
                    )),
                    title:
                        Text(FirebaseRemoteConfigService.programs[index].name),
                    onTap: null);
              })),
    );
  }
}
