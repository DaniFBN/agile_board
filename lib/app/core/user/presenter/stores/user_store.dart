import '../../../shared/interfaces/notifier_store.dart';
import '../../../shared/services/auth/i_auth_service.dart';
import '../../domain/entities/user_entity.dart';
import 'states/user_state.dart';

class UserStore extends IBoardNotifierStore<LoginState> {
  UserStore(this._authService) : super(const LoggedOutState());

  final IAuthService _authService;

  bool get isLogged => state is LoggedInState;

  void loadUserData() {
    final user = _authService.getCurrentUser();

    if (user == null) return update(const LoggedOutState());

    final userEntity = UserEntity(email: user.email);
    update(LoggedInState(userEntity));
  }
}
