import 'dart:math';

import 'package:flutter/material.dart';

import 'app_colors.dart';

class Utils {
  static String formatTimeShort(int time) {
    if (time == null && time > 0) return '';

    Duration duration = Duration(seconds: time.round());

    String timeDisplay = "${duration.inSeconds.remainder(60)}s";

    if (time >= 60) {
      var minutes = duration.inMinutes > 0 ? '${duration.inMinutes}m' : '';
      var seconds = duration.inSeconds.remainder(60) > 0
          ? ':${duration.inSeconds.remainder(60)}s'
          : '';
      timeDisplay = "$minutes$seconds";
    }

    // more than 1 hour
    if (time >= 60 * 60) {
      timeDisplay = "${duration.inHours}h:${duration.inMinutes.remainder(60)}m";
    }

    // more than 1 day
    if (time >= 60 * 60 * 24) {
      timeDisplay = "${duration.inDays}d:${duration.inHours}h";
    }

    return timeDisplay;
  }

  static String getLoadingScreenText() {
    String result;

    List<String> loadingScreenTexts = [
      'Make it count!',
      'Until the last rep!',
      'Hard work pays off',
      'Warming up...',
      'Executing the last 2 reps'
    ];
    final _random = new Random();
    result = loadingScreenTexts[_random.nextInt(loadingScreenTexts.length)];

    return result;
  }

  static AppBar buildAppBar(BuildContext context, String text) => AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.mainColor,
        ),
        title: Text(
          text,
          style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        centerTitle: true,
      );
}
