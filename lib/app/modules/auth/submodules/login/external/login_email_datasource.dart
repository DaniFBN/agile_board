import 'package:fpdart/fpdart.dart';

import '../../../../../core/shared/services/auth/i_auth_service.dart';
import '../domain/helpers/params.dart';
import '../infra/datasources/i_login_email_datasource.dart';

class LoginEmailDatasourceImpl implements ILoginEmailDatasource {
  const LoginEmailDatasourceImpl({
    required IAuthService authService,
  }) : _authService = authService;

  final IAuthService _authService;

  @override
  Future<Unit> call(LoginEmailParam param) async {
    final serviceParam = LoginWithEmailParam(
      email: param.email,
      password: param.password.value,
    );
    await _authService.loginWithEmail(serviceParam);

    return unit;
  }
}
