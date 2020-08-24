import 'package:flutter/material.dart';
import 'package:kappi_training/screens/program_details_screen.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/app_state.dart';
import 'package:kappi_training/utilities/safe_screen.dart';

class ProgramsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _programs = AppState.programs;

    return SafeScreen(
        appBar: AppBar(
          title: Text('Programs'),
          centerTitle: true,
        ),
        body: Container(
            child: ListView.builder(
                itemCount: _programs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Theme.of(context).canvasColor,
                    margin: EdgeInsets.only(left: 10, right: 10, top: 13),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: ListTile(
                        leading: SizedBox(
                            child: IconButton(
                              icon: Icon(Icons.fitness_center, color: AppColors.mainColor),
                              onPressed: null,
                            )),
                        title: Text(_programs[index].name),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProgramDetailsScreen(
                                    programModel: _programs[index],
                                  )));
                        }),
                  );
                })));
  }
}
