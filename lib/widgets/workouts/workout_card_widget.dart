import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kappi_training/models/workout_model.dart';
import 'package:kappi_training/screens/workout_details_screen.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/app_theme.dart';
import 'package:kappi_training/utilities/utils.dart';
import 'package:kappi_training/widgets/info_text.dart';

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
        padding: EdgeInsets.all(20.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [AppColors.mainColor, Colors.redAccent])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              workout.name,
              style: AppTheme.headerLightStyle()
            ),
            SizedBox(height: 10,),
            InfoText(info: 'Type: ', value: workout.variation, icon: FontAwesomeIcons.shieldAlt,),
            InfoText(info: 'Time: ', value: Utils.formatTimeShort(workout.timeToComplete), icon: FontAwesomeIcons.stopwatch,),
          ],
        ),
      ),
    );
  }
}
