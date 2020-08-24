class ProgramPhaseModel {
  final int daysPerWeek;
  final List<int> activities;

  ProgramPhaseModel(this.daysPerWeek, this.activities);

  ProgramPhaseModel.fromJson(Map<String, dynamic> json) :
        daysPerWeek = json['daysPerWeek'],
        activities = _buildActivities(json['activities']);

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