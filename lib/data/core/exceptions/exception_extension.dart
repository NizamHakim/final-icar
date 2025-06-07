extension FormattedMessage on Exception {
  String get getCleanMessage {
    if (toString().startsWith("Exception: ")) {
      return toString().substring(11);
    } else {
      return toString();
    }
  }
}
