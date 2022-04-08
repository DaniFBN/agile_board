import '../../../domain/entities/user_entity.dart';

class LoginState {
  const LoginState();
}

class LoggedInState extends LoginState {
  const LoggedInState(this.user);

  final UserEntity user;
}

class LoggedOutState extends LoginState {
  const LoggedOutState();
}
