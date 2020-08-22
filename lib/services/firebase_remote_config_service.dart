import 'dart:async';
import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:kappi_training/models/program_model.dart';

class FirebaseRemoteConfigService {
  static List<ProgramModel> programs;

  static Future<bool> init() async {
    var remoteConfig = await RemoteConfig.instance;

    await remoteConfig.fetch(expiration: const Duration(seconds: 0));
    await remoteConfig.activateFetched();
    var programsList = remoteConfig.getString('programs');
    var programsNode = json.decode(programsList);

    programs = ProgramModel.fromJsonList(programsNode);

    return true;
  }
}
