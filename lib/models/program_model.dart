import 'package:kappi_training/models/program_level_model.dart';

enum programType { weightlifting, bodyweight, crossfit }
enum programPracticeType { constant }

class ProgramModel {
  final int id;
  final String name;
  final String author;
  final String type;
  final int levelsCount;
  final String levelsName;
  final List<ProgramLevelModel> levels;

  ProgramModel(this.id, this.name, this.levelsCount, this.levels, this.author, this.type, this.levelsName);

  ProgramModel.fromJson(Map<String, dynamic> json) :
      id = json['id'],
      name = json['name'],
      author = json['author'],
      type = json['type'],
      levelsCount = json['levelsCount'],
      levelsName = json['levelsName'],
      levels = _buildLevels(json['levels']);

  static List<ProgramModel> fromJsonList(json) {
    return json.map<ProgramModel>((obj) => ProgramModel.fromJson(obj)).toList();
  }

  static List<ProgramLevelModel> _buildLevels(List nodes) {
    List<ProgramLevelModel> result = new List<ProgramLevelModel>();

    result = ProgramLevelModel.fromJsonList(nodes);

    return result;
  }
}