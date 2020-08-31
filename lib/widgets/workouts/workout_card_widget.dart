import 'package:flutter/material.dart';
import 'package:kappi_training/models/workout_model.dart';
import 'package:kappi_training/screens/workout_details_screen.dart';
import 'package:kappi_training/utilities/app_colors.dart';

class WorkoutCardWidget extends StatelessWidget {
  final WorkoutModel workout;

  const WorkoutCardWidget({Key key, this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WorkoutDetailsScreen(
                      workout: workout,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 13),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: 150,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.orangeAccent, Colors.redAccent])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              workout.name,
              style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(workout.type,
              style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
