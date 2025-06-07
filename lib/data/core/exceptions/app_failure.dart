class AppFailure {
  const AppFailure([this.message = 'An unexpected error occured!']);

  final String message;

  @override
  String toString() => 'AppFailure(message: $message)';

  String get cleanMessage {
    if (message.startsWith('Exception:')) {
      return message.substring('Exception:'.length).trim();
    }
    return message;
  }
}
