abstract class IAuthService {
  Future<void> loginWithEmail(LoginWithEmailParam param);
  Future<void> registerWithEmail(RegisterWithEmailParam param);
  Future<void> forgotPassword(String email);
  UserEntityService? getCurrentUser();
}

class UserEntityService {
  UserEntityService(this.email);

  final String email;
}

class LoginWithEmailParam {
  const LoginWithEmailParam({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class RegisterWithEmailParam {
  const RegisterWithEmailParam({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
