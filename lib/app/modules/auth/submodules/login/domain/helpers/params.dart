import '../../../../../../core/shared/value_objects/password_type.dart';

class LoginEmailParam {
  const LoginEmailParam({
    required this.email,
    required this.password,
  });

  final String email;
  final PasswordType password;
}
