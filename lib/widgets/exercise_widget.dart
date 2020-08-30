import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kappi_training/models/exercise.dart';
import 'package:kappi_training/utilities/app_colors.dart';
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
                child: SizedBox(
                    child: Text(
                  exercise.order,
                  style: TextStyle(color: Colors.black45),
                )),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    _buildSpace(exercise.time != null || exercise.weight != null || exercise.equipment != null),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          _buildExerciseDetail(
                              equipment, FontAwesomeIcons.tools),
                          _buildSpace(exercise.equipment != null),

                          _buildExerciseDetail(
                              time, FontAwesomeIcons.hourglassHalf),
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
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
            color: Colors.grey.withOpacity(0.2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, left: 2.0, right: 4),
              child: Icon(
                icon,
                color: AppColors.mainColor,
                size: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0),
              child: Text(text),
            ),
          ],
        ),
      );
    } else {
      return SizedBox();
    }
  }

  Widget _buildRest() {
    if(exercise.rest != null && exercise.rest > 0) {
      return Row(children: <Widget>[
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
                color: Colors.grey.withOpacity(0.5),
                height: 36,
              )),
        ),
        Text('Rest ${Utils.formatTimeShort(exercise.rest)}', style: TextStyle(color: Colors.grey.withOpacity(0.5)),),
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Divider(
                color: Colors.grey.withOpacity(0.5),
                height: 36,
              )),
        ),
      ]);
    } else {
      return SizedBox();
    }

  }

  Widget _buildSpace(bool condition) {
    if(condition) {
      return SizedBox(height: 10,);
    } else {
      return SizedBox();
    }
  }
}
