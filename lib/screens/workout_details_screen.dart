import 'package:flutter/material.dart';
import 'package:kappi_training/models/exercise.dart';
import 'package:kappi_training/models/workout.dart';
import 'package:kappi_training/utilities/safe_screen.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  final Workout workout;

  const WorkoutDetailsScreen({Key key, this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var warmupExercises = workout.exercises
        .where((element) => element.category == 'warmup')
        .toList();
    var strengthExercises = workout.exercises
        .where((element) => element.category == 'strength')
        .toList();

    var benchMarkExercises = workout.exercises
        .where((element) => element.category == 'benchmark')
        .toList();
    var heroWodExercises = workout.exercises
        .where((element) => element.category == 'hero')
        .toList();

    return SafeScreen(
        appBar: AppBar(
          title: Text(workout.name),
          centerTitle: true,
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            _buildExercisesGroup(warmupExercises, 'Warm Up'),
            _buildExercisesGroup(strengthExercises, 'Strength'),
            _buildExercisesGroup(benchMarkExercises, 'Benchmark WOD'),
            _buildExercisesGroup(heroWodExercises, 'Hero WOD '),
          ],
        )));
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
            ListView.builder(
                shrinkWrap: true,
                itemCount: exercises.length,
                itemBuilder: (BuildContext context, int index) {
                  var time = exercises[index].time != null
                      ? ' (${exercises[index].time}s)'
                      : '';
                  var weight = exercises[index].weight != null
                      ? ' (${exercises[index].weight}kg)'
                      : '';
                  var sets = exercises[index].sets != null
                      ? '${exercises[index].sets}'
                      : '';
                  var reps = exercises[index].reps != null
                      ? 'x${exercises[index].reps}'
                      : '';

                  return ListTile(
                    leading: SizedBox(
                        child: Text(exercises[index].order, style: TextStyle(color: Colors.black26),)),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(exercises[index].name.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                          Text(' ' +
                              sets +
                              reps +
                              time +
                              weight),
                        ],
                      ),
                      onTap: null);
                }),
          ],
        ),
      );
    } else
      return SizedBox();
  }
}
