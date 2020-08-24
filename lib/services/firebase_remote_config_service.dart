import 'dart:async';
import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:kappi_training/models/workout.dart';
import 'package:kappi_training/models/program.dart';
import 'package:kappi_training/utilities/app_state.dart';

class FirebaseRemoteConfigService {
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
  }

  static void _getPrograms() {
    var programsList = _remoteConfig.getString('programs');
    var programsNode = json.decode(programsList);

    AppState.programs = Program.fromJsonList(programsNode);
  }

  static void _getActivities() {
    var programsList = _remoteConfig.getString('activities');
    var programsNode = json.decode(programsList);

    AppState.activities = Workout.fromJsonList(programsNode);
  }

//  static void _getActivities() {
//    var programsList = _remoteConfig.getString('programs');
//    var programsNode = json.decode(programsList);
//
//    programs = ProgramModel.fromJsonList(programsNode);
//  }
}
