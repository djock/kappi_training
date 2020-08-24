import 'package:flutter/material.dart';
import 'package:kappi_training/models/program_model.dart';
import 'package:kappi_training/screens/activity_details_screen.dart';
import 'package:kappi_training/utilities/app_state.dart';
import 'package:kappi_training/utilities/safe_screen.dart';

class ProgramDetailsScreen extends StatelessWidget  {
  final ProgramModel programModel;

  const ProgramDetailsScreen({Key key, this.programModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phase = programModel.phases.first;

    return SafeScreen(
        appBar: AppBar(
          title: Text(programModel.name),
          centerTitle: true,
        ),
        body: Container(
            child: ListView.builder(
                itemCount: phase.activities.length,
                itemBuilder: (BuildContext context, int index) {
                  var currentActivity = AppState.activities.firstWhere((element) => element.id == phase.activities[index]);
                  return ListTile(
                      leading: SizedBox(
                          child: IconButton(
                            icon: Icon(Icons.fitness_center, color: Colors.red),

                            onPressed: null, // null disables the button
                          )),
                      title: Text(currentActivity.name),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ActivityDetailsScreen(
                                  activityModel: currentActivity,
                                )));
                      });
                })));
  }
}
