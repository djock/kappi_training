import 'package:flutter/material.dart';
import 'package:kappi_training/screens/workout_details_screen.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/app_state.dart';
import 'package:kappi_training/utilities/app_theme.dart';

class WorkoutsVerticalListWidget extends StatelessWidget {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              'Workouts',
              style: AppTheme.headerDarkStyle(),
            )),
        Column(
          children: _buildIndividualWorkouts(),
        )
      ],
    );
  }

  List<Widget> _buildIndividualWorkouts() {
    List<Widget> result = new List<Widget>();

    for(var item in AppState.individualWorkouts) {
      result.add(ListTile(
          leading: SizedBox(
              child: IconButton(
                icon: Icon(Icons.filter_tilt_shift, color: AppColors.mainColor),
                onPressed: null,
              )),
          title: Text(
              item.name),
          onTap: () {
            Navigator.push(
                _context,
                MaterialPageRoute(
                    builder: (context) => WorkoutDetailsScreen(
                      workout: item,
                    )));
          }
      ));
    }

    return result;

  }
}