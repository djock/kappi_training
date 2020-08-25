class Exercise {
  final int id;
  final String name;
  final String order;
  final int sets;
  final int reps;
  final int time;
  final String category;
  final int weight;

  Exercise.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        order = json['order'],
        sets = json['sets'],
        reps = json['reps'],
        time = json['time'],
        weight = json['weight'],
        category = json['category'];

  static List<Exercise> fromJsonList(json) {
    return json
        .map<Exercise>((obj) => Exercise.fromJson(obj))
        .toList();
  }
}
