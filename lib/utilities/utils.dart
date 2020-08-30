class Utils {
  static String formatTimeShort(int time) {
    if(time  == null && time > 0) return '';

    Duration duration = Duration(seconds: time.round());

    String timeDisplay = "${duration.inSeconds.remainder(60)}s";

    if(time >= 60) {
      var minutes = duration.inMinutes > 0 ? '${duration.inMinutes}m' : '';
      var seconds = duration.inSeconds.remainder(60) > 0 ? ':${duration.inSeconds.remainder(60)}s' : '';
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
}
