import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:kappi_training/models/program_level_model.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/app_state.dart';
import 'package:kappi_training/widgets/programs/program_workout_widget.dart';

class ProgramLevelWidget extends StatelessWidget {
  final ProgramLevelModel levelModel;
  final String levelName;
  final int index;

  const ProgramLevelWidget(
      {Key key, this.levelModel, this.index, this.levelName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [AppColors.mainColor, AppColors.mainColor.withOpacity(0.8)])
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              tapBodyToCollapse: true,
              iconColor: AppColors.textColor,
            ),
            header: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: Text(
                        levelName + ' ' + index.toString(),
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: Text(
                        levelModel.workouts.length.toString() + ' workouts' ,
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            collapsed: SizedBox(
              height: 0,
            ),
            expanded: Container(
              child: Column(
                children: _buildWorkouts(),
              ),
            ),
            builder: (_, collapsed, expanded) {
              return Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(crossFadePoint: 0),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  List<Widget> _buildWorkouts() {
    List<Widget> result = new List<Widget>();

    for (var item in levelModel.workouts) {
      var workout = AppState.getWorkoutById(item);

      if (workout != null)
        result.add(ProgramWorkoutWidget(workoutModel: workout));
    }

    return result;
  }
}
