import 'package:flutter/material.dart';
import 'package:kappi_training/models/exercise_model.dart';
import 'package:kappi_training/models/workout_model.dart';
import 'package:kappi_training/utilities/app_theme.dart';
import 'package:kappi_training/widgets/safe_screen.dart';
import 'package:kappi_training/utilities/utils.dart';
import 'package:kappi_training/widgets/exercises/exercise_widget.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  final WorkoutModel workout;

  const WorkoutDetailsScreen({Key key, this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeScreen(
        appBar: Utils.buildAppBar(context, workout.name),
        body: SingleChildScrollView(
            child: Container(
//              decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                      begin: Alignment.bottomLeft,
//                      end: Alignment.topRight,
//                      colors: [AppColors.mainColor, Colors.redAccent])),
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: _buildWorkout(),
          ),
        )));
  }

  List<Widget> _buildWorkout() {
    Map<String, List<Exercise>> groupedExercises =
        new Map<String, List<Exercise>>();

    for (var exercise in workout.exercises) {
      if (!groupedExercises.containsKey(exercise.category))
        groupedExercises[exercise.category] = new List<Exercise>();

      groupedExercises[exercise.category].add(exercise);
    }

    List<Widget> result = new List<Widget>();

    groupedExercises.forEach((key, value) {
      result.add(_buildExercisesGroup(value, key.toUpperCase()));
    });

    result.add(SizedBox(
      height: 5,
    ));

    return result;
  }

  Widget _buildExercisesGroup(List<Exercise> exercises, String title) {
    if (exercises != null && exercises.length != 0) {
      String groupTitle = '';
      if (workout.type == 'crossfit') {
        if (workout.variation.isNotEmpty) {
          groupTitle += workout.variation.toUpperCase();
        }

        if (workout.timeToComplete != 0) {
          groupTitle += ' ${Utils.formatTimeShort(workout.timeToComplete)}';
        }
      }

      if (groupTitle.isEmpty) groupTitle = title;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
            child: Text(groupTitle,
                textAlign: TextAlign.start,
                style: AppTheme.mediumTextDarkBoldStyle()),
          ),
          Divider(),
          Column(
            children: _buildExercisesList(exercises),
          )
        ],
      );
    } else
      return SizedBox();
  }

  List<Widget> _buildExercisesList(List<Exercise> exercises) {
    List<Widget> result = new List<Widget>();

    for (var exercise in exercises) {
      result.add(ExerciseWidget(
        exercise: exercise,
      ));
    }

    return result;
  }

  Widget _buildTitle() {
    if (workout.type == 'crossfit') {}
  }
}
