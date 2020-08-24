import 'package:flutter/material.dart';
import 'package:kappi_training/models/activity_model.dart';
import 'package:kappi_training/utilities/app_state.dart';
import 'package:kappi_training/utilities/safe_screen.dart';

class ActivityDetailsScreen extends StatelessWidget {
  final ActivityModel activityModel;

  const ActivityDetailsScreen({Key key, this.activityModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeScreen(
        appBar: AppBar(
          title: Text(activityModel.name),
          centerTitle: true,
        ),
        body: Container(
            child: ListView.builder(
                itemCount: activityModel.exercises.length,
                itemBuilder: (BuildContext context, int index) {
                  var time = activityModel.exercises[index].time != null ? ' ${activityModel.exercises[index].time} seconds' : '';
                  var weight = activityModel.exercises[index].weight != null ? ' ${activityModel.exercises[index].weight} kg' : '';

                  return ListTile(
                      leading: SizedBox(
                          child: IconButton(
                        icon: Icon(Icons.fitness_center, color: Colors.red),

                        onPressed: null, // null disables the button
                      )),
                      title: Text(activityModel.exercises[index].name +
                          ' ' +
                          activityModel.exercises[index].sets.toString() +
                          'x' +
                          activityModel.exercises[index].reps.toString() + time + weight
                      ),
                      onTap: null);
                })));
  }
}
