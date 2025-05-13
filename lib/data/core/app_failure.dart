class AppFailure {
  const AppFailure([this.message = 'An unexpected error occured!']);

  final String message;

  @override
  String toString() => 'AppFailure(message: $message)';
}
