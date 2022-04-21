import 'package:firebase_auth/firebase_auth.dart';

import '../../failures/exceptions.dart';
import '../../wrappers/log/board_log.dart';
import 'i_auth_service.dart';

class FirebaseAuthService implements IAuthService {
  const FirebaseAuthService(this._auth);

  final FirebaseAuth _auth;

  @override
  Future<void> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e, stackTrace) {
      BoardLog.error(e.code);
      switch (e.code) {
        case 'invalid-email':
          throw AuthException(
            message: 'E-mail inválido',
            stackTrace: stackTrace,
          );
        case 'user-not-found':
          throw AuthException(
            message: 'Usuário não encontrado',
            stackTrace: stackTrace,
          );
        default:
          throw AuthException(
            message: 'Erro no reset da senha',
            stackTrace: stackTrace,
          );
      }
    }
  }

  @override
  Future<void> loginWithEmail(LoginWithEmailParam param) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: param.email,
        password: param.password,
      );
    } on FirebaseAuthException catch (e, stackTrace) {
      switch (e.code) {
        case 'invalid-email':
          throw AuthException(
            message: 'E-mail inválido',
            stackTrace: stackTrace,
          );
        case 'user-not-found':
          throw AuthException(
            message: 'Usuário não encontrado',
            stackTrace: stackTrace,
          );
        case 'wrong-password':
          throw AuthException(
            message: 'Senha incorreta',
            stackTrace: stackTrace,
          );
        case 'user-disabled':
          throw AuthException(
            message: 'Usuário desabilitado',
            stackTrace: stackTrace,
          );
        default:
          throw AuthException(
            message: 'Erro no login',
            stackTrace: stackTrace,
          );
      }
    }
  }

  @override
  Future<void> registerWithEmail(RegisterWithEmailParam param) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: param.email,
        password: param.password,
      );
    } on FirebaseAuthException catch (e, stackTrace) {
      BoardLog.error(e.code);
      switch (e.code) {
        case 'invalid-email':
          throw AuthException(
            message: 'E-mail inválido',
            stackTrace: stackTrace,
          );
        case 'email-already-in-use':
          throw AuthException(
            message: 'E-mail já está em uso',
            stackTrace: stackTrace,
          );
        case 'weak-password':
          throw AuthException(
            message: 'Senha fraca',
            stackTrace: stackTrace,
          );
      }
    }
  }

  @override
  UserEntityService? getCurrentUser() {
    final user = _auth.currentUser;
    if (user == null) return null;

    return UserEntityService(user.email!);
  }
}
