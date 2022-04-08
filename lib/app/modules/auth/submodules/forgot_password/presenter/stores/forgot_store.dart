import '../../../../../../core/shared/failures/exceptions.dart';
import '../../../../../../core/shared/interfaces/notifier_store.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';

class ForgotStore extends IBoardNotifierStore<bool> {
  ForgotStore(this._authService) : super(false);

  final IAuthService _authService;

  Future<void> sendResetEmail(String email) async {
    try {
      setLoading(true);

      await _authService.forgotPassword(email);
      update(true);
    } on AuthException catch (err) {
      setError(
        err,
      );
    } finally {
      setLoading(false);
    }
  }
}
