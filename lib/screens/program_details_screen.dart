import 'package:flutter/material.dart';
import 'package:kappi_training/models/program.dart';
import 'package:kappi_training/utilities/safe_screen.dart';
import 'package:kappi_training/widgets/program_phase_widget.dart';

class ProgramDetailsScreen extends StatelessWidget  {
  final Program programModel;

  const ProgramDetailsScreen({Key key, this.programModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _phases = programModel.phases;

    return SafeScreen(
        appBar: AppBar(
          title: Text(programModel.name),
          centerTitle: true,
        ),
        body: Container(
            child: ListView.builder(
                itemCount: _phases.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProgramPhaseWidget(phaseModel: _phases[index]);
                })));
  }
}
