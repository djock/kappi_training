enum programType { weightlifting, bodyweight, crossfit }
enum programPracticeType { constant }

class ProgramModel {
  final int id;
  final String name;

  ProgramModel(this.id, this.name);

  ProgramModel.fromJson(Map<String, dynamic> json) :
      id = json['id'],
      name = json['name'];

  static List<ProgramModel> fromJsonList(json) {
    return json.map<ProgramModel>((obj) => ProgramModel.fromJson(obj)).toList();
  }
}