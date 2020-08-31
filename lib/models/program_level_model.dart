class ProgramLevelModel {
  final int daysPerWeek;
  final List<int> workouts;

  ProgramLevelModel(this.daysPerWeek, this.workouts);

  ProgramLevelModel.fromJson(Map<String, dynamic> json) :
        daysPerWeek = json['daysPerWeek'],
        workouts = _buildActivities(json['workouts']);

  static List<ProgramLevelModel> fromJsonList(json) {
    return json.map<ProgramLevelModel>((obj) => ProgramLevelModel.fromJson(obj)).toList();
  }

  static List<int> _buildActivities(List node) {
    List<int> result = new List<int>();

    for(var item in node) {
      result.add(item);
    }

    return result;
  }
}