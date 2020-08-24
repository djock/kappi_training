import 'package:flutter/material.dart';
import 'package:kappi_training/models/program_phase.dart';
import 'package:kappi_training/screens/workout_details_screen.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/app_state.dart';

class ProgramPhaseWidget extends StatelessWidget {
  final ProgramPhaseModel phaseModel;

  const ProgramPhaseWidget({Key key, this.phaseModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 10, right: 10, top: 13),
      elevation: 2,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: phaseModel.workouts.length,
          itemBuilder: (BuildContext context, int index) {
            var currentActivity = AppState.activities.firstWhere(
                (element) => element.id == phaseModel.workouts[index]);
              return ListTile(
                  leading: SizedBox(
                      child: IconButton(
                    icon: Icon(Icons.fitness_center, color: AppColors.mainColor),

                    onPressed: null, // null disables the button
                  )),
                  title: Text(currentActivity.name),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WorkoutDetailsScreen(
                                  workout: currentActivity,
                                )));
                  });
          }),
    );
  }
}
