import 'package:flutter/material.dart';
import 'package:kappi_training/models/program_model.dart';
import 'package:kappi_training/utilities/app_state.dart';
import 'package:kappi_training/utilities/utils.dart';
import 'package:kappi_training/widgets/programs/program_level_widget.dart';
import 'package:kappi_training/widgets/programs/program_workout_widget.dart';
import 'package:kappi_training/widgets/safe_screen.dart';
import 'package:kappi_training/widgets/programs/program_workout_widget.dart';

class ProgramDetailsScreen extends StatelessWidget  {
  final ProgramModel programModel;

  const ProgramDetailsScreen({Key key, this.programModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeScreen(
        appBar: Utils.buildAppBar(context, programModel.name,),
        body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildProgramDetails(),
              ),
            )));
  }

  List<Widget> _buildProgramDetails() {
    List<Widget> result = new List<Widget>();

    if(programModel.levelsCount > 1) {
      var index = 1;
      for(var item in programModel.levels) {
        result.add(ProgramLevelWidget(levelModel: item, index: index, levelName: programModel.levelsName,));
        result.add(SizedBox(height: 10,));
        index++;
      }
    } else {
      var firstLevel = programModel.levels.first;
      for(var item in firstLevel.workouts) {
        var currentWorkout = AppState.getWorkoutById(item);

        if(currentWorkout != null)
          result.add(ProgramWorkoutWidget(workoutModel: currentWorkout));
      }
    }

    result.add(SizedBox(height: 5,));

    return result;
  }
}
