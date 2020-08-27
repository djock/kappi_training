import 'package:flutter/material.dart';
import 'package:kappi_training/models/program.dart';
import 'package:kappi_training/utilities/safe_screen.dart';
import 'package:kappi_training/widgets/program_phase_widget.dart';

class ProgramDetailsScreen extends StatelessWidget  {
  final Program programModel;

  const ProgramDetailsScreen({Key key, this.programModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeScreen(
        appBar: AppBar(
          title: Text(programModel.name),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
              children: _buildProgram(),
            )));
  }

  List<Widget> _buildProgram() {
    List<Widget> result = new List<Widget>();

    for(var item in programModel.phases) {
      result.add(ProgramPhaseWidget(phaseModel: item));
    }

    result.add(SizedBox(height: 5,));

    return result;
  }
}
