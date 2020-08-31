import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kappi_training/models/workout_model.dart';
import 'package:kappi_training/screens/workout_details_screen.dart';
import 'package:kappi_training/utilities/app_colors.dart';

class ProgramWorkoutWidget extends StatelessWidget {
  final WorkoutModel workoutModel;

  const ProgramWorkoutWidget({Key key, this.workoutModel}) : super(key: key);
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
          margin: EdgeInsets.only(left: 10, right: 10, top: 13),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
//                gradient: LinearGradient(
//                    begin: Alignment.topRight,
//                    end: Alignment.bottomLeft,
//                    colors: [
//                      AppColors.mainColor,
//                      AppColors.mainColor.withOpacity(0.8)
//                    ])
            ),
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
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    _buildInfoText(
                        'Exercises: ',
                        workoutModel.exercises.length.toString(),
                        FontAwesomeIcons.info),
                    _buildInfoText(
                        'Type: ', workoutModel.type, FontAwesomeIcons.shieldAlt)
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildInfoText(String info, String value, IconData icon) {
    if (value.isNotEmpty && value != '1') {
      return Row(
        children: <Widget>[
          Icon(
            icon,
            color: AppColors.textColor,
            size: 14,
          ),
          SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Text(
              info + ' ' + value,
              style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }
}
