import 'package:kappi_training/models/exercise_model.dart';

class WorkoutModel {
  final int id;
  final String name;
  final String type;
  final String variation;
  final int timeToComplete;
  final bool canSolo;
  final List<Exercise> exercises;

  WorkoutModel(this.id, this.name, this.type, this.exercises, this.variation,
      this.timeToComplete, this.canSolo);

  WorkoutModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = _getName(json),
        type = json['type'],
        variation = json['variation'] != null ? json['variation'] : '',
        timeToComplete = _getTimeToComplete(json['timeToComplete']),
        canSolo = json['canSolo'],
        exercises = _buildExercises(json['exercises']);

  static List<WorkoutModel> fromJsonList(json) {
    return json.map<WorkoutModel>((obj) => WorkoutModel.fromJson(obj)).toList();
  }

  static List<Exercise> _buildExercises(List node) {
    List<Exercise> result = new List<Exercise>();

    for (var exercise in node) {
      var exerciseModel = Exercise.fromJson(exercise);

      result.add(exerciseModel);
    }

    return result;
  }

  static String _getName(json) {
    return json['name'];
  }

  static int _getTimeToComplete(node) {
    if (node != null) {
      if(node.toString().isNotEmpty)
        return int.parse(node.toString());

      return 0;
    }

    return 0;
  }
}
