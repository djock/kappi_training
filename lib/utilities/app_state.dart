import 'package:kappi_training/models/user_model.dart';
import 'package:kappi_training/models/workout_model.dart';
import 'package:kappi_training/models/exercise_model.dart';
import 'package:kappi_training/models/program_model.dart';

class AppState {
  static List<ProgramModel> programs;
  static List<WorkoutModel> workouts;
  static List<WorkoutModel> individualWorkouts;
  static List<Exercise> exercises;

  static UserModel user;

  static WorkoutModel getWorkoutById(int id) {
    var workout = workouts.firstWhere((element) => element.id == id, orElse: null);

    return workout;
  }
}