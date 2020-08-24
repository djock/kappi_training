class ProgramPhaseModel {
  final int daysPerWeek;
  final List<int> workouts;

  ProgramPhaseModel(this.daysPerWeek, this.workouts);

  ProgramPhaseModel.fromJson(Map<String, dynamic> json) :
        daysPerWeek = json['daysPerWeek'],
        workouts = _buildActivities(json['activities']);

  static List<ProgramPhaseModel> fromJsonList(json) {
    return json.map<ProgramPhaseModel>((obj) => ProgramPhaseModel.fromJson(obj)).toList();
  }

  static List<int> _buildActivities(List node) {
    List<int> result = new List<int>();

    for(var item in node) {
      result.add(item);
    }

    return result;
  }
}