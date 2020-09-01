import 'dart:async';
import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:kappi_training/models/user_model.dart';
import 'package:kappi_training/models/workout_model.dart';
import 'package:kappi_training/models/program_model.dart';
import 'package:kappi_training/utilities/app_state.dart';

class RemoteConfigService {
  static RemoteConfig _remoteConfig;

  static Future<bool> init() async {
    _remoteConfig = await RemoteConfig.instance;

    await _remoteConfig.fetch(expiration: const Duration(seconds: 0));
    await _remoteConfig.activateFetched();

    _getRemoteConfigData();

    return true;
  }

  static void _getRemoteConfigData() {
    _getPrograms();
    _getActivities();
    _getUser();
  }

  static void _getPrograms() {
    var remoteConfigValue = _remoteConfig.getString('programs');
    var jsonData = json.decode(remoteConfigValue);

    AppState.programs = ProgramModel.fromJsonList(jsonData);
  }

  static void _getActivities() {
    var remoteConfigValue = _remoteConfig.getString('workouts');
    var jsonData = json.decode(remoteConfigValue);

    AppState.workouts = WorkoutModel.fromJsonList(jsonData);
  }

  static void _getUser() {
    var remoteConfigValue = _remoteConfig.getString('user');
    var jsonData = json.decode(remoteConfigValue);

    AppState.user = UserModel.fromJson(jsonData);
  }

}
