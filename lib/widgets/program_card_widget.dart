import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kappi_training/models/program.dart';
import 'package:kappi_training/screens/program_details_screen.dart';
import 'package:kappi_training/utilities/app_colors.dart';

class ProgramCardWidget extends StatelessWidget {
  final Program program;
  final bool isFavourite;

  const ProgramCardWidget({Key key, this.program, this.isFavourite}) : super(key: key);

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
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [AppColors.mainColor, isFavourite ? Colors.red : Colors.blueAccent])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                  leading: SizedBox(
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.info,
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
                      icon: Icon(FontAwesomeIcons.at,
                          color: AppColors.textColor),
                      onPressed: null,
                    )),
                title: Text(
                  'From ' + program.author,
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
      ),
    );
  }

}