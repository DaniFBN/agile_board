import 'package:fpdart/fpdart.dart';

import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../../domain/helpers/params.dart';
import '../../domain/repositories/i_login_email_repository.dart';
import '../datasources/i_login_email_datasource.dart';

class LoginEmailRepositoryImpl implements ILoginEmailRepository {
  const LoginEmailRepositoryImpl(this._datasource);

  final ILoginEmailDatasource _datasource;

  @override
  Future<Either<IAppException, Unit>> call(LoginEmailParam param) async {
    try {
      await _datasource(param);
      return const Right(unit);
    } on IAppException catch (err) {
      return Left(err);
    }
  }
}
