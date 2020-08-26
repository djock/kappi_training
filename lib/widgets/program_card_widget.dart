import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kappi_training/models/program.dart';
import 'package:kappi_training/screens/program_details_screen.dart';
import 'package:kappi_training/utilities/app_colors.dart';

class ProgramCardWidget extends StatelessWidget {
  final Program program;

  const ProgramCardWidget({Key key, this.program}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProgramDetailsScreen(
                  programModel: program,
                )));
      },
      child: new Card(
        color: AppColors.mainColor,
        margin: EdgeInsets.only(left: 10, right: 10, top: 13),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
                leading: SizedBox(
                    child: IconButton(
                      icon: Icon(Icons.fitness_center,
                          color: AppColors.textColor),
                      onPressed: null,
                    )),
                title: Text(
                  program.name,
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Text('Type: ' +
                    program.type,
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                ),
                onTap: null),
            ListTile(
              leading: SizedBox(
                  child: IconButton(
                    icon: Icon(Icons.account_circle,
                        color: AppColors.textColor),
                    onPressed: null,
                  )),
              title: Text(
                'Created by ' + program.author,
                style: TextStyle(color: AppColors.textColor),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProgramDetailsScreen(
                              programModel: program,
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }

}