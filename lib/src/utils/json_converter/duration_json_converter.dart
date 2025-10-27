Duration? durationFromJson(int? seconds) {
  if (seconds == null) return null;
  return Duration(seconds: seconds);
}

int? durationToJson(Duration? duration) {
  if (duration == null) return null;
  return duration.inSeconds;
}
