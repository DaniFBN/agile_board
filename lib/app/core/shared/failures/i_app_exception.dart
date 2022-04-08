abstract class IAppException implements Exception {
  const IAppException({required this.message, required this.stackTrace});

  final String message;
  final StackTrace? stackTrace;
}
