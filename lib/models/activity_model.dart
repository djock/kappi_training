import 'package:kappi_training/models/exercise_model.dart';

class ActivityModel {
  final int id;
  final String name;
  final String type;
  final List<ExerciseModel> exercises;

  ActivityModel(this.id, this.name, this.type, this.exercises);

  ActivityModel.fromJson(Map<String, dynamic> json) :
      id = json['id'],
      name = json['name'],
      type = json['type'],
      exercises = _buildExercises(json['exercises']);

  static List<ActivityModel> fromJsonList(json) {
    return json.map<ActivityModel>((obj) => ActivityModel.fromJson(obj)).toList();
  }

  static List<ExerciseModel> _buildExercises(List node) {
    List<ExerciseModel> result = new List<ExerciseModel>();

    for(var exercise in node) {
      var exerciseModel = ExerciseModel.fromJson(exercise);

      result.add(exerciseModel);
    }

    return result;
  }


}