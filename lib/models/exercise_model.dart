class ExerciseModel {
  final int id;
  final String name;
  final String order;
  final int sets;
  final int reps;
  final int time;
  final String category;
  final int weight;

  ExerciseModel.fromJson(Map<String, dynamic> json)
      : id = json['exerciseId'],
        name = json['exerciseName'],
        order = json['order'],
        sets = json['sets'],
        reps = json['reps'],
        time = json['time'],
        weight = json['weight'],
        category = json['category'];

  static List<ExerciseModel> fromJsonList(json) {
    return json
        .map<ExerciseModel>((obj) => ExerciseModel.fromJson(obj))
        .toList();
  }
}
