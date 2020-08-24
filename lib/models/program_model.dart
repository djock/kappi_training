import 'package:kappi_training/models/program_phase_model.dart';

enum programType { weightlifting, bodyweight, crossfit }
enum programPracticeType { constant }

class ProgramModel {
  final int id;
  final String name;
  final int phasesCount;
  final List<ProgramPhaseModel> phases;

  ProgramModel(this.id, this.name, this.phasesCount, this.phases);

  ProgramModel.fromJson(Map<String, dynamic> json) :
      id = json['id'],
      name = json['name'],
      phasesCount = json['levelsCount'],
      phases = _buildPhases(json['levels']);

  static List<ProgramModel> fromJsonList(json) {
    return json.map<ProgramModel>((obj) => ProgramModel.fromJson(obj)).toList();
  }

  static List<ProgramPhaseModel> _buildPhases(List nodes) {
    List<ProgramPhaseModel> result = new List<ProgramPhaseModel>();

    result = ProgramPhaseModel.fromJsonList(nodes);

    return result;
  }
}