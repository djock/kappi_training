import 'package:kappi_training/models/exercise.dart';

class Workout {
  final int id;
  final String name;
  final String type;
//  final String variation;
//  final int timeToComplete;
  final List<Exercise> exercises;

  Workout(this.id, this.name, this.type, this.exercises);

  Workout.fromJson(Map<String, dynamic> json) :
      id = json['id'],
      name = json['name'],
      type = json['type'],
//      variation = json['variation'],
//      timeToComplete = json['timeToComplete'].toString().isNotEmpty ? json['timeToComplete'] : 0,
      exercises = _buildExercises(json['exercises']);

  static List<Workout> fromJsonList(json) {
    return json.map<Workout>((obj) => Workout.fromJson(obj)).toList();
  }

  static List<Exercise> _buildExercises(List node) {
    List<Exercise> result = new List<Exercise>();

    for(var exercise in node) {
      var exerciseModel = Exercise.fromJson(exercise);

      result.add(exerciseModel);
    }

    return result;
  }


}