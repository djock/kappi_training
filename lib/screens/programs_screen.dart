import 'package:flutter/material.dart';
import 'package:kappi_training/screens/program_details_screen.dart';
import 'package:kappi_training/utilities/app_state.dart';
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
                itemCount: AppState.programs.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: SizedBox(
                          child: IconButton(
                        icon: Icon(Icons.filter_tilt_shift, color: Colors.red),
                        onPressed: null,
                      )),
                      title: Text(
                          AppState.programs[index].name),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProgramDetailsScreen(
                                  programModel: AppState.programs[index],
                                )));
                      });
                })));
  }
}
