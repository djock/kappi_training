import 'package:kappi_training/models/program_phase.dart';

enum programType { weightlifting, bodyweight, crossfit }
enum programPracticeType { constant }

class Program {
  final int id;
  final String name;
  final String author;
  final String type;
  final int phasesCount;
  final bool favourite;
  final List<ProgramPhaseModel> phases;

  Program(this.id, this.name, this.phasesCount, this.phases, this.author, this.type, this.favourite);

  Program.fromJson(Map<String, dynamic> json) :
      id = json['id'],
      name = json['name'],
      author = json['author'],
      type = json['type'],
      phasesCount = json['levelsCount'],
      favourite = json['favourite'],
      phases = _buildPhases(json['levels']);

  static List<Program> fromJsonList(json) {
    return json.map<Program>((obj) => Program.fromJson(obj)).toList();
  }

  static List<ProgramPhaseModel> _buildPhases(List nodes) {
    List<ProgramPhaseModel> result = new List<ProgramPhaseModel>();

    result = ProgramPhaseModel.fromJsonList(nodes);

    return result;
  }
}