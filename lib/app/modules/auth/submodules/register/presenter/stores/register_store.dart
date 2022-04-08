import '../../../../../../core/shared/failures/exceptions.dart';
import '../../../../../../core/shared/interfaces/notifier_store.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import 'helpers/params.dart';

class RegisterStore extends IBoardNotifierStore<bool> {
  RegisterStore(this._authService) : super(false);

  final IAuthService _authService;

  bool get isSuccess => state == true;

  Future<void> register(RegisterParam param) async {
    try {
      setLoading(true);
      final serviceParam = RegisterWithEmailParam(
        email: param.email,
        password: param.password,
      );
      await _authService.registerWithEmail(serviceParam);
      update(true);
    } on AuthException catch (err) {
      setError(err);
    } finally {
      setLoading(false);
    }
  }
}
