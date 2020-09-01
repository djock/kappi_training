import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kappi_training/models/workout_model.dart';
import 'package:kappi_training/screens/workout_details_screen.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/app_theme.dart';
import 'package:kappi_training/widgets/info_text.dart';

class ProgramWorkoutWidget extends StatelessWidget {
  final WorkoutModel workoutModel;
  final bool isNested; // we use this to set the color

  const ProgramWorkoutWidget({Key key, this.workoutModel, this.isNested})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WorkoutDetailsScreen(
                        workout: workoutModel,
                      )));
        },
        child: Card(
          elevation: 0,
          margin: EdgeInsets.only(left: 10, right: 10, top: 13),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: isNested ? Colors.transparent : null,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.orangeAccent.withOpacity(0.2), width: 2),
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      isNested ? AppColors.mainColor.withOpacity(0.2) : AppColors.mainColor,
                      isNested ?  AppColors.mainColor.withOpacity(0.2) : Colors.redAccent
                    ])),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        workoutModel.name,
                        style: AppTheme.headerLightStyle(),
                      ),
                    ),
                    InfoText(info: 'Exercises: ', value: workoutModel.exercises.length.toString(), icon: FontAwesomeIcons.info,),
                    InfoText(info: 'Type: ', value: workoutModel.type, icon: FontAwesomeIcons.shieldAlt,)
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
