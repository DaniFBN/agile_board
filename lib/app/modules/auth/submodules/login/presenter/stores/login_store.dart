import '../../../../../../core/shared/failures/exceptions.dart';
import '../../../../../../core/shared/interfaces/notifier_store.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import 'helpers/params.dart';

class LoginStore extends IBoardNotifierStore<bool> {
  LoginStore(this._authService) : super(false);

  final IAuthService _authService;

  Future<void> login(LoginParam param) async {
    try {
      setLoading(true);

      final serviceParam = LoginWithEmailParam(
        email: param.email,
        password: param.password,
      );
      await _authService.loginWithEmail(serviceParam);
      update(true);
    } on AuthException catch (err) {
      setError(err);
    } finally {
      setLoading(false);
    }
  }
}
