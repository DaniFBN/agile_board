import 'package:fpdart/fpdart.dart';

import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../helpers/params.dart';
import '../repositories/i_login_email_repository.dart';

abstract class ILoginEmailUsecase {
  Future<Either<IAppException, Unit>> call(LoginEmailParam param);
}

class LoginEmailUsecaseImpl implements ILoginEmailUsecase {
  const LoginEmailUsecaseImpl(this._repository);

  final ILoginEmailRepository _repository;

  @override
  Future<Either<IAppException, Unit>> call(LoginEmailParam param) {
    return _repository(param);
  }
}
