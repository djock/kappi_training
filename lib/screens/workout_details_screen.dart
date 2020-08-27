import 'package:flutter/material.dart';
import 'package:kappi_training/models/exercise.dart';
import 'package:kappi_training/models/workout.dart';
import 'package:kappi_training/utilities/safe_screen.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  final Workout workout;

  const WorkoutDetailsScreen({Key key, this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeScreen(
        appBar: AppBar(
          title: Text(workout.name),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: _buildWorkout(),
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
    
    result.add(SizedBox(height: 5,));

    return result;
  }

  Widget _buildExercisesGroup(List<Exercise> exercises, String title) {
    if (exercises != null && exercises.length != 0) {
      return Card(
        margin: EdgeInsets.only(left: 10, right: 10, top: 13),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Text(title,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Divider(),
            Column(
              children: _buildExercisesList(exercises),
            )
          ],
        ),
      );
    } else
      return SizedBox();
  }

  List<Widget> _buildExercisesList(List<Exercise> exercises) {
    List<Widget> result = new List<Widget>();

    for (var exercise in exercises) {
      var time = exercise.time != null ? ' (${exercise.time}s)' : '';
      var weight = exercise.weight != null ? ' (${exercise.weight}kg)' : '';
      var sets = exercise.sets != null ? '${exercise.sets}' : '';
      var reps = exercise.reps != null ? 'x${exercise.reps}' : '';

      result.add(ListTile(
          leading: SizedBox(
              child: Text(
            exercise.order,
            style: TextStyle(color: Colors.black26),
          )),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                exercise.name.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(' ' + sets + reps + time + weight),
            ],
          ),
          onTap: null));
    }

    return result;
  }
}
