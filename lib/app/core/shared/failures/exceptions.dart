import 'i_app_exception.dart';

class AppException extends IAppException {
  const AppException({
    required String message,
    required StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class AuthException extends AppException {
  const AuthException({
    required String message,
    required StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class RepositoryException extends AppException {
  RepositoryException({
    required String message,
    required StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class FailedUpdateException extends RepositoryException {
  FailedUpdateException({
    required String message,
    required StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
