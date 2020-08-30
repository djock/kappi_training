import 'package:flutter/material.dart';
import 'package:kappi_training/models/workout.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/app_state.dart';
import 'package:kappi_training/widgets/workout_card_widget.dart';

class WorkoutsSwiperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Workout> _workouts = AppState.individualWorkouts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              'Workouts',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.mainColor),
            )),
        Container(
          height: 120,
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
