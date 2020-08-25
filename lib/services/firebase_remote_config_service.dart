import 'dart:async';
import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
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
    _getIndividualWorkouts();
  }

  static void _getPrograms() {
    var remoteConfigValue = _remoteConfig.getString('training_programs');
    var jsonData = json.decode(remoteConfigValue);

    AppState.programs = Program.fromJsonList(jsonData);
  }

  static void _getActivities() {
    var remoteConfigValue = _remoteConfig.getString('workouts');
    var jsonData = json.decode(remoteConfigValue);

    AppState.activities = Workout.fromJsonList(jsonData);
  }

  static void _getIndividualWorkouts() {
    var remoteConfigValue = _remoteConfig.getString('individual_workouts');
    var jsonData = json.decode(remoteConfigValue);

    AppState.individualWorkouts = Workout.fromJsonList(jsonData);
  }
}
