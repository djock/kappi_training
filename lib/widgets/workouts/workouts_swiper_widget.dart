import 'package:flutter/material.dart';
import 'package:kappi_training/models/workout_model.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/app_state.dart';
import 'package:kappi_training/utilities/app_theme.dart';
import 'package:kappi_training/widgets/workouts/workout_card_widget.dart';

class WorkoutsSwiperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<WorkoutModel> _workouts = AppState.workouts.where((element) => element.canSolo).toList();;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              'Workouts',
              style: AppTheme.headerDarkStyle(),
            )),
        Container(
          height: 200,
          child:  ListView.builder(
            padding: EdgeInsets.only(top: 0),
            scrollDirection: Axis.horizontal,
            itemCount: _workouts.length,
            itemBuilder: (BuildContext context, int index) {
              return WorkoutCardWidget(workout: _workouts[index],);
            },
          ),
        ),
      ],
    );
  }
}
