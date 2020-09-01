import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kappi_training/models/exercise_model.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/app_theme.dart';
import 'package:kappi_training/utilities/utils.dart';

class ExerciseWidget extends StatelessWidget {
  final Exercise exercise;

  const ExerciseWidget({Key key, this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var time =
        exercise.time != null ? '${Utils.formatTimeShort(exercise.time)}' : '';
    var weight = exercise.weight != null ? '${exercise.weight}kg' : '';
    var sets = exercise.sets != null ? '${exercise.sets}' : '';
    var reps = exercise.reps != null ? 'x${exercise.reps}' : '';
    var equipment = exercise.equipment != null ? '${exercise.equipment}' : '';

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  child: Text(
                    exercise.order,
                    style: AppTheme.mediumTextDarkStyle(),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            exercise.name.toUpperCase(),
                            style: AppTheme.mediumTextDarkStyle(),
                          ),
                        ],
                      ),
                    ),
                    _buildSpace(exercise.time != null ||
                        exercise.weight != null ||
                        exercise.equipment != null),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          _buildExerciseDetail(
                              equipment, FontAwesomeIcons.tools),
                          _buildSpace(exercise.equipment != null),
                          _buildExerciseDetail(
                              time, FontAwesomeIcons.stopwatch),
                          _buildSpace(exercise.time != null),
                          _buildExerciseDetail(
                              weight, FontAwesomeIcons.weightHanging),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  sets + reps,
                  style: AppTheme.mediumTextDarkStyle(),
                ),
              ),
            ],
          ),
          _buildRest(),
        ],
      ),
    );
  }

  Widget _buildExerciseDetail(String text, IconData icon) {
    if (text.isNotEmpty) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey.withOpacity(0.1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, left: 2.0, right: 4),
              child: Icon(
                icon,
                color: AppColors.mainColor,
                size: 12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0),
              child: Text(
                text,
                style: AppTheme.smallTextDarkStyle(),
              ),
            ),
          ],
        ),
      );
    } else {
      return SizedBox();
    }
  }

  Widget _buildRest() {
    if (exercise.rest != null && exercise.rest > 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(children: <Widget>[
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: _divider()),
          ),
          Text(
            'Rest ${Utils.formatTimeShort(exercise.rest)}',
            style: AppTheme.mediumTextGreyStyle(),
          ),
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: _divider()),
          ),
        ]),
      );
    } else {
      return SizedBox();
    }
  }

  Widget _buildSpace(bool condition) {
    if (condition) {
      return SizedBox(
        height: 10,
      );
    } else {
      return SizedBox();
    }
  }

  Widget _divider() {
    return Divider(
      color: Colors.grey.withOpacity(0.5),
      height: 36,
    );
  }
}
