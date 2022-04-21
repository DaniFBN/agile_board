import '../../../../../../core/shared/failures/exceptions.dart';
import '../../../../../../core/shared/interfaces/notifier_store.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../../../../core/shared/value_objects/password_type.dart';
import '../../domain/helpers/params.dart';
import '../../domain/usecases/login_email_usecase.dart';
import 'helpers/params.dart';

class LoginStore extends IBoardNotifierStore<bool> {
  LoginStore({
    required ILoginEmailUsecase loginEmailUsecase,
  })  : _loginEmailUsecase = loginEmailUsecase,
        super(false);

  final ILoginEmailUsecase _loginEmailUsecase;

  Future<void> login(LoginParam param) async {
    setLoading(true);

    final serviceParam = LoginEmailParam(
      email: param.email,
      password: PasswordType(param.password),
    );
    final response = await _loginEmailUsecase(serviceParam);

    response.map((r) => true).fold(setError, update);

    setLoading(false);
  }
}
